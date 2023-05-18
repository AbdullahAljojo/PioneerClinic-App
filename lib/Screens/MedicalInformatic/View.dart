import 'package:clinicmanagement/Screens/MedicalInformatic/Informatic.dart';
import 'package:clinicmanagement/Screens/MedicalInformatic/Informatic_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sizer/sizer.dart';

class MedicalInfo extends StatefulWidget {
  @override
  _MedicalInfoState createState() => _MedicalInfoState();
}

class _MedicalInfoState extends State<MedicalInfo> {
  final InformaticBloc informBloc = InformaticBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Medical Informatic',
            style: TextStyle(
                fontFamily: 'font',
                fontWeight: FontWeight.w500,
                color: Colors.black,
                letterSpacing: 0.6.sp),
          ),
        ),
        body: StreamBuilder<List<informatic>>(
            stream: informBloc.informaticListStream,
            builder: (BuildContext context,
                AsyncSnapshot<List<informatic>> snapshot) {
              if (snapshot.data == null) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff11CCC3),
                    ),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return ListView(
                  children: const [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              }
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 3.w,
                    right: 3.w,
                  ),
                  padding: EdgeInsets.only(
                    left: 2.w,
                    right: 2.w,
                  ),
                  height: 90.h,
                  child: GridView.count(
                    crossAxisCount: 1,
                    children: List.generate(
                      snapshot.data!.length,
                      (int index) {
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: Duration(milliseconds: 375),
                          columnCount: 1,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 8.h,
                                  horizontal: 1.w,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25.sp),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.10),
                                      blurRadius: 7,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Transform.translate(
                                      offset: Offset(0.w, -9.h),
                                      child: Image.asset(
                                        snapshot.data![index].image,
                                        height: 40.h,
                                        width: double.infinity,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 20.h,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${snapshot.data![index].name}',
                                          style: TextStyle(
                                            color: Color(0xff11CCC3),
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            }));
  }
}
