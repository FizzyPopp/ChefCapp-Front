import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;
  SharedPreferences _localStore;

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

  Future<bool> signInAnon() async {
    if (_user == null) {
      try {
        _user = (await _auth.signInAnonymously()).user;
        ParentController.analytics.logLogin(loginMethod: "anonymous");
      } catch (e) {
        print(e);
      }
    }
    return (_user != null);
  }

  Future<RecipePreview> getTestRecipePreview() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('recipes').doc('f680874b-cb0b-4b25-ba74-a8ed39824202').get();
    String imgURL = await getImageURL('img/recipes/f680874b-cb0b-4b25-ba74-a8ed3982420.jpg');

    if (!snapshot.exists) {
      throw ("Document does not exist");
    }

    return RecipePreview.fromDB(snapshot.data, imgURL);
  }

  Future<Recipe> getRecipeFromPreview(RecipePreview rp) async {
    // later on some documents might not be a step, but don't worry about it for now
    QuerySnapshot qs = await FirebaseFirestore.instance.collection('components').where('id', whereIn: rp.componentIDs).get();

    if (qs.docs.length != rp.componentIDs.length) {
      throw ("Did not fetch correct number of components from the DB");
    }

    List<RecipeStep> steps = [];
    for (var d in qs.docs) {
      steps.add(RecipeStep.fromDB(d.data, rp));
    }

    return Recipe.fromPreview(rp, steps);
  }

  Future<String> getImageURL(String path) async {
    final ref = FirebaseStorage.instance.ref().child(path);
    String url = await ref.getDownloadURL();
    return url;
  }
}