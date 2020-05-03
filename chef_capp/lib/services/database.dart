//import 'package:brew_crew/models/brew.dart';
//import 'package:brew_crew/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chef_capp/index.dart';

// https://github.com/iamshaunjp/flutter-firebase
// https://www.youtube.com/watch?v=_SHssHJJhAI&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC&index=10

// THIS AND auth.dart ARE FROM THE TUTORIAL ABOVE
// NEED TO CONVERT PROVIDER TYPE THINGS, CAN GET RID OF MOST STREAMS

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference recipeCollection = Firestore.instance.collection('recipes');

  Future<void> updateUserData(User user) async {
    return await recipeCollection.document(uid).setData(
      
    );
  }





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
          doc.data['blurb'] ?? '',
          doc.data['tags'] ?? [],
          doc.data['ingredients'] ?? []
      );
    }).toList();
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

class QuerySnapshotTransformer<QuerySnapshots, Recipe> {
  var snaps = recipeCollection.snapshots();

}