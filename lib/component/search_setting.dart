import 'package:flutter/material.dart';
import 'package:medpoint/component/error_alert.dart';
import 'package:medpoint/models/doctor.dart';
import 'package:medpoint/models/doctor_availability.dart';
import 'package:medpoint/models/sickness.dart';
import 'package:medpoint/screens/available_doctor_screen.dart';
import 'package:medpoint/state_management/home_provider.dart';
import 'package:provider/provider.dart';

class DoctorSearch extends SearchDelegate {
  List<String?> suggestions = sickness.map((e) => e.sicknessName).toList();

  @override
  // This is the display text on the search text field
  String get searchFieldLabel => "What's wrong?";

  @override
  // This is the icon on the right after the text field.
  // It is used to clear the text field.
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  // This is the icon on the left before the text field
  // It is used to go back to the home page.
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  // This is the widget that is displayed below the search text field.
  // It diplays a list suggestions according to what the user is searching for.
  Widget buildSuggestions(BuildContext context) {
    List<String?> _suggested = query.isEmpty
        ? []
        : suggestions
            .where((element) =>
                element!.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
        itemCount: _suggested.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              var sick = sickness.firstWhere(
                  (element) => element.sicknessName == _suggested[index]);
              var doctor =
                  doctors.firstWhere((element) => element.docid == sick.docid);
              var available = doctorAvailablity
                  .where((element) => element.docid == doctor.docid)
                  .toList();

              var provider = Provider.of<HomeProvider>(context, listen: false);

              if (provider.appointments.isNotEmpty) {
                if (provider.appointments
                    .any((element) => element.docid == doctor.docid)) {
                  showDialog(
                      context: context,
                      builder: (context) => ErrorAlert(
                          content:
                              "You already have an appontment with a doctor concerning your ${_suggested[index]!.toLowerCase()}."));
                } else {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => AvailableDoctor(
                            doctor: doctor,
                            sickness: _suggested[index]!,
                            available: available,
                          )));
                }
              } else {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => AvailableDoctor(
                          doctor: doctor,
                          sickness: _suggested[index]!,
                          available: available,
                        )));
              }
            },
            title: Text(_suggested[index]!),
            leading: const Icon(Icons.search),
            trailing: IconButton(
                icon: const Icon(Icons.north_west_sharp),
                onPressed: () {
                  query = _suggested[index]!;
                }),
          );
        });
  }
}
