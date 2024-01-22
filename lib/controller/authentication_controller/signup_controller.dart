import 'package:bookapp/controller/authentication_controller/authentication_contoller.dart';
import 'package:bookapp/controller/user_controller/user_controller.dart';
import 'package:bookapp/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get intstance => Get.find();
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();
  final userC = Get.put(UserController());
  void registerUser(String email, String password) {
    AuthenticationController.instance.creatUser(email, password);
  }

  void loginUser(String email, String password) {
    AuthenticationController.instance.loginUser(email, password);
    Get.offAll(() => MyHomePage());
  }

  // void creatUser(UserModel user) async {
  //   await userC.creatUser(user);
  //   await Get.offAll(() => MyHomePage());
  // }
}
