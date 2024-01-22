import 'package:bookapp/controller/authentication_controller/signup_controller.dart';
import 'package:bookapp/controller/user_controller/user_controller.dart';
import 'package:bookapp/model/user_model.dart/user_model.dart';
import 'package:bookapp/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/color.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TickerProviderStateMixin {
  bool isSignup = true;
  bool _obscureText = true;
  String errorMessage = ''; // To store error messages

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [dark, bright],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isSignup)
                  Column(
                    children: [
                      SizedBox(height: 16),
                      TextFormField(
                        controller: controller.name,
                        decoration: InputDecoration(
                          label: Text("Name"),
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                TextFormField(
                  controller: controller.email,
                  decoration: InputDecoration(
                      label: Text("Email"), prefixIcon: Icon(Icons.person)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(
                            r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                    controller: controller.password,
                    decoration: InputDecoration(
                      label: Text("Password"),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState() {
                            _obscureText = !_obscureText;
                          }
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    }),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      if (_formKey.currentState!.validate()) {
                        if (isSignup) {
                          final user = UserModel(
                              email: controller.email.text.trim(),
                              name: controller.name.text.trim(),
                              password: controller.password.text.trim());

                          SignUpController.intstance
                              .registerUser(user.email, user.password);
                          UserController.instance.creatUser(user);
                        } else {
                          SignUpController.intstance.loginUser(
                              controller.email.text, controller.password.text);
                        }
                        //   // await signup();
                        //   // showMessage(
                        //   // 'Account created successfully!', Colors.green);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                          (route) => false,
                        );
                        // await login();
                        setState(() {
                          saveLoginStatus(true);
                        });

                        // showMessage('Logged in successfully!', Colors.green);
                      }
                    } catch (e) {
                      // Handle authentication errors
                      // showMessage(e.toString(), Colors.red);
                    }
                  },
                  child: Text(isSignup ? 'Signup' : 'Login'),
                ),
                if (isSignup) const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isSignup = !isSignup;
                        });
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> saveLoginStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
  }

  // Future login() async {
  //   final auth = FirebaseAuth.instance;
  //   await auth.signInWithEmailAndPassword(
  //     email: emailController.text,
  //     password: passwordController.text,
  //   );
  // }

  // Future signup() async {
  //   final auth = FirebaseAuth.instance;
  //   await auth.createUserWithEmailAndPassword(
  //     email: emailController.text,
  //     password: passwordController.text,
  //   );
  // }

  // void showMessage(String message, Color color) {
  //   setState(() {
  //     errorMessage = message;
  //   });

  // Clear the message after a few seconds
  // Future.delayed(Duration(seconds: 3), () {
  //   setState(() {
  //     errorMessage = '';
  //   });
  // });
}
