class DoctorModel {
  String? docid, img, doctorName, aboutDoctor, speciality, phoneNumber;

  DoctorModel({
    this.docid,
    this.img,
    this.aboutDoctor,
    this.doctorName,
    this.speciality,
    this.phoneNumber,
  });

  DoctorModel.fromData(Map<String, dynamic> data)
      : docid = data["id"],
        img = data["img"],
        doctorName = data["doctorName"],
        aboutDoctor = data["aboutDoctor"],
        speciality = data["speciality"],
        phoneNumber = data["phoneNumber"];

  Map<String, dynamic> toMap() {
    return {
      "docid": docid,
      "img": img,
      "doctorName": doctorName,
      "aboutDoctor": aboutDoctor,
      "speciality": speciality,
      "phoneNumber": phoneNumber,
    };
  }
}

List<DoctorModel> doctors = [
  DoctorModel(
    docid: "001",
    img: "assets/images/dr_john_clev.png",
    doctorName: "Dr John Clev",
    aboutDoctor:
        "Dr John Clev is an experienced pharmacist, who does excellent work and always has happy patients.",
    speciality: "Pharmacy",
    phoneNumber: "0849672868",
  ),
  DoctorModel(
    docid: "002",
    img: "assets/images/dr_ben_carson.png",
    doctorName: "Dr Ben Carson",
    aboutDoctor:
        "Dr Ben Carson has so many accomplishments, but he's proudly a neurologist who is very good with what he does.",
    speciality: "Neurologist",
    phoneNumber: "08453828419",
  ),
  DoctorModel(
    docid: "003",
    img: "assets/images/dr_brittany_chloe.png",
    doctorName: "Dr Brittany Chloe",
    aboutDoctor:
        "Dr Brittany Chole is an experienced doctor, who works very well with people.",
    speciality: "Medicine",
    phoneNumber: "0849672868",
  ),
  DoctorModel(
    docid: "004",
    img: "assets/images/dr_frank_goth.png",
    doctorName: "Dr Frank Goth",
    aboutDoctor:
        "Dr Frank Goth, also known a Pastor Goth is a experienced gastroenterologist and also a pastor. You are in a safe hand with him",
    speciality: "Gastroenterologist",
    phoneNumber: "0264584901",
  ),
  DoctorModel(
    docid: "005",
    img: "assets/images/dr_uzo_wolf.png",
    doctorName: "Dr Uzo Wolf",
    aboutDoctor:
        "Dr Uzo Wolf is an excellent dermatologist who has been known to be the people's favourite.",
    speciality: "Dermatologist",
    phoneNumber: "053862997",
  ),
  DoctorModel(
    docid: "006",
    img: "assets/images/dr_abdul_adam.png",
    doctorName: "Dr Abdul Adam",
    aboutDoctor:
        "Dr Abdul Adamu is an experienced optometrist who is constantly working on improving his skills.",
    speciality: "Optometry",
    phoneNumber: "0849672868",
  ),
];
