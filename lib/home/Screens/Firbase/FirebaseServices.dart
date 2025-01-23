import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitlab_app/home/Screens/auth/signin.dart';
import 'package:fitlab_app/home/Screens/presentation/homescreen.dart';
import 'package:fitlab_app/home/Screens/presentation/mainpage.dart';
import 'package:flutter/material.dart';

class Firebaseservices {
  static Future<void> EditUserData(
    BuildContext context, {
    required String Email,
    required String newName,
    required String newPhone,
    required String newPassword,
  }) async {
    final auth = FirebaseAuth.instance;

    try {
      await FirebaseFirestore.instance.collection("Users").doc(Email).update({
        "Name": newName,
        "Phone": newPhone,
        "Password": newPassword,
      });
      print("Account Has Been Updated!!");

      await auth.currentUser?.updatePassword(newPassword);
      print("Password Has Been Updated!!");

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Signin();
          },
        ),
        (route) => false,
      );
    } catch (e) {
      print("Error Updating Account ${e.toString()}");
    }
  }

  static Future<void> deleteAccount(String Email, BuildContext context) async {
    final auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;
    try {
      if (currentUser != null) {
        await currentUser.delete();
      }
      FirebaseFirestore.instance.collection("Users").doc(Email).delete();
      print("User $Email has been deleted");

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Signin();
          },
        ),
        (route) => false,
      );
    } catch (e) {
      print("Error Deleting Account ${e.toString()}");
    }
  }

  static Future<Map<String, dynamic>?> getUserData(String Email) async {
    try {
      DocumentSnapshot userData =
          await FirebaseFirestore.instance.collection("Users").doc(Email).get();
      if (userData.exists) {
        return userData.data() as Map<String, dynamic>;
      } else {
        print('User Does Not Exist');
      }
    } catch (e) {
      print(e.toString);
    }
    return null;
  }

  static Future<void> login(
      String email, String password, BuildContext context) async {
    final auth = FirebaseAuth.instance;
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Mainpage();
          },
        ),
        (route) => false,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> signup(
      String Email, String Password, BuildContext context) async {
    final auth = FirebaseAuth.instance;
    try {
      await auth.createUserWithEmailAndPassword(
          email: Email, password: Password);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
        (route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  static Future<void> saveUserData(
      String Name, String Email, String Password, BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users') // Collection name
          .doc(FirebaseAuth.instance.currentUser!.email) // Document ID
          .set({
        "Name": Name,
        "Email": Email,
        "Password": Password,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Saved"),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  static Future<void> Logout(BuildContext context) async {
    final auth = FirebaseAuth.instance;
    try {
      await auth.signOut();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("You Logged Out"),
      ));
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const Signin();
          },
        ),
        (route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Issue Logging Out (${e.toString()})"),
        ),
      );
    }
  }
}
