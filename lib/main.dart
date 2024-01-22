import 'package:bookapp/firebase_options.dart';
import 'package:bookapp/utils/color.dart';
import 'package:bookapp/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Library',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: bright),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
