// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/models/drugs_model.dart';
import 'package:mobile_app/models/getdoctor_model.dart';
import 'package:mobile_app/models/result_model.dart';
import 'package:mobile_app/shared/bloc/doctor_cubit/states.dart';
import 'package:mobile_app/shared/bloc/end_points.dart';
import 'package:mobile_app/shared/components/components.dart';
import 'package:mobile_app/shared/network/remote/dio.dart';

class AppDoctorCubit extends Cubit<GetDoctorStates> {
  AppDoctorCubit() : super(AppInitialStates());

  static AppDoctorCubit get(context) => BlocProvider.of(context);
  // GetDoctorModel? uploadImages;

// ______________________________________get Doctor Cubit ______________________________________________________
  void getDoctorData(String? id) {
    print("DOCTORDATA: ${DOCTORDATA + id!}");
    emit(AppGetDoctorLoadingStates());
    DioHelper.getData(
      url: DOCTORDATA + id,
    ).then((value) {
      getDoctor = GetDoctorModel.fromJson(value.data);
      emit(AppGetDoctorSuccessStates(getDoctor!));
    }).catchError((error) {
      // print(error.toString());
      emit(AppGetDoctorErrorStates(error.toString()));
    });
  }

  void getCheckUpForDoctor() {
    emit(AppGetCheckUpForDoctorLoadingStates());
    DioHelper.getData(
      url: GETCHECKUPForDoctor,
    ).then((value) {
      getCheckUp = value.data;
      print(getCheckUp);
      emit(AppGetCheckUpForDoctorSuccessStates());
    }).catchError((e) {
      print(e.toString());
      emit(AppGetCheckUpForDoctorErrorStates(e.toString()));
    });
  }

  ResultModel? resultModel;
  void getAnalysisResult(String? id) {
    print("DOCTORDATA: ${DOCTORDATA + checkUpId!}");
    emit(AppGetAnalysisResultsLoadingStates());
    DioHelper.getData(
      url: RESULTS + id!,
    ).then((value) {
      resultModel = ResultModel.fromJson(value.data);
      emit(AppGetAnalysisResultsSuccessStates());
    }).catchError((error) {
      emit(AppGetAnalysisResultsErrorStates(error.toString()));
    });
  }

  CreateCheckUpDrugs? drugs;
  void getDrugsResult(String? id) {
    emit(AppGetDrugResultsLoadingStates());
    DioHelper.getData(
      url: CheckUpDrugs + id!,
    ).then((value) {
      drugs = CreateCheckUpDrugs.fromJson(value.data);
      emit(AppGetDrugResultsSuccessStates());
    }).catchError((error) {
      emit(AppGetDrugResultsErrorStates(error.toString()));
    });
  }
}
