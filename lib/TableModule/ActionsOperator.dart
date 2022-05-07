class ActionsOperator {
  int idAction;
  int idUser;
  int idUnit;
  int status;
  String dataTime;

  ActionsOperator(
      {this.idAction, this.idUser, this.idUnit, this.status, this.dataTime});

  Map<String, dynamic> toMap() => {
        "idAction": idAction,
        "idUser": idUser,
        "idUnit": idUnit,
        "status": status,
        "dataTime": dataTime,
      };

  ActionsOperator.fromMap(dynamic action) {
    this.idAction = action['idAction'];
    this.idUser = action['idUser'];
    this.idUnit = action['idUnit'];
    this.status = action['status'];
    this.dataTime = action['dataTime'];
  }
}
