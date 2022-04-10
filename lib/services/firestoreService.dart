import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medpoint/models/user.dart';

class FirestoreService {
  final CollectionReference _userCollectionReference =
      FirebaseFirestore.instance.collection("users");

  Future createUser(Individual individual) async {
    try {
      await _userCollectionReference
          .doc(individual.id)
          .set(individual.toJson());
    } catch (e) {
      return e;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _userCollectionReference.doc(uid).get();
      return Individual.fromData(userData.data as Map<String, Object>);
    } catch (e) {
      return e;
    }
  }
}
