import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/shared/bloc/patient_data/cubit.dart';
import 'package:mobile_app/shared/bloc/patient_data/states.dart';
import 'package:mobile_app/shared/bloc/profile/cubit.dart';
import 'package:mobile_app/shared/components/components.dart';
import 'package:mobile_app/shared/styles/constant.dart';

class HomePatientScreen extends StatefulWidget {
  const HomePatientScreen({Key? key}) : super(key: key);

  @override
  State<HomePatientScreen> createState() => _HomePatientScreenState();
}

class _HomePatientScreenState extends State<HomePatientScreen> {
  @override
  void initState() {
    super.initState();
    var cubit = AppPatientCubit.get(context);
    cubit.getCheckUpForPatient();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppPatientCubit, GetPatientStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppPatientCubit();
        var prof = AppDoctorProfileCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: buildPopMenuButton(context),
          ),
          body: Padding(
            padding:
                const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 50),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    patientDataBuilder(getPatientCheckUp, context),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
