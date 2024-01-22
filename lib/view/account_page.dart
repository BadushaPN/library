import 'package:bookapp/view/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Account'),
          leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => ZoomDrawer.of(context)!.toggle()),

          backgroundColor:
              Colors.transparent, // Set the background color to transparent
          elevation: 0, // Remove the shadow
        ),
      ),
    );
  }
}
