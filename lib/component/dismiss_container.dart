import 'package:flutter/material.dart';

class DismissContainer extends StatelessWidget {
  const DismissContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 15),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: const Text(
          "Delete",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ));
  }
}
