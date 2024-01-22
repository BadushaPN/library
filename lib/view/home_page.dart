import 'package:bookapp/utils/color.dart';
import 'package:bookapp/view/main_page.dart';
import 'package:bookapp/view/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget page = MainPage();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
        menuScreen: MenuScreen(
          onPageChanged: (a) {
            setState(() {
              page = a;
              // ZoomDrawer.of(context)!.close();
            });
          },
        ),
        mainScreen: page,
        showShadow: true,
        borderRadius: 24,
        drawerShadowsBackgroundColor: Colors.greenAccent,
        menuBackgroundColor: dark);
  }
}
