import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medpoint/component/appbar.dart';
import 'package:medpoint/component/input_validation.dart';
import 'package:medpoint/component/button.dart';
import 'package:medpoint/component/screen_body.dart';
import 'package:medpoint/locator.dart';
import 'package:medpoint/services/authentication.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:medpoint/config/template.dart';
import '../state_management/signup_provider.dart';
import 'home_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> with InputValidationMixin {
  // These are the controllers for each of the text fields in the screen.
  // They are used to grab the text typed by the user.
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _auth = locator<AuthenticationHelper>();

  // The key is assigned to the form for the register
  final _formKey = GlobalKey<FormState>(debugLabel: "register");

  @override
  // This widget is the Register screen of the application.
  Widget build(BuildContext context) {
    // The ScreenBody displays the gradient look of the application.
    // for this to be possible, the Scaffold has to be transparent
    return ScreenBody(
      child: Scaffold(
        backgroundColor: transparent,
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ChangeNotifierProvider<SignUpProvider>(
              create: (context) => SignUpProvider(),
              builder: (context, snapshot) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        "Register",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      const SizedBox(height: 50),
                      // The form is used as a blanket containing the text field for the register.
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldContainer(
                                label: "FIRST NAME",
                                errorText: "Please enter firstname",
                                firstnameController: firstnameController),
                            const SizedBox(height: 10),
                            TextFieldContainer(
                                label: "LAST NAME",
                                errorText: "Please enter lastname",
                                firstnameController: lastnameController),
                            const SizedBox(height: 10),
                            Container(
                              decoration: const BoxDecoration(
                                  color: whiteColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                textInputAction: TextInputAction.next,
                                style: const TextStyle(color: blackColor),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 13),
                                    labelText: "EMAIL ADDRESS",
                                    labelStyle: textFieldLabelTextStyle),
                                validator: (value) {
                                  if (isEmailValid(value!)) {
                                    return null;
                                  } else if (!isEmailValid(value)) {
                                    return "Enter a valid email address";
                                  } else {
                                    return "Enter an email address";
                                  }
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Consumer<SignUpProvider>(
                                    builder: (context, value, snapshot) {
                                  return Container(
                                    width: 160,
                                    decoration: const BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: genderController,
                                      readOnly: true,
                                      onTap: () {
                                        // This is used to dispaly a picker so the user can select a value from the options
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
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 13),
                                          labelText: "SEX",
                                          labelStyle: textFieldLabelTextStyle),
                                      validator: (value) {
                                        if (value!.isNotEmpty) {
                                          return null;
                                        } else {
                                          return "Enter a Gender";
                                        }
                                      },
                                    ),
                                  );
                                }),
                                const SizedBox(height: 10),
                                Consumer<SignUpProvider>(
                                    builder: (context, value, child) {
                                  return Container(
                                    width: 160,
                                    decoration: const BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: TextFormField(
                                      controller: dateController,
                                      keyboardType: TextInputType.emailAddress,
                                      readOnly: true,
                                      onTap: () {
                                        showCupertinoModalPopup(
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                padding: const EdgeInsets.only(
                                                    top: 6),
                                                height: 210,
                                                child: CupertinoDatePicker(
                                                  backgroundColor: Colors.white,
                                                  mode: CupertinoDatePickerMode
                                                      .date,
                                                  initialDateTime: value.date,
                                                  onDateTimeChanged:
                                                      (DateTime _value) {
                                                    if (mounted) {
                                                      var day =
                                                          _value.day.toString();
                                                      var month = value.months[
                                                          _value.month - 1];
                                                      var year = _value.year
                                                          .toString();
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
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 13),
                                          labelText: "D O B",
                                          labelStyle: textFieldLabelTextStyle),
                                      validator: (value) {
                                        if (value!.isNotEmpty) {
                                          return null;
                                        } else {
                                          return "Enter a Date of Birth";
                                        }
                                      },
                                    ),
                                  );
                                }),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Consumer<SignUpProvider>(
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
                                  validator: (value) {
                                    if (value!.isNotEmpty) {
                                      return null;
                                    } else {
                                      return "Enter a Password";
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 13),
                                      labelText: "PASSWORD",
                                      labelStyle: const TextStyle(fontSize: 12),
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
                            const SizedBox(height: 20),
                            AppButton(
                              text: "Register",
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
                                      .then((value) {
                                    if (value == null) {
                                      return Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Home()));
                                    } else {
                                      return Fluttertoast.showToast(msg: value);
                                    }
                                  });
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
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    Key? key,
    required this.label,
    required this.errorText,
    required this.firstnameController,
  }) : super(key: key);

  final TextEditingController firstnameController;
  final String label, errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: TextFormField(
        controller: firstnameController,
        textCapitalization: TextCapitalization.sentences,
        textInputAction: TextInputAction.next,
        style: const TextStyle(color: blackColor),
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            labelText: label,
            labelStyle: textFieldLabelTextStyle),
        validator: (value) {
          if (value!.isNotEmpty) {
            return null;
          } else {
            return errorText;
          }
        },
      ),
    );
  }
}
