import 'package:flutter/material.dart';
import '../config/template.dart';

class FaqsSections extends StatelessWidget {
  const FaqsSections({
    this.title,
    this.content,
    Key? key,
  }) : super(key: key);

  final String? title, content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottomSheet(
            backgroundColor: transparent,
            context: context,
            builder: (context) {
              return FaqView(title: title, content: content);
            });
      },
      child: Text(
        "  - $title",
        style: const TextStyle(
            fontSize: 17, fontWeight: FontWeight.w500, height: 2),
      ),
    );
  }
}

class FaqView extends StatelessWidget {
  const FaqView({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 330,
      decoration: const BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 40,
              )),
          Text(
            title!,
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Expanded(
              flex: 0,
              child: Text(
                content!,
                style: bodyTextStyle,
              ))
        ],
      ),
    );
  }
}
