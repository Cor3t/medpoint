import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medpoint/config/template.dart';
import 'package:medpoint/locator.dart';
import 'package:medpoint/screens/home_screen.dart';
import 'package:medpoint/screens/landing_screen.dart';
import 'package:medpoint/services/authentication.dart';
import 'package:medpoint/state_management/home_provider.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  setUpLocator();
  final _auth = await locator<AuthenticationHelper>().isUserLoggedIn();
  runApp(MyApp(auth: _auth));
}

class MyApp extends StatelessWidget {
  const MyApp({this.auth, Key? key}) : super(key: key);

  final bool? auth;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
        create: (context) => HomeProvider(),
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: auth! ? const Home() : const Landing(),
          );
        });
  }
}
