class myuser {
  static const String collection = "myuser";
  String fname;
  String lname;
  String email;
  String id;

  myuser(
      {required this.fname,
      required this.lname,
      required this.email,
      required this.id});

  myuser.fromjson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          fname: json["fname"],
          lname: json["lname"],
          email: json["email"],
        );

  Map<String, dynamic> tojson() {
    return {
      id: "id",
      fname: "fname",
      lname: "lname",
      email: "email",
    };
  }
}
