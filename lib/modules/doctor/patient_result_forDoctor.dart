import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/modules/doctor/profile_screen.dart';
import 'package:mobile_app/shared/bloc/doctor_cubit/cubit.dart';
import 'package:mobile_app/shared/bloc/doctor_cubit/states.dart';
import 'package:mobile_app/shared/bloc/profile/cubit.dart';
import 'package:mobile_app/shared/components/components.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/shared/network/local/cache_helper.dart';

class PatientResults extends StatefulWidget {
  const PatientResults({Key? key}) : super(key: key);

  @override
  State<PatientResults> createState() => _PatientResultsState();
}

class _PatientResultsState extends State<PatientResults> {
  @override
  void initState() {
    super.initState();
    var cubit = AppDoctorCubit.get(context);
    checkUpId = CacheHelper.getData(key: 'CheckUpId');
    cubit.getDrugsResult(checkUpId);
    cubit.getAnalysisResult(checkUpId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppDoctorCubit, GetDoctorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppDoctorCubit.get(context);
        var prof = AppDoctorProfileCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: buildPopMenuButton(context),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 13, top: 7),
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        navigateTo(context, ProfileScreen());
                      },
                      icon: ConditionalBuilder(
                        condition: getDoctor != null,
                        builder: (context) => CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          backgroundImage: image == null
                              ? NetworkImage('${getDoctor?.image?.url}')
                              : NetworkImage(
                                  '${prof.uploadImages?.image?.url}'),
                        ),
                        fallback: (context) =>
                            CircularProgressIndicator(color: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
