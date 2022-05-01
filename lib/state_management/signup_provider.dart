import 'package:medpoint/state_management/login_provider.dart';

class SignUpProvider extends LoginProvider {
  var date = DateTime.now();
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sept",
    "Oct",
    "Nov",
    "Dec"
  ];
  List<String> genders = ["Not Set", "Female", "Male", "Other"];
  String? gender;

  void setDate(DateTime _datetime) {
    date = _datetime;
    notifyListeners();
  }

  void setGender(int index) {
    gender = genders[index];
    notifyListeners();
  }
}
