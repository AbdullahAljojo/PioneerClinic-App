import 'package:clinicmanagement/Components.dart/background.dart';
import 'package:clinicmanagement/Screens/infoDoctor/profileCubit.dart';
import 'package:clinicmanagement/Screens/infoDoctor/profileState.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// bool showHours = false;
// void toggle() {
//   setState(() {
//     showHours = !showHours;
//   });
// }

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
     var  h = MediaQuery.of(context).size.width;
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var priceController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocConsumer<ProfileCubit, ProfileStates>(
       listener: (context, state) {},
      builder: (context, state) => SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Scaffold(
              body: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset('assets/images/pp.jpg',
                    fit: BoxFit.cover, height: 325),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 500,

                // alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    color: const Color(0xff11CCC3),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              'Cardiologist',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white70,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'font',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          buildItem(
                              title: 'name :',
                              controller: nameController,
                              textInputType: TextInputType.name,
                              h:h),
                          const SizedBox(
                            height: 30,
                          ),
                          buildItem(
                              title: 'price :',
                              controller: priceController,
                              textInputType: TextInputType.number,
                              h:h),
                          const SizedBox(
                            height: 30,
                          ),
                          buildItem(
                              title: 'phone :',
                              controller: phoneController,
                              textInputType: TextInputType.number,
                              h:h),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text('Available days :',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'font',
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 30,
                            child: ListView.separated(
                              itemBuilder: (context, indax) => availableDays(
                                  onTap: ProfileCubit.get(context).toggle,
                                  text: 'moday'),
                              separatorBuilder: (context, indax) =>
                                  const SizedBox(
                                width: 20,
                              ),
                              itemCount: 6,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: false,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text('Available Time :',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'font',
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 20),
                          ConditionalBuilder(
                            condition: ProfileCubit.get(context).showHours,
                            builder: (context) => Container(
                              height: 30,
                              child: ListView.separated(
                                itemBuilder: (context, indax) =>
                                    availableDays(text: '2 -> 2:30'),
                                separatorBuilder: (context, indax) =>
                                    const SizedBox(
                                  width: 20,
                                ),
                                itemCount: 2,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: false,
                              ),
                            ),
                            fallback: (context) => const Text(''),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text('book',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontStyle: FontStyle.italic,
                                              fontFamily: 'font',
                                              fontWeight: FontWeight.bold)))),
                              SizedBox(
                                width: 60,
                              ),
                              Container(
                                  width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text('back',
                                          style: TextStyle(
                                              fontSize: 20,
                                              // color: Colors.b,
                                              fontStyle: FontStyle.italic,
                                              fontFamily: 'font',
                                              fontWeight: FontWeight.bold)))),
                            ],
                          )
                        ]),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
      ));
    

//     SafeArea(
//       child:
//       Scaffold(
//           body: Stack(
//         children: <Widget>[
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Image.asset('assets/images/pp.jpg',
//                 fit: BoxFit.cover, height: 325),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               height: 500,

//               // alignment: Alignment.bottomCenter,
//               decoration: BoxDecoration(
//                   color: const Color(0xff11CCC3),
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(60),
//                       topRight: Radius.circular(60))),
//               child: Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                    const Center(
//                       child: Text(
//                         'Cardiologist',
//                         style: TextStyle(
//                             fontSize: 30,
//                             color: Colors.white70,
//                             fontStyle: FontStyle.italic,
//                             fontFamily: 'font',
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     buildItem(
//                         title: 'name :',
//                         controller: nameController,
//                         textInputType: TextInputType.name),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     buildItem(
//                         title: 'price :',
//                         controller: priceController,
//                         textInputType: TextInputType.number),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     buildItem(
//                         title: 'phone :',
//                         controller: phoneController,
//                         textInputType: TextInputType.number),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                    const Text('Available days :',   style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.white,
//                 fontStyle: FontStyle.italic,
//                 fontFamily: 'font',
//                 fontWeight: FontWeight.bold)),
//                const SizedBox(height: 20,),

//               Container(

//                   height: 30,
//                   child: ListView.separated(itemBuilder: (context,indax)=> availableDays(onTap: toggle, text: 'moday'),
//                    separatorBuilder:(context,indax)=>const SizedBox(width: 20,) ,
//                    itemCount: 6,
//                    scrollDirection: Axis.horizontal,
//                    shrinkWrap: false,),
//                 ),
//                 const SizedBox(height: 20),
//                  const  Text('Available Time :',   style: TextStyle (  fontSize: 20,
//                 color: Colors.white,
//                 fontStyle: FontStyle.italic,
//                 fontFamily: 'font',
//                 fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 20),

//                 ConditionalBuilder(condition: showHours ,
//                 builder: (context)=> Container(

//                   height: 30,
//                   child: ListView.separated(itemBuilder: (context,indax)=> availableDays( text: '2 -> 2:30'),
//                    separatorBuilder:(context,indax)=> const SizedBox(width: 20,) ,
//                    itemCount: 2,
//                    scrollDirection: Axis.horizontal,
//                    shrinkWrap: false,),
//                 ),
//                 fallback: (context)=>const Text(''),),
//  const SizedBox(height: 40),
//   Row(mainAxisAlignment: MainAxisAlignment.center,
//     children: [

//     Container(

//       width: 100,
//       height: 50,
//        decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10)),

//       child: TextButton(onPressed: (){}, child: Text('book', style: TextStyle(
//                 fontSize: 20,

//                 fontStyle: FontStyle.italic,
//                 fontFamily: 'font',
//                 fontWeight: FontWeight.bold)))),
//    SizedBox(width: 60,),
//  Container(

//       width: 100,
//       height: 50,
//        decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10)),

//       child: TextButton(onPressed: (){}, child: Text('back', style: TextStyle(
//                 fontSize: 20,
//                // color: Colors.b,
//                 fontStyle: FontStyle.italic,
//                 fontFamily: 'font',
//                 fontWeight: FontWeight.bold)))),
//   ],)

//                   ]),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       )

//           ),
//     );
  }
}

Widget availableDays({void Function()? onTap, required String text}) => InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        decoration: BoxDecoration(
            color: Colors.white70, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          '$text',
        )),
      ),
    );

Widget buildItem(
        {required String title,
        required TextEditingController controller,
        required TextInputType textInputType,
        required var h
        }) =>
    Row(
      //  mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$title',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontFamily: 'font',
                fontWeight: FontWeight.bold)),
        const SizedBox(
          width: 20,
        ),
        Spacer(),
        Container(
          width:h *0.6,
          child: TextFormField(
            controller: controller,
            keyboardType: textInputType,
            validator: (value) {
              if (value!.isEmpty) {
                print('name must not be empty');
              }
            },
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ),
      ],
    );
