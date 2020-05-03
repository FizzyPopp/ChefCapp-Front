//import 'package:brew_crew/models/brew.dart';
//import 'package:brew_crew/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// https://github.com/iamshaunjp/flutter-firebase
// https://www.youtube.com/watch?v=_SHssHJJhAI&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC&index=10

// THIS AND auth.dart ARE FROM THE TUTORIAL ABOVE
// NEED TO CONVERT PROVIDER TYPE THINGS, CAN GET RID OF MOST STREAMS

class DatabaseService {

  /*
  - holds all db access functions, regardless of screen or controller
  - ensures consistent and ordered access
  ( what is currently here is ripped from a tutorial, and not actually to be used; it's just for learning )
   */

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  /*
  // get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
        .map(_brewListFromSnapshot);
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Brew(
          name: doc.data['name'] ?? '',
          strength: doc.data['strength'] ?? 0,
          sugars: doc.data['sugars'] ?? '0'
      );
    }).toList();
  }
   */

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