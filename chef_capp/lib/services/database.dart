import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chef_capp/index.dart';

/// Controllers have no concept of the database, instead they use this class for all data calls, including calls to local storage
/// This class holds all CRUD actions, regardless of screen or controller, ensuring consistent and orderly access
/// secretly checks to see if a cached version of the item is available

// should have a dedicated class to translate db to model for each relevant call?
// most of this class is from a tutorial and only for illustration
class DatabaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;

  Future<bool> signInAnon() async {
    if (_user == null) {
      try {
        _user = (await _auth.signInAnonymously()).user;
      } catch (e) {
        print(e);
      }
    }
    return (_user != null);
  }

  Future<RecipePreview> getTestRecipePreview() async {
    DocumentSnapshot snapshot = await Firestore.instance.collection('recipes').document('f680874b-cb0b-4b25-ba74-a8ed39824202').get();
    String imgURL = await getActualImageURL('img/recipes/f680874b-cb0b-4b25-ba74-a8ed3982420.jpg');

    if (!snapshot.exists) {
      throw ("Document does not exist");
    }

    return RecipePreview.fromDB(snapshot.data, imgURL);
  }

  Future<Recipe> getRecipeFromPreview(RecipePreview rp) async {
    // later on some documents might not be a step, but don't worry about it for now
    QuerySnapshot qs = await Firestore.instance.collection('components').where('id', whereIn: rp.componentIDs).getDocuments();

    if (qs.documents.length != rp.componentIDs.length) {
      throw ("Did not fetch correct number of components from the DB");
    }

    List<RecipeStep> steps = [];
    for (var d in qs.documents) {
      steps.add(RecipeStep.fromDB(d.data, rp));
    }

    return Recipe.fromPreview(rp, steps);
  }

  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    //return user != null ? User(uid: user.uid) : null;
    return null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      // create a new document for the user with the uid
      //await DatabaseService(uid: user.uid).updateUserData('0','new crew member', 100);
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // will this work to load images async from text?
  Future<String> getActualImageURL(String path) async {
    final ref = FirebaseStorage.instance.ref().child(path);
    String url = await ref.getDownloadURL() as String;
    return url;
  }

  /*
  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  // get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
        .map(_brewListFromSnapshot);
  }

  // brew list from snapshot
  List<Recipe> _recipeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      print(doc.data);
      return Recipe(
          doc.data['id'] ?? '',
          doc.data['title'] ?? '',
          doc.data['prepTime'] ?? 0,
          //doc.data['blurb'] ?? '',
          doc.data['tags'] ?? [],
          doc.data['ingredients'] ?? []
      );
    }).toList();
  }
   */
}
