class Individual {
  final String? id, firstname, lastname, gender, dateOfBirth, email;

  Individual({
    this.id,
    this.firstname,
    this.lastname,
    this.gender,
    this.dateOfBirth,
    this.email,
  });

  Individual.fromData(Map<String, dynamic> data)
      : id = data["id"],
        firstname = data["firstname"],
        lastname = data["lastname"],
        gender = data["gender"],
        dateOfBirth = data["dateOfBirth"],
        email = data["email"];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstname": firstname,
      "lastname": lastname,
      "gender": gender,
      "dateOfBirth": dateOfBirth,
      "email": email,
    };
  }
}
