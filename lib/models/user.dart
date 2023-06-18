class Individual {
  final String? uid, firstname, lastname, gender, dateOfBirth, email;

  Individual({
    this.uid,
    this.firstname,
    this.lastname,
    this.gender,
    this.dateOfBirth,
    this.email,
  });

  Individual.fromData(Map<String, dynamic>? data)
      : uid = data!["id"],
        firstname = data["firstname"],
        lastname = data["lastname"],
        gender = data["gender"],
        dateOfBirth = data["dateOfBirth"],
        email = data["email"];

  Map<String, dynamic> toJson() {
    return {
      "id": uid,
      "firstname": firstname,
      "lastname": lastname,
      "gender": gender,
      "dateOfBirth": dateOfBirth,
      "email": email,
    };
  }
}
