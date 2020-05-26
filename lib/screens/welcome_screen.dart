import 'package:flutter/material.dart';
import 'package:splash/components/rounded_button.dart';
import 'package:splash/screens/login_screen.dart';
import 'package:splash/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration( seconds: 1),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.indigo, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {

      });
      print(animation.value);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'splash',
                  child: Container(
                    color: Colors.transparent,
                    child: Image.asset('images/splash.jpg'),
                    height: 60,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text:
                  ['Splash Chat'],
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(title: 'Log in', color: Colors.indigo, onPressed: (){
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            RoundedButton(title: 'Register', color: Colors.blueAccent, onPressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            },),

          ],
        ),
      ),
    );
  }
}

