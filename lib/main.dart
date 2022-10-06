import 'package:madhvani_traders_app/screens/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:madhvani_traders_app/screens/auth/welcome_back_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  // Future<FirebaseApp> _initializeFirebase() async {
  //   FirebaseApp firebaseApp = await Firebase.initializeApp();

  //   return firebaseApp;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'madhvani traders app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: Colors.transparent,
        primarySwatch: Colors.blue,
        fontFamily: "Montserrat",
      ),
      home: SplashScreen(),
      // home: FutureBuilder(
      //   future: Firebase.initializeApp(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       return WelcomeBackPage();
      //     }
      //     return SplashScreen();
      //   },
      // ),
    );
  }
}
