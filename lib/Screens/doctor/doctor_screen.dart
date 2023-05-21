import 'package:clinicmanagement/Screens/doctor/state.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/models/doctor.dart';
import '../Homes/search.dart';
import 'cubit.dart';

class DoctorScreen extends StatelessWidget {
  final List<DoctorModel> doctors;
  const DoctorScreen({Key? key, required this.doctors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.teal,
                title: const Text(
                  'Doctor of Kind',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Search()));
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                ],
              ),
              body: ConditionalBuilder(
                condition: state is! LoadingCategoriesState,
                builder: (context) => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildExpertList(doctors[index]),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: 10,
                ),
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
              ),
            );
          },
        ));
  }
}

//هاد للخط الفاصل
Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

// ليست
Widget buildExpertList(DoctorModel doctorModel) => Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage(doctorModel.image),
                    width: 160,
                    height: 140,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "name : ${doctorModel.name}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "expert : ${doctorModel.expert}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "phoneNumber :  ${doctorModel.phone}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Rating: ${doctorModel.rate}",
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            // Icon(
                            //   Icons.star,
                            //   size: 15,
                            //   color: Colors.yellow,
                            // ),
                            // Icon(
                            //   Icons.favorite,
                            //   size: 15,
                            //   color: Colors.red,
                            // ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
