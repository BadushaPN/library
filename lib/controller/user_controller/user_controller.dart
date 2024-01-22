import 'package:bookapp/model/user_model.dart/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  creatUser(UserModel user) {
    _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(() => Get.snackbar(
            "Success", "Your account has been created",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.greenAccent,
            colorText: Colors.white))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    });
  }
}
