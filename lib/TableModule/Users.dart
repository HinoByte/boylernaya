class Users {
  int idUser;
  String firstName;
  String lastName;
  String loginName;
  String password;
  int isAdmin;

  Users({
    this.idUser,
    this.firstName,
    this.lastName,
    this.loginName,
    this.password,
    this.isAdmin,
  });

  Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "firstName": firstName,
        "lastName": lastName,
        "loginName": loginName,
        "password": password,
        "isAdmin": isAdmin,
      };
  Users.fromMap(dynamic user) {
    this.idUser = user['idUser'];
    this.firstName = user['firstName'];
    this.lastName = user['lastName'];
    this.loginName = user['loginName'];
    this.password = user['password'];
    this.isAdmin = user['isAdmin'];
  }
}
