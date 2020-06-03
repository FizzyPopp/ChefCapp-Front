import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chef_capp/index.dart';

/// Controllers have no concept of the database, instead they use this class for all remote calls
/// This class holds all db CRUD actions, regardless of screen or controller
/// ensures consistent and orderly access
class DatabaseService {
  // ( most of below is ripped from a tutorial, and not actually to be used; it's just for learning )
  final String uid;

  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference recipeCollection = Firestore.instance.collection('recipes');
  final CollectionReference stepsCollection = Firestore.instance.collection('recipes');

  /*Future<void> updateUserData(User user) async {

    return await recipeCollection.document(uid).setData(

    );
  }*/

  Stream<List<Recipe>> get recipeList {
    return recipeCollection.snapshots()
        .map(_recipeListFromSnapshot);
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

  RecipeStep getSteps(Recipe r) {

    return
  }

  /*
  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        sugars: snapshot.data['sugars'],
        strength: snapshot.data['strength']
    );
  }

  // get user doc stream
  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }
   */
}

/*
class QuerySnapshotTransformer<QuerySnapshots, Recipe> {
  var snaps = recipeCollection.snapshots();

}*/
