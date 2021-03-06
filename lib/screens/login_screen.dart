import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:splash/components/rounded_button.dart';
import 'package:splash/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:splash/screens/chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Hero(
                  tag: 'splash',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/splash.jpg'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFiled.copyWith(hintText: "Enter your email")
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                  decoration: kTextFiled.copyWith(hintText: "Enter your password")
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: "Login",
                  color: Colors.indigo,
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if(user != null){
                        Navigator.pushReplacementNamed(context, ChatScreen.id);
                        setState(() {
                          showSpinner = false;
                        });
                      }

                    }catch(e){
                      print(e);
                    }

                  },
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
