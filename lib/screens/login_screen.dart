import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medpoint/component/appbar.dart';
import 'package:medpoint/component/button.dart';
import 'package:medpoint/component/input_validation.dart';
import 'package:medpoint/component/screen_body.dart';
import 'package:medpoint/config/template.dart';
import 'package:medpoint/locator.dart';
import 'package:medpoint/screens/home_screen.dart';
import 'package:medpoint/screens/signup_screen.dart';
import 'package:medpoint/services/authentication.dart';
import 'package:medpoint/state_management/login_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> with InputValidationMixin {
  // These are the controllers for each of the text fields in the screen.
  // They are used to grab the text typed by the user.
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // The key is assigned to the form for the login
  final _formKey = GlobalKey<FormState>(debugLabel: "login key");
  final _auth = locator<AuthenticationHelper>();

  @override
  // This widget is the login screen of the application
  Widget build(BuildContext context) {
    // The ScreenBody displays the gradient look of the application.
    // for this to be possible, the Scaffold has to be transparent
    return ScreenBody(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: ChangeNotifierProvider<LoginProvider>(
                create: (context) => LoginProvider(),
                builder: (context, value) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 200),
                      Text(
                        "Login",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      const SizedBox(height: 50),
                      // The form is used as a blanket containing the text field for the login.
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // This is the email text field. A container is wrapped around it to provide the white background
                            // with rounded corners
                            Container(
                              decoration: const BoxDecoration(
                                  color: whiteColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: TextFormField(
                                controller: emailController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(color: blackColor),
                                decoration: InputDecoration(
                                  fillColor: whiteColor,
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 13),
                                  labelText: "Email",
                                  labelStyle: textFieldLabelTextStyle,
                                ),
                                // The validator is used to ensure the user types in a correct email address
                                validator: (value) {
                                  if (isEmailValid(value!)) {
                                    return null;
                                  } else if (value.isEmpty) {
                                    return "Enter your email";
                                  } else {
                                    return "Enter a valid email address";
                                  }
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Consumer<LoginProvider>(
                                builder: (context, value, child) {
                              return Container(
                                decoration: const BoxDecoration(
                                    color: whiteColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: value.passwordVisibility,
                                  textInputAction: TextInputAction.done,
                                  style: const TextStyle(color: blackColor),
                                  // This validator checks if the user entered a password
                                  validator: (value) {
                                    if (value!.isNotEmpty) {
                                      return null;
                                    } else {
                                      return "Enter your password";
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 13),
                                      labelText: "Password",
                                      labelStyle: textFieldLabelTextStyle,
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            value.visibility();
                                          },
                                          icon: Icon(value.passwordVisibility
                                              ? Icons.visibility_off
                                              : Icons.visibility))),
                                ),
                              );
                            }),
                            const SizedBox(height: 25),
                            AppButton(
                              text: "Login",
                              onPressed: () {
                                // This removes the keyboard from the screen
                                FocusScope.of(context).unfocus();
                                // Before the user can be signed in, this checks if there are proper values in the text fields
                                if (_formKey.currentState!.validate()) {
                                  _auth
                                      .signIn(
                                          email: emailController.text,
                                          password: passwordController.text)
                                      .then((value) {
                                    // if (value is User) {
                                    return Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) =>
                                                const Home()));
                                    // } else {
                                    //   return Fluttertoast.showToast(msg: value);
                                    // }
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const SignUp()));
                                },
                                child: const Text(
                                  "Register",
                                  style: TextStyle(color: whiteColor),
                                ))
                          ])
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
