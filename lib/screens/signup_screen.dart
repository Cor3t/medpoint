import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:medpoint/component/input_validation.dart';
import 'package:medpoint/component/button.dart';
import 'package:medpoint/locator.dart';
import 'package:medpoint/services/authentication.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:medpoint/config/template.dart';
import '../state_management/signup_provider.dart';
import 'home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> with InputValidationMixin {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _auth = locator<AuthenticationHelper>();

  final _formKey = GlobalKey<FormState>(debugLabel: "Sign Up Key");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: blackColor),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ChangeNotifierProvider<SignUpProvider>(
            create: (context) => SignUpProvider(),
            builder: (context, snapshot) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      "Hi!",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Create a new account",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 50),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: firstnameController,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            style: const TextStyle(color: blackColor),
                            decoration: InputDecoration(
                                labelText: "FIRST NAME",
                                labelStyle: textFieldLabelTextStyle),
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else {
                                return "Enter a First Name";
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: lastnameController,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            style: const TextStyle(color: blackColor),
                            decoration: InputDecoration(
                                labelText: "LAST NAME",
                                labelStyle: textFieldLabelTextStyle),
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else {
                                return "Enter a Last Name";
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            textInputAction: TextInputAction.next,
                            style: const TextStyle(color: blackColor),
                            decoration: InputDecoration(
                                labelText: "EMAIL",
                                labelStyle: textFieldLabelTextStyle),
                            validator: (value) {
                              if (isEmailValid(value!)) {
                                return null;
                              } else {
                                return "Enter a valid email address";
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                          Consumer<SignUpProvider>(
                              builder: (context, value, snapshot) {
                            return TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: genderController,
                              readOnly: true,
                              onTap: () {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return SizedBox(
                                        height: 210,
                                        child: CupertinoPicker(
                                            backgroundColor: whiteColor,
                                            scrollController:
                                                FixedExtentScrollController(
                                                    initialItem: 0),
                                            itemExtent: 30,
                                            onSelectedItemChanged: (index) {
                                              if (mounted) {
                                                value.setGender(index);
                                                genderController.text =
                                                    value.gender!;
                                              }
                                            },
                                            children: const [
                                              Text("Not Set"),
                                              Text("Female"),
                                              Text("Male"),
                                              Text("Other")
                                            ]),
                                      );
                                    });
                              },
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(color: blackColor),
                              decoration: InputDecoration(
                                  labelText: "GENDER",
                                  labelStyle: textFieldLabelTextStyle),
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                  return null;
                                } else {
                                  return "Enter a Gender";
                                }
                              },
                            );
                          }),
                          const SizedBox(height: 10),
                          Consumer<SignUpProvider>(
                              builder: (context, value, child) {
                            return TextFormField(
                              controller: dateController,
                              keyboardType: TextInputType.emailAddress,
                              readOnly: true,
                              onTap: () {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        padding: const EdgeInsets.only(top: 6),
                                        height: 210,
                                        child: CupertinoDatePicker(
                                          backgroundColor: Colors.white,
                                          mode: CupertinoDatePickerMode.date,
                                          initialDateTime: value.date,
                                          onDateTimeChanged: (DateTime _value) {
                                            if (mounted) {
                                              var day = _value.day.toString();
                                              var month = value
                                                  .months[_value.month - 1];
                                              var year = _value.year.toString();
                                              value.setDate(_value);
                                              dateController.text =
                                                  "$day $month $year";
                                            }
                                          },
                                        ),
                                      );
                                    });
                              },
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(color: blackColor),
                              decoration: InputDecoration(
                                  labelText: "DATE OF BIRTH",
                                  labelStyle: textFieldLabelTextStyle),
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                  return null;
                                } else {
                                  return "Enter a Date of Birth";
                                }
                              },
                            );
                          }),
                          const SizedBox(height: 10),
                          Consumer<SignUpProvider>(
                              builder: (context, value, child) {
                            return TextFormField(
                              controller: passwordController,
                              obscureText: value.passwordVisibility,
                              textInputAction: TextInputAction.done,
                              style: const TextStyle(color: blackColor),
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                  return null;
                                } else {
                                  return "Enter a Password";
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: "PASSWORD",
                                  labelStyle: const TextStyle(fontSize: 12),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        value.visibility();
                                      },
                                      icon: Icon(value.passwordVisibility
                                          ? Icons.visibility_off
                                          : Icons.visibility))),
                            );
                          }),
                          const SizedBox(height: 20),
                          RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                      color: blackColor,
                                      fontSize: 13,
                                      height: 1.5),
                                  children: [
                                const TextSpan(
                                    text:
                                        "By signing up, you've agree to our "),
                                TextSpan(
                                    text: "Terms & Conditions ",
                                    style: const TextStyle(color: blueColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {}),
                                const TextSpan(text: "and "),
                                TextSpan(
                                    text: "Privacy Policy",
                                    style: const TextStyle(color: blueColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {}),
                              ])),
                          const SizedBox(height: 25),
                          AppButton(
                            text: "Sign Up & Accept",
                            buttonStyle: buttonStyle2,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _auth
                                    .signUpWithEmail(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        firstName: firstnameController.text,
                                        lastName: lastnameController.text,
                                        gender: genderController.text,
                                        dateOfBirth: dateController.text)
                                    .then((value) => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Home())));
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
