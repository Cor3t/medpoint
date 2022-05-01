import 'package:flutter/material.dart';
import 'package:medpoint/component/screen_body.dart';
import 'package:medpoint/config/template.dart';
import 'package:medpoint/screens/faq_screen.dart';
import 'package:medpoint/screens/login_screen.dart';
import 'package:medpoint/screens/signup_screen.dart';

import '../component/button.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  LandingState createState() => LandingState();
}

class LandingState extends State<Landing> {
  // This widget is the landing page of the application
  @override
  Widget build(BuildContext context) {
    // The ScreenBody displays the gradient look of the application.
    // for this to be possible, the Scaffold has to be transparent
    return ScreenBody(
      child: Scaffold(
        backgroundColor: transparent,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                // This sets the text align in the widget to the start (left)
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2),
                  // The Image displays the medical logo on the screen.
                  // AssetImage is used to get the image stored in the assets/images folder.
                  const Image(
                      image: AssetImage("assets/images/landing_header.png")),
                  const Spacer(flex: 2),

                  const Text(
                    "MED",
                    style: textStyleLandingScreen,
                  ),
                  const Text(
                    "      POINT",
                    style: textStyleLandingScreen,
                  ),
                  const Spacer(),
                  // AppButton is a widget, stored in the button.dart in the component.
                  // Declare in the button.dart to reduce the repitition of the code in different part of the application.
                  AppButton(
                      text: "LOGIN",
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const Login())));
                      }),
                  const SizedBox(height: 20),
                  AppButton(
                    text: "REGISTER",
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const SignUp())));
                    },
                  ),
                  // Because the column's text alignment is set to the start, I wrapped the need help text button with center
                  // This aligns the text button to the center of the screen
                  Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FaqScreen()));
                          },
                          child: const Text(
                            "Need Help?",
                            style: TextStyle(color: whiteColor),
                          ))),
                  const Spacer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
