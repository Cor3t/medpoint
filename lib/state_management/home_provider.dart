import 'package:flutter/cupertino.dart';
import 'package:medpoint/models/appointment.dart';
import 'package:medpoint/models/doctor.dart';

class HomeProvider extends ChangeNotifier {
  List<AppointmentModel> appointments = [];

  // This method is used to add an appointment
  void addAppointment(AppointmentModel appointment) {
    appointments.add(appointment);
    notifyListeners();
  }

  // This method is used to remove an appointment
  void removeAppointment(DoctorModel doctor) {
    appointments.removeWhere((element) => element.docid == doctor.docid);
    notifyListeners();
  }

  // This method is used to clear all the appointments.
  void emptyAppointment() {
    appointments.clear();
    notifyListeners();
  }
}
