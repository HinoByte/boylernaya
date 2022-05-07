class RecordsSensors {
  int idRecord;
  int idUnit;
  int isOpen;
  int tempWater;
  int levelWater;
  int isCrash;
  String dataTime;

  RecordsSensors({
    this.idRecord,
    this.idUnit,
    this.isOpen,
    this.tempWater,
    this.levelWater,
    this.isCrash,
    this.dataTime,
  });

  Map<String, dynamic> toMap() => {
        "idRecord": idRecord,
        "idUnit": idUnit,
        "isOpen": isOpen,
        "tempWater": tempWater,
        "levelWater": levelWater,
        "isCrash": isCrash,
        "dataTime": dataTime,
      };

  RecordsSensors.fromMap(dynamic record) {
    this.idRecord = record['idRecord'];
    this.idUnit = record['idUnit'];
    this.isOpen = record['isOpen'];
    this.tempWater = record['tempWater'];
    this.levelWater = record['levelWater'];
    this.isCrash = record['isCrash'];
    this.dataTime = record['dataTime'];
  }
}
