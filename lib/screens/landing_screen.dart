import 'package:flutter/material.dart';
import 'package:medpoint/config/template.dart';
import 'package:medpoint/screens/login_screen.dart';
import 'package:medpoint/screens/signup_screen.dart';

import '../component/button.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  LandingState createState() => LandingState();
}

class LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const Spacer(flex: 2),
                const Image(
                    image: AssetImage("assets/images/landing_image.png")),
                const Spacer(flex: 2),
                Text(
                  "THE BEST SPECIALIST",
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Text(
                    "Treatment from the best specialists around the world",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                const Spacer(),
                AppButton(
                    text: "LOGIN",
                    buttonStyle: buttonStyle2,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const Login())));
                    }),
                const SizedBox(height: 20),
                AppButton(
                  text: "SIGN UP",
                  buttonStyle: buttonStyle1,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const SignUp())));
                  },
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
