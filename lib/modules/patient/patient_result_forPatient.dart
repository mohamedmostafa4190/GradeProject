import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/modules/patient/patient_upload.dart';
import 'package:mobile_app/shared/bloc/patient_data/cubit.dart';
import 'package:mobile_app/shared/bloc/patient_data/states.dart';
import 'package:mobile_app/shared/components/components.dart';
import 'package:mobile_app/shared/network/local/cache_helper.dart';
import 'package:mobile_app/shared/styles/constant.dart';

class PatientResultsForPatient extends StatefulWidget {
  const PatientResultsForPatient({Key? key}) : super(key: key);

  @override
  State<PatientResultsForPatient> createState() => _PatientResultsState();
}

class _PatientResultsState extends State<PatientResultsForPatient> {
  @override
  void initState() {
    super.initState();
    var cubit = AppPatientCubit.get(context);
    checkUpId = CacheHelper.getData(key: 'CheckUpPatientId');
    cubit.getDrugsPatientResult(checkUpId);
    cubit.getAnalysisPatientResult(checkUpId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppPatientCubit, GetPatientStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppPatientCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: buildPopMenuButton(context),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 65, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defulttext(
                          textName: "Description:",
                          size: 21,
                          fontWeight: FontWeight.bold,
                        ),
                        cubit.resultModel?.checkup?.description == null
                            ? defulttext(
                                textName: "  There is No Description",
                                size: 21,
                              )
                            : defulttext(
                                textName:
                                    "  ${cubit.resultModel?.checkup?.description}",
                                size: 21,
                              ),
                        const SizedBox(
                          height: 15,
                        ),
                        defulttext(
                          textName: 'Drugs:',
                          size: 21,
                          fontWeight: FontWeight.bold,
                        ),
                        defulttext(
                          textName: '  ${cubit.drugs?.drug?.drugName}',
                          size: 21,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defulttext(
                          textName: 'Quantity:',
                          size: 21,
                          fontWeight: FontWeight.bold,
                        ),
                        defulttext(
                          textName: '  ${cubit.drugs?.quantity} ',
                          size: 21,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defulttext(
                          textName: 'Times_per_day:',
                          size: 21,
                          fontWeight: FontWeight.bold,
                        ),
                        defulttext(
                          textName: '  ${cubit.drugs?.timesPerDay} times',
                          size: 21,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defulttext(
                          textName: "Analysis Or Ray Image: ",
                          size: 21,
                          fontWeight: FontWeight.bold,
                        ),
                        cubit.resultModel?.image?.url == null
                            ? defulttext(
                                textName: "  There is No Analysis",
                                size: 21,
                              )
                            : Image(
                                image: NetworkImage(
                                    '${cubit.resultModel?.image?.url}'),
                              ),
                        SizedBox(
                          height: 30,
                        ),
                        defultButton(
                            changeText: 'Upload Analysis',
                            height: 80,
                            width: double.infinity,
                            changeColor: btnsColor,
                            onPressed: () {
                              navigateTo(context, PatientUploadAnalysis());
                            }),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
