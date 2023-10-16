import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_api/models/appName.dart';
import 'package:flutter_api/models/user.dart';

class DatabaseService {
  final String uid;
  
  DatabaseService({required this.uid});

  // Collection reference
  final CollectionReference myCollection =
      FirebaseFirestore.instance.collection('mydata');

  Future<void> updateUserData(
      String sugars, String name, int strength) async {
    return await myCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // Brew list from snapshot
  List<MyDatabase> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MyDatabase(
        name: doc.get('name') ?? '',
        strength: doc.get('strength') ?? 0,
        sugars: doc.get('sugars') ?? '0',
      );
    }).toList();
  }

  // User data from snapshot
  MyUserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return MyUserData(
      uid: uid,
      name: snapshot.get('name'),
      sugars: snapshot.get('sugars'),
      strength: snapshot.get('strength'),
    );
  }

  // Get brews stream
  Stream<List<MyDatabase>> get brews {
    return myCollection.snapshots().map(_brewListFromSnapshot);
  }

  // Get user doc stream
  Stream<MyUserData> get userData {
    return myCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}