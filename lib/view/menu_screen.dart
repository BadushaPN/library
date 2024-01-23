import 'package:bookapp/utils/color.dart';
import 'package:bookapp/view/account_page.dart';
import 'package:bookapp/view/main_page.dart';
import 'package:bookapp/view/return_book.dart';
import 'package:bookapp/view/signup_page.dart';
import 'package:bookapp/view/taken_books.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuScreen extends StatelessWidget {
  final Function(Widget) onPageChanged;
  MenuScreen({Key? key, required this.onPageChanged});

  List<ListItems> drawerItems = [
    ListItems(Icon(Icons.home), Text("Home"), MainPage()),
    ListItems(Icon(Icons.person), Text("Account"), AccountPage()),
    ListItems(
        Icon(Icons.book_sharp), Text("Book(s) Taken     (0)"), TakenBook()),
    ListItems(Icon(Icons.book_sharp), Text("Book(s) Return        (0)"),
        ReturnBook()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bright,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Badusha",
            overflow: TextOverflow.clip,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          ),
          const SizedBox(height: 25),
          Column(
            children: drawerItems
                .map((e) => ListTile(
                      onTap: () {
                        onPageChanged(e.page);
                      },
                      title: e.text,
                      leading: e.icon,
                    ))
                .toList(),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () async {
              // Firebase sign-out code
              await FirebaseAuth.instance.signOut();

              // Save logout status to SharedPreferences
              await saveLogoutStatus();
              Get.offAll(SignUp());
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(builder: (context) => SignUp()),
              //   (route) => false,
              // );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // Red color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: const Text("Sign Out"),
          ),
        ],
      ),
    );
  }

  Future<void> saveLogoutStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
  }
}

class ListItems {
  final Icon icon;
  final Text text;
  final Widget page;

  ListItems(this.icon, this.text, this.page);
}
