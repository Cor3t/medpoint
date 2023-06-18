import 'package:flutter/material.dart';
import 'package:medpoint/component/appbar.dart';
import 'package:medpoint/component/screen_body.dart';
import 'package:medpoint/models/doctor.dart';
import 'package:provider/provider.dart';

import '../component/button.dart';
import '../config/template.dart';
import '../models/appointment.dart';
import '../models/doctor_availability.dart';
import '../state_management/home_provider.dart';

class ConfirmAppointment extends StatefulWidget {
  const ConfirmAppointment(
      {this.available, this.doctor, this.appointmentDate, Key? key})
      : super(key: key);
  final String? appointmentDate;
  final DoctorModel? doctor;
  final List<DoctorAvailabilityModel>? available;

  @override
  ConfirmAppointmentState createState() => ConfirmAppointmentState();
}

class ConfirmAppointmentState extends State<ConfirmAppointment> {
  @override
  // This widget displays the a confirm message to the user
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Scaffold(
        backgroundColor: transparent,
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            children: [
              Text(
                "CONFIRM APPOINTMENT",
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Are you sure you want to book your appointment for ${widget.appointmentDate}.",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 50),
              // The button adds the appointment date, time and doctors id to list of appointments.
              AppButton(
                  text: "Confirm",
                  onPressed: () {
                    var date = widget.available!.firstWhere((element) =>
                        element.dateOfAvailability == widget.appointmentDate);
                    var set = Provider.of<HomeProvider>(context, listen: false);
                    AppointmentModel appointment = AppointmentModel(
                        aid: "001",
                        docid: widget.doctor!.docid,
                        appointmentDate: date.dateOfAvailability,
                        appointmentEndTime: date.endTime,
                        appointmentStartTime: date.startTime,
                        uid: "001");
                    set.addAppointment(appointment);
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
