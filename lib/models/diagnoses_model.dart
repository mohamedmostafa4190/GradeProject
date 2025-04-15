class DiagnosesModel {
  int? id;
  String? diagnoseName;

  DiagnosesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    diagnoseName = json['diagnose_name'];
  }
}
