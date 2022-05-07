class Units {
  int idUnit;
  String nameUnit;

  Units({this.idUnit, this.nameUnit});

  Map<String, dynamic> toMap() => {
        "idUnit": idUnit,
        "nameUnit": nameUnit,
      };

  Units.fromMap(dynamic unit) {
    this.idUnit = unit['idUnit'];
    this.nameUnit = unit['nameUnit'];
  }
}
