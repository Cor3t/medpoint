class AppointmentModel {
  String? aid,
      appointmentDate,
      appointmentStartTime,
      appointmentEndTime,
      uid,
      docid;

  AppointmentModel(
      {this.aid,
      this.appointmentDate,
      this.appointmentStartTime,
      this.appointmentEndTime,
      this.uid,
      this.docid});

  AppointmentModel.fromData(Map<String, dynamic> data)
      : docid = data["id"],
        aid = data["aid"],
        appointmentDate = data["appointmentDate"],
        appointmentStartTime = data["appointmentStartTime"],
        appointmentEndTime = data["appointmentEndTime"],
        uid = data["uid"];

  Map<String, dynamic> toMap() {
    return {
      "aid": aid,
      "appointmentDate": appointmentDate,
      "appointmentStartTime": appointmentStartTime,
      "appointmentEndTime": appointmentEndTime,
      "uid": uid,
      "docid": docid,
    };
  }
}
