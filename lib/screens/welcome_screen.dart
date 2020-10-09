import 'package:flutter/material.dart';
import 'package:ChatApp/screens/login_screen.dart';
import 'package:ChatApp/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ChatApp/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    //the AnimationContoller requires one required property vsync which is a TickerProvider Object
    //Hence we use mixin to provide the state object with capabilities of TickerProvider
    //BYdefault the ticker will have upperBound as 1.0
    controller = AnimationController(
      upperBound: 1.0,
      duration: Duration(seconds: 2),
      vsync: this,
    );

    //the Ticker with controller ticks linearly,to give a non linear animation
    //it is a layer over the controller to give non-Linear values,upperBound should be 1.0 only
    // animation = CurvedAnimation(parent: controller, curve: Curves.easeOutCubic);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    //the animation controller will animate a number ,for every tick of ticker it will increase a number
    //so to feel it we add a listener which is called each time the tivker changes the value.

    controller.addListener(() {
      setState(() {});
      print(animation.value); //we can use this value for any animation!!
    });
  }

//called whenwver state is destroyed
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
                  tag: 'Logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
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
            RoundedButton(
              colour: Colors.lightBlueAccent,
              label: 'Log in',
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
                colour: Colors.blueAccent,
                label: 'Register',
                onTap: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                })
          ],
        ),
      ),
    );
  }
}
