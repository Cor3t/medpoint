import 'package:flutter/material.dart';
import 'package:medpoint/component/appbar.dart';
import 'package:medpoint/component/screen_body.dart';
import 'package:medpoint/models/doctor.dart';
import 'package:medpoint/screens/list_of_available_appointment_screen.dart';

import '../config/template.dart';
import '../models/doctor_availability.dart';

class AvailableDoctor extends StatefulWidget {
  const AvailableDoctor({this.doctor, this.available, this.sickness, Key? key})
      : super(key: key);

  final String? sickness;
  final DoctorModel? doctor;
  final List<DoctorAvailabilityModel>? available;

  @override
  AvailableDoctorState createState() => AvailableDoctorState();
}

class AvailableDoctorState extends State<AvailableDoctor> {
  @override
  // This widget displays the available doctor for appointment
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Scaffold(
        backgroundColor: transparent,
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              // The header displaying the sickess
              Text(
                widget.sickness!,
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 70),
              // This displays a message with the doctors name and speciality
              Text(
                "${widget.doctor!.doctorName} our hospital ${widget.doctor!.speciality!.toLowerCase()}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 170),
              //  This is the select appointment button
              TextButton(
                  onPressed: () {
                    // The navigator for changing of screen
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ListOfAvailableAppointment(
                              available: widget.available,
                              doctor: widget.doctor,
                            )));
                  },
                  child: const Text(
                    "SELECT APPOINTMENT",
                    style: TextStyle(fontSize: 25),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
