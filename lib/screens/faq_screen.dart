import 'package:flutter/material.dart';
import 'package:medpoint/component/appbar.dart';
import 'package:medpoint/component/screen_body.dart';
import 'package:medpoint/config/template.dart';
import 'package:medpoint/models/faq.dart';
import '../component/faq_bottom_sheet.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This widget is the FAQ page of the application
    return ScreenBody(
      child: Scaffold(
        backgroundColor: transparent,
        appBar: appBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              "FAQ/HELP",
              style: Theme.of(context).textTheme.headline2,
            )),
            const SizedBox(height: 45),
            // This section uses the list of faqitems and converts everything in the list to a widget.
            // The widget is a text that shows how the applications work
            ...faqItems
                .map((e) => FaqsSections(
                      title: e.title,
                      content: e.content,
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
