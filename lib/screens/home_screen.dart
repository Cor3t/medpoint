import 'package:flutter/material.dart';
import 'package:medpoint/component/screen_body.dart';
import 'package:medpoint/component/search_setting.dart';
import 'package:medpoint/config/template.dart';
import 'package:medpoint/locator.dart';
import 'package:medpoint/models/doctor.dart';
import 'package:medpoint/screens/landing_screen.dart';
import 'package:medpoint/services/authentication.dart';
import 'package:medpoint/state_management/home_provider.dart';
import 'package:provider/provider.dart';

import '../component/dismiss_container.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final _auth = locator<AuthenticationHelper>();

  @override
  Widget build(BuildContext context) {
    // This widget is the Home Page page of the application. Where the users can view their appointments.
    return ScreenBody(
      child: Scaffold(
        backgroundColor: transparent,
        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Find Appointment",
                      style: Theme.of(context).textTheme.headline3),
                  // This is the log out button
                  IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () {
                      // Once the user taps on the button, it shows a pop up asking the user if they want to log out
                      // The pop up has 2 option, cancel (which closes the pop up) and sure (which logs the user out)
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                content: const Text(
                                    "Are you sure you want to log out?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancel")),
                                  TextButton(
                                      onPressed: () {
                                        _auth.signOut();
                                        var provider =
                                            Provider.of<HomeProvider>(context,
                                                listen: false);
                                        provider.emptyAppointment();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    const Landing())));
                                      },
                                      child: const Text("Sure"))
                                ],
                              ));
                    },
                  )
                ],
              ),
            ),
            // This is the search section of the application
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: GestureDetector(
                onTap: () {
                  showSearch(context: context, delegate: DoctorSearch());
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: searchColor),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Search",
                          style: TextStyle(fontSize: 16.5),
                        ),
                        Icon(Icons.search),
                      ]),
                ),
              ),
            ),
            // This section houses the appointment that would be added.
            // If there is no appointment, a text indicating no appointment would be displayed.
            Consumer<HomeProvider>(builder: (context, value, child) {
              return Expanded(
                child: value.appointments.isEmpty
                    // This is displayed if there is no appointment
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "No Appointments",
                            style: TextStyle(
                                fontSize: 17,
                                color: whiteColor,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5),
                          SizedBox(
                            width: 200,
                            child: Text(
                              "Search for health issue and book an appointment.",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 15, color: whiteColor, height: 1.3),
                            ),
                          ),
                        ],
                      )
                    // This is displayed if there is an appointment
                    : Scrollbar(
                        isAlwaysShown: true,
                        child: ListView.builder(
                            itemCount: value.appointments.length,
                            itemBuilder: (context, index) {
                              var appointment = value.appointments[index];
                              var doctor = doctors.firstWhere((element) =>
                                  element.docid == appointment.docid);
                              return Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10, left: 15, right: 15, top: 10),
                                // Dismissible is used to be able to cancel an appointment
                                child: Dismissible(
                                  direction: DismissDirection.endToStart,
                                  key: Key(doctor.docid!),
                                  background: const DismissContainer(),
                                  onDismissed: (dismiss) {
                                    value.removeAppointment(doctor);
                                  },
                                  child: Material(
                                      color: whiteColor,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      elevation: 2.5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                    radius: 25,
                                                    backgroundImage: AssetImage(
                                                        doctor.img!)),
                                                const SizedBox(width: 15),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      doctor.doctorName!,
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(doctor.speciality!)
                                                  ],
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 15),
                                            Container(
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  color: searchColor),
                                              padding: const EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                      Icons.calendar_month),
                                                  const SizedBox(width: 8),
                                                  Text(appointment
                                                      .appointmentDate!),
                                                  const SizedBox(width: 20),
                                                  const Icon(Icons.schedule),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                      "${appointment.appointmentStartTime} - ${appointment.appointmentEndTime}")
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              );
                            }),
                      ),
              );
            }),
          ]),
        ),
      ),
    );
  }
}
