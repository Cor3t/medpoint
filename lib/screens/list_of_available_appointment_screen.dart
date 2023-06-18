import 'package:flutter/material.dart';
import 'package:medpoint/component/appbar.dart';
import 'package:medpoint/component/button.dart';
import 'package:medpoint/component/error_alert.dart';
import 'package:medpoint/component/screen_body.dart';
import 'package:medpoint/models/doctor.dart';
import 'package:medpoint/screens/confirm_appointment_screen.dart';

import '../component/appointment_checkbox.dart';
import '../config/template.dart';
import '../models/doctor_availability.dart';

class ListOfAvailableAppointment extends StatefulWidget {
  const ListOfAvailableAppointment({this.available, this.doctor, Key? key})
      : super(key: key);
  final List<DoctorAvailabilityModel>? available;
  final DoctorModel? doctor;

  @override
  ListOfAvailableAppointmentState createState() =>
      ListOfAvailableAppointmentState();
}

class ListOfAvailableAppointmentState
    extends State<ListOfAvailableAppointment> {
  List<CheckBoxModal>? checkboxes;
  String? selectedDay;

  @override
  // This is used to perform function before the screen is displayed
  // The framework will call this method exactly once for each [State] object it creates.
  void initState() {
    super.initState();
    // Assign the list of appointment to checkbox variable so it can be used in the code
    checkboxes = widget.available!
        .map((e) => CheckBoxModal(title: e.dateOfAvailability))
        .toList();
  }

  @override
  // This widget displays the list of available days for the appointment.
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Scaffold(
        backgroundColor: transparent,
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                "AVAILABLE APPOINTMENT",
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 10),
              // This section uses the list of appointments and converts everything in the list to a widget.
              // The widget is a checkbox with the title
              ...checkboxes!
                  .map((e) => AppointmentCheckbox(
                      value: e.value!,
                      title: e.title!,
                      onChanged: (va) {
                        setState(() {
                          for (var element in checkboxes!) {
                            if (element.title == e.title &&
                                element.value == true) {
                              element.value = false;

                              selectedDay = null;
                            } else if (element.title != e.title) {
                              element.value = false;
                            } else {
                              element.value = true;
                              selectedDay = element.title;
                            }
                          }
                        });
                      }))
                  .toList(),
              const SizedBox(height: 20),
              // The button checks if the user has selected a day for an appointment.
              // If the user has, it takes the user to the next page.
              // If not a pop up appear signifying that the user has not selected a day.
              AppButton(
                text: "Book Appointment",
                onPressed: () {
                  if (selectedDay != null) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConfirmAppointment(
                                  doctor: widget.doctor,
                                  appointmentDate: selectedDay,
                                  available: widget.available,
                                )));
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) => const ErrorAlert(
                            content:
                                "You have not selected a day for your appointmant"));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
