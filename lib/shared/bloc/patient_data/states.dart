import 'package:mobile_app/models/login_model.dart';

abstract class GetPatientStates {}

class AppInitialStates extends GetPatientStates {}

// ______________________________________get patient States ______________________________________________________
class AppGetPatientLoadingStates extends GetPatientStates {}

class AppGetPatientSuccessStates extends GetPatientStates {}

class AppGetPatientErrorStates extends GetPatientStates {
  final String error;

  AppGetPatientErrorStates(this.error);
}

class AppGetPatientsLoadingStates extends GetPatientStates {}

class AppGetPatientsSuccessStates extends GetPatientStates {}

class AppGetPatientsErrorStates extends GetPatientStates {
  final String error;

  AppGetPatientsErrorStates(this.error);
}

class AppCreateCheckUpLoadingStates extends GetPatientStates {}

class AppCreateCheckUpSuccessStates extends GetPatientStates {}

class AppCreateCheckUpErrorStates extends GetPatientStates {
  final String error;

  AppCreateCheckUpErrorStates(this.error);
}

class AppDrugsLoadingStates extends GetPatientStates {}

class AppDrugsSuccessStates extends GetPatientStates {}

class AppDrugsErrorStates extends GetPatientStates {
  final String error;

  AppDrugsErrorStates(this.error);
}

class AppUpoaldAnalysisLoadingStates extends GetPatientStates {}

class AppUpoaldAnalysisSuccessStates extends GetPatientStates {}

class AppUpoaldAnalysisErrorStates extends GetPatientStates {}
//_______________________________________CheckUpForPatient___________________________________________________________

class AppGetCheckUpForPatientLoadingStates extends GetPatientStates {}

class AppGetCheckUpForPatientSuccessStates extends GetPatientStates {}

class AppGetCheckUpForPatientErrorStates extends GetPatientStates {
  final String error;

  AppGetCheckUpForPatientErrorStates(this.error);
}
//_______________________________________GetDrugResultsPatient___________________________________________________________

class AppGetDrugResultsPatientLoadingStates extends GetPatientStates {}

class AppGetDrugResultsPatientSuccessStates extends GetPatientStates {}

class AppGetDrugResultsPatientErrorStates extends GetPatientStates {}
//_______________________________________GetAnalysisResultsPatient___________________________________________________________

class AppGetAnalysisResultsPatientLoadingStates extends GetPatientStates {}

class AppGetAnalysisResultsPatientSuccessStates extends GetPatientStates {}

class AppGetAnalysisResultsPatientErrorStates extends GetPatientStates {}
