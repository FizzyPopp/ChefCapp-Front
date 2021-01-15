import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chef_capp/index.dart';

/// Controllers have no concept of the database, instead they use this class for all data calls, including calls to local storage (yet to be implemented)
/// Flutter firebase handles local db caching automagically, so no need to worry about that
/// This class holds all CRUD actions, regardless of screen or controller, ensuring consistent and orderly access
/// Methods from this class should always be called within a try / catch block

// what do we actually need to store on the device?
// want: all recipe titles (and maybe tags, and maybe ingredients) and uuids
// maybe even full recipes, depending on size of db
// want: most recent favourites and history, store images to file
// we definitely need a toJson() and fromJson() for each model
// then these strings can be stored in: sql, nosql, individual files, or one giant file
// need to store preferences locally in case they sign in anonymously

class DatabaseService {
  FirebaseAuth _auth;
  User _user;
  SharedPreferences _localStore;

  Future<bool> init() async {
    bool appStarted = await ParentService.init();
    if (!appStarted) {
      return false;
    }
    LoginState loginState = ParentService.auth.getLoginState();
    if (loginState == LoginState.LoggingIn) {
      while (loginState == LoginState.LoggingIn) {
        await Future.delayed(Duration(milliseconds: 10));
      }
    }
    if (loginState == LoginState.LoggedIn) {
      return true;
    } else {
      return false;
    }
  }

  Future<SharedPreferences> _getLocalStore() async {
    if (_localStore == null) {
      _localStore = await SharedPreferences.getInstance();
    }
    return _localStore;
  }

  // I'm not happy with this, it needs to be more robust ("appUser" should be a constant?)
  Future<AppUser> loadAppUser() async {
    SharedPreferences store = await _getLocalStore();
    return AppUser.fromJson(jsonDecode(store.getString("appUser")));
  }

  // ditto
  Future<void> storeAppUser(AppUser u) async {
    SharedPreferences store = await _getLocalStore();
    store.setString("appUser", jsonEncode(u.toJson()));
  }

  Future<RecipePreview> getTestRecipePreview() async {
    await init();

    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('recipes').doc('f680874b-cb0b-4b25-ba74-a8ed39824202').get();
    String imgURL = await getImageURL('img/recipes/f680874b-cb0b-4b25-ba74-a8ed3982420.jpg');

    if (!snapshot.exists) {
      throw ("Document does not exist");
    }

    return RecipePreview.fromDB(snapshot.data, imgURL);
  }

  Future<List<RecipePreview>> getRecipePreviews() async {
    await init();

    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('recipe').get();
    String imgURL = await getImageURL('img/recipes/f680874b-cb0b-4b25-ba74-a8ed3982420.jpg');

    List<RecipePreview> out = [];
    for (QueryDocumentSnapshot qds in snapshot.docs) {
      out.add(RecipePreview.fromDB(qds.data(), imgURL));
    }

    return out;
  }

  Future<Recipe> getRecipeFromPreview(RecipePreview rp) async {
    await init();

    // later on some documents might not be a step, but don't worry about it for now
    QuerySnapshot qs = await FirebaseFirestore.instance.collection('step').where('id', whereIn: rp.stepIDs).get();

    // find the most recent version of each step and save it to "unique"
    List<Map<String, dynamic>> unique = List<Map<String, dynamic>>();
    List<int> covered = [];
    for (int i = 0; i < qs.docs.length; i++) {
      if (covered.contains(i)) {
        continue;
      }
      covered.add(i);
      int mostRecent = i;
      for (int j = i+1; j < qs.docs.length; j++) {
        if (qs.docs[j].data()["id"] == qs.docs[mostRecent].data()["id"]) {
          covered.add(j);
          if (qs.docs[j].data()["timestamp"] > qs.docs[mostRecent].data()["timestamp"]) {
            mostRecent = j;
          }
        }
      }
      unique.add(qs.docs[mostRecent].data());
    }

    if (unique.length != rp.stepIDs.length) {
      throw ("Did not fetch correct number of steps from the DB");
    }

    List<Map<String, dynamic>> uniqueInOrder = [];
    if (unique.length > 0) {
      Map<String, dynamic> r = unique.firstWhere((j) => j["previous"] == ID.nilUUID());
      while (r != null) {
        uniqueInOrder.add(r);
        if (r["next"] == ID.nilUUID()) {
          break;
        }
        r = unique.firstWhere((j) => j["previous"] == r["id"], orElse: () => null);
      }

      if (uniqueInOrder.length != unique.length) {
        throw("Did not order the correct number of steps");
      }
    }

    List<RecipeStep> steps = [];
    for (var d in uniqueInOrder) {
      steps.add(RecipeStep.fromDB(d, rp));
    }

    return Recipe.fromPreview(rp, steps);
  }

  Future<String> getImageURL(String path) async {
    await init();
    final ref = FirebaseStorage.instance.ref().child(path);
    String url = await ref.getDownloadURL();
    return url;
  }
}