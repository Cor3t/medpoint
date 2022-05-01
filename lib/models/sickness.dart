class SicknessModel {
  String? sid, sicknessName, docid;

  SicknessModel({this.sid, this.sicknessName, this.docid});

  SicknessModel.formData(Map<String, dynamic> data)
      : sid = data["sid"],
        sicknessName = data["sicknessName"],
        docid = data["docid"];

  Map<String, dynamic> toMap() {
    return {
      "sid": sid,
      "sicknessName": sicknessName,
      "docid": docid,
    };
  }
}

List<SicknessModel> sickness = [
  SicknessModel(
    docid: "001",
    sid: "001",
    sicknessName: "Cold",
  ),
  SicknessModel(
    docid: "002",
    sid: "002",
    sicknessName: "Headache",
  ),
  SicknessModel(
    docid: "003",
    sid: "003",
    sicknessName: "Cough",
  ),
  SicknessModel(
    docid: "004",
    sid: "004",
    sicknessName: "Stomach Ache",
  ),
  SicknessModel(
    docid: "005",
    sid: "005",
    sicknessName: "Acne",
  ),
  SicknessModel(
    docid: "006",
    sid: "006",
    sicknessName: "Eye Issue",
  ),
];
