import 'package:flutter/material.dart';

class ScreenBody extends StatelessWidget {
  const ScreenBody({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
            Color.fromARGB(255, 19, 4, 99),
            Color.fromARGB(255, 7, 32, 173),
            Color.fromARGB(255, 96, 124, 218),
            Color.fromARGB(255, 255, 255, 255)
          ])),
      child: child,
    );
  }
}
