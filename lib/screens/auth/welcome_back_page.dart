import 'package:flutter/material.dart';

import 'register_page.dart';
import 'package:madhvani_traders_app/screens/main/main_page.dart';
import 'package:madhvani_traders_app/screens/auth/forgot_password_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class WelcomeBackPage extends StatefulWidget {
  @override
  _WelcomeBackPageState createState() => _WelcomeBackPageState();
}

class _WelcomeBackPageState extends State<WelcomeBackPage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  //login function
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      }
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Widget welcomeBack = const Text(
      'Welcome',
      style: TextStyle(
          color: Colors.white,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]),
    );

    Widget subTitle = const Padding(
        padding: EdgeInsets.only(right: 56.0),
        child: Text(
          'Login to your account using\n Your email',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ));

    Widget loginButton = Positioned(
      left: MediaQuery.of(context).size.width / 4,
      bottom: 40,
      child: InkWell(
        onTap: () async {
          User? user = await loginUsingEmailPassword(
              email: emailController.text,
              password: passwordController.text,
              context: context);

          print(user);
          if (user != null) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => MainPage()));
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 80,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(236, 60, 3, 1),
                    Color.fromRGBO(234, 60, 3, 1),
                    Color.fromRGBO(216, 78, 16, 1),
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.circular(9.0)),
          child: const Center(
              child: Text("Log In",
                  style: TextStyle(
                      color: Color(0xfffefefe),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
        ),
      ),
    );

    Widget loginForm = SizedBox(
      height: 240,
      child: Stack(
        children: <Widget>[
          Container(
            height: 160,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 32.0, right: 12.0),
            decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: emailController,
                    decoration:
                        const InputDecoration(hintText: 'Enter your email'),
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: passwordController,
                    decoration:
                        const InputDecoration(hintText: 'Enter your password'),
                    style: const TextStyle(fontSize: 16.0),
                    obscureText: true,
                  ),
                ),
              ],
            ),
          ),
          loginButton,
        ],
      ),
    );

    Widget forgotPassword = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Don\'t have an account? ',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  fontSize: 14.0,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => RegisterPage()));
                },
                child: const Text(
                  ' Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Forgot your password? ',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  fontSize: 14.0,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ForgotPasswordPage()));
                },
                child: const Text(
                  'Reset password',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
        // body: FutureBuilder(
        //     future: _initializeFirebase(),
        //     builder: (context, snapshot) async {
        //       if (snapshot.connectionState == ConnectionState.done)
        body: Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.2),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Spacer(flex: 3),
              welcomeBack,
              const Spacer(),
              subTitle,
              const Spacer(flex: 2),
              loginForm,
              const Spacer(flex: 2),
              forgotPassword
            ],
          ),
        )
      ],
    ));
  }
}
