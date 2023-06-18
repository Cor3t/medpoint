class DoctorAvailabilityModel {
  String? daid, docid, dateOfAvailability, startTime, endTime;

  DoctorAvailabilityModel(
      {this.daid,
      this.docid,
      this.dateOfAvailability,
      this.startTime,
      this.endTime});

  DoctorAvailabilityModel.fromData(Map<String, dynamic> data)
      : daid = data["daid"],
        docid = data["docid"],
        dateOfAvailability = data["dateOfAvailability"],
        startTime = data["startTime"],
        endTime = data["endTime"];

  Map<String, dynamic> toMap() {
    return {
      "daid": daid,
      "docid": docid,
      "dateOfAvailability": dateOfAvailability,
      "startTime": startTime,
      "endTime": endTime,
    };
  }
}

List<DoctorAvailabilityModel> doctorAvailablity = [
  DoctorAvailabilityModel(
      daid: "001",
      docid: "001",
      dateOfAvailability: "Tues, 24 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "002",
      docid: "001",
      dateOfAvailability: "Wed, 25 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "003",
      docid: "001",
      dateOfAvailability: "Thurs, 26 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "004",
      docid: "001",
      dateOfAvailability: "Fri, 27 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "005",
      docid: "001",
      dateOfAvailability: "Mon, 30 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "006",
      docid: "001",
      dateOfAvailability: "Tues, 1 May 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "007",
      docid: "002",
      dateOfAvailability: "Tues, 24 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "008",
      docid: "002",
      dateOfAvailability: "Wed, 25 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "009",
      docid: "002",
      dateOfAvailability: "Thurs, 26 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "010",
      docid: "002",
      dateOfAvailability: "Fri, 27 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "011",
      docid: "002",
      dateOfAvailability: "Mon, 30 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "012",
      docid: "002",
      dateOfAvailability: "Tues, 1 May 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "013",
      docid: "003",
      dateOfAvailability: "Tues, 24 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "014",
      docid: "003",
      dateOfAvailability: "Wed, 25 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "015",
      docid: "003",
      dateOfAvailability: "Thurs, 26 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "016",
      docid: "003",
      dateOfAvailability: "Fri, 27 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "017",
      docid: "003",
      dateOfAvailability: "Mon, 30 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "018",
      docid: "003",
      dateOfAvailability: "Tues, 1 May 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "019",
      docid: "004",
      dateOfAvailability: "Tues, 24 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "020",
      docid: "004",
      dateOfAvailability: "Wed, 25 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "021",
      docid: "004",
      dateOfAvailability: "Thurs, 26 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "022",
      docid: "004",
      dateOfAvailability: "Fri, 27 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "023",
      docid: "004",
      dateOfAvailability: "Mon, 30 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "024",
      docid: "004",
      dateOfAvailability: "Tues, 1 May 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "025",
      docid: "005",
      dateOfAvailability: "Tues, 24 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "026",
      docid: "005",
      dateOfAvailability: "Wed, 25 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "027",
      docid: "005",
      dateOfAvailability: "Thurs, 26 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "028",
      docid: "005",
      dateOfAvailability: "Fri, 27 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "029",
      docid: "005",
      dateOfAvailability: "Mon, 30 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "030",
      docid: "005",
      dateOfAvailability: "Tues, 1 May 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "031",
      docid: "006",
      dateOfAvailability: "Tues, 24 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "032",
      docid: "006",
      dateOfAvailability: "Wed, 25 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "033",
      docid: "006",
      dateOfAvailability: "Thurs, 26 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "034",
      docid: "006",
      dateOfAvailability: "Fri, 27 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "035",
      docid: "006",
      dateOfAvailability: "Mon, 30 April 2022",
      startTime: "1:00",
      endTime: "5:00"),
  DoctorAvailabilityModel(
      daid: "036",
      docid: "006",
      dateOfAvailability: "Tues, 1 May 2022",
      startTime: "1:00",
      endTime: "5:00"),
];
