import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gomama_v2/models/OurUser.dart';

class Database {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference profileList =
      FirebaseFirestore.instance.collection("Users");

  // Create User
  static Future<String> createUSer(OurUser user) async {
    String returnValue = "error";
    try {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .set(user.toJson());
      returnValue = "success";
    } catch (e) {
      print(e);
    }
    return returnValue;
  }

  // Create Update User
  Future updateUserData(
    String uid, {
    String email,
    String plz,
    String birth,
    String kids,
    String name,
    String city,
    String about,
  }) async {
    return profileList.doc(uid).update(
      {
        'birthday': birth,
        'city': city,
        'email': email,
        'fullName': name,
        'kid': kids,
        'plz': plz,
        'about': about,
      },
    );
  }

  // Get User information (Console)
  Future<OurUser> getUserInfo(String uid) async {
    OurUser retVal = OurUser();
    DocumentSnapshot documentSnapshot =
        await firestore.collection("Users").doc(uid).get();
    retVal.uid = uid;
    retVal.name = documentSnapshot["fullName"];
    retVal.plz = documentSnapshot["plz"];
    retVal.birth = documentSnapshot["birthday"];
    retVal.kids = documentSnapshot["kid"];
    retVal.email = documentSnapshot["email"];
    retVal.city = documentSnapshot["city"];
    retVal.about = documentSnapshot["about"];
    try {} catch (e) {
      print(e);
    }
    return retVal;
  }
}
