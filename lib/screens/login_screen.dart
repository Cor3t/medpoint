import 'package:flutter/material.dart';
import 'package:medpoint/component/button.dart';
import 'package:medpoint/component/input_validation.dart';
import 'package:medpoint/config/template.dart';
import 'package:medpoint/state_management/login_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> with InputValidationMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(debugLabel: "login key");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: blackColor),
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider<LoginProvider>(
            create: (context) => LoginProvider(),
            builder: (context, value) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      "Welcome!",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Sign in to continue",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 50),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(color: blackColor),
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: textFieldLabelTextStyle,
                              icon: const Icon(Icons.alternate_email),
                            ),
                            validator: (value) {
                              if (isEmailValid(value!)) {
                                return null;
                              } else {
                                return "Enter a valid email address";
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                          Consumer<LoginProvider>(
                              builder: (context, value, child) {
                            return TextFormField(
                              controller: passwordController,
                              obscureText: value.passwordVisibility,
                              textInputAction: TextInputAction.done,
                              style: const TextStyle(color: blackColor),
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: textFieldLabelTextStyle,
                                  icon: const Icon(Icons.lock_outline_rounded),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        value.visibility();
                                      },
                                      icon: Icon(value.passwordVisibility
                                          ? Icons.visibility_off
                                          : Icons.visibility))),
                            );
                          }),
                          const SizedBox(height: 25),
                          AppButton(
                            text: "Login",
                            buttonStyle: buttonStyle2,
                            onPressed: () {
                              _formKey.currentState!.validate();
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {}, child: const Text("Register"))
                    ])
                  ],
                ),
              );
            }),
      ),
    );
  }
}
