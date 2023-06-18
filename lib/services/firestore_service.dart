import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medpoint/models/user.dart';

class FirestoreService {
  final CollectionReference _userCollectionReference =
      FirebaseFirestore.instance.collection("users");

  // This method is used to create a new user in firebase and store the user's information
  Future createUser(Individual individual) async {
    try {
      await _userCollectionReference
          .doc(individual.uid)
          .set(individual.toJson());
    } catch (e) {
      return e;
    }
  }

  // The method is used to get the data of the user stored.
  Future getUser(String uid) async {
    try {
      var userData = await _userCollectionReference.doc(uid).get();
      Map<String, dynamic> data = userData.data() as Map<String, dynamic>;
      return data;
    } catch (e) {
      return e;
    }
  }
}
