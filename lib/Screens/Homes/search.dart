import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'beauty/beauty.dart';
import 'bony/bony.dart';
import 'children/children.dart';
import 'heart/heart.dart';
import 'kind/kind.dart';
import 'nerves/nerves.dart';
import 'surgery/surgery.dart';
import 'teeth/teeth.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 10.h),
              child: Lottie.asset('assets/images/searchIcon.json',
                  fit: BoxFit.contain),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: TextFormField(
            //   decoration: InputDecoration(
            //   prefixIcon: Icon(Icons.search,color: Colors.teal,),
            //   labelText: 'Search for a Clinics',
            //   labelStyle: TextStyle(color: Colors.teal),
            //   border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(25),
            //   ),
            //   ),
            //   keyboardType: TextInputType.text,
            //   ),
            // ),
            Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 5.0.sp),
                child: GestureDetector(
                  child: Center(
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFB2DFDB),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Search for Clinic',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          IconButton(
                              onPressed: () {
                                showSearch(
                                    context: context, delegate: Searchs());
                              },
                              icon: Icon(
                                Icons.search,
                                size: 20,
                              ))
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    showSearch(context: context, delegate: Searchs());
                  },
                ),
              ),
            ]),

            //
            // SingleChildScrollView(
            // child: Column(
            // children: [
            // Padding(
            // padding: const EdgeInsets.only(top: 30, left: 15),
            // child: Row(
            // children: [
            // GestureDetector(
            // child: Container(
            // width: 150,
            // height: 180,
            // decoration: BoxDecoration(
            // // color: Colors.teal,
            // borderRadius: BorderRadius.circular(25),
            // ),
            // child: Column(
            // children: [
            // Image(
            // image: AssetImage('assets/images/medicall.png'),
            // width: 110,
            // height: 110,
            // ),
            // SizedBox(
            // height: 20,
            // ),
            // Text(
            // 'medical',
            // style: TextStyle(
            // fontWeight: FontWeight.bold, fontSize: 20),
            // )
            // ],
            // ),
            // ),
            // onTap: () {
            // Navigator.push(context,
            // MaterialPageRoute(builder: (context) => Medical()));
            // },
            // ),
            // SizedBox(
            // width: 20,
            // ),
            // GestureDetector(
            // child: Container(
            // width: 150,
            // height: 180,
            // decoration: BoxDecoration(
            // //color: Colors.teal,
            // borderRadius: BorderRadius.circular(25),
            // ),
            // child: Column(
            // children: [
            // Image(
            // image: AssetImage(
            // 'assets/images/law.png',
            // ),
            // width: 110,
            // height: 110,
            // ),
            // SizedBox(
            // height: 20,
            // ),
            // Text(
            // 'Legal',
            // style: TextStyle(
            // fontWeight: FontWeight.bold, fontSize: 20),
            // )
            // ],
            // ),
            // ),
            // onTap: () {
            // Navigator.push(context,
            // MaterialPageRoute(builder: (context) => Legal()));
            // },
            // ),
            // ],
            // ),
            // ),
            // Padding(
            // padding: const EdgeInsets.only(top: 20, left: 15),
            // child: Row(
            // children: [
            // GestureDetector(
            // child: Container(
            // width: 150,
            // height: 180,
            // decoration: BoxDecoration(
            // //color: Colors.teal,
            // borderRadius: BorderRadius.circular(25),
            // ),
            // child: Column(
            // children: [
            // Image(
            // image: AssetImage(
            // 'assets/images/architectural.png',
            // ),
            // width: 150,
            // height: 150,
            // ),
            // Text(
            // 'Architectural',
            // style: TextStyle(
            // fontWeight: FontWeight.bold, fontSize: 20),
            // )
            // ],
            // ),
            // ),
            // onTap: () {
            // Navigator.push(
            // context,
            // MaterialPageRoute(
            // builder: (context) => Architectural()));
            // },
            // ),
            // SizedBox(
            // width: 25,
            // ),
            // GestureDetector(
            // child: Container(
            // width: 150,
            // height: 180,
            // decoration: BoxDecoration(
            // // color: Colors.teal,
            // borderRadius: BorderRadius.circular(25),
            // ),
            // child: Column(
            // children: [
            // Image(
            // image: AssetImage(
            // 'assets/images/business.png',
            // ),
            // width: 110,
            // height: 110,
            // ),
            // SizedBox(height: 35),
            // Text(
            // 'Business',
            // style: TextStyle(
            // fontWeight: FontWeight.bold, fontSize: 20),
            // )
            // ],
            // ),
            // ),
            // onTap: () {
            // Navigator.push(
            // context,
            // MaterialPageRoute(
            // builder: (context) => Business()));
            // },
            // ),
            // ],
            // ),
            // ),
            // Padding(
            // padding: const EdgeInsets.only(top: 20, left: 15),
            // child: Row(
            // children: [
            // GestureDetector(
            // child: Container(
            // width: 150,
            // height: 180,
            // decoration: BoxDecoration(
            // // color: Colors.teal,
            // borderRadius: BorderRadius.circular(25),
            // ),
            // child: Column(
            // children: [
            // Image(
            // image: AssetImage(
            // 'assets/images/technology.png',
            // ),
            // width: 150,
            // height: 150,
            // ),
            // Text(
            // 'Technology',
            // style: TextStyle(
            // fontWeight: FontWeight.bold, fontSize: 20),
            // )
            // ],
            // ),
            // ),
            // onTap: () {
            // Navigator.push(
            // context,
            // MaterialPageRoute(
            // builder: (context) => Technology()));
            // },
            // ),
            // SizedBox(
            // width: 25,
            // ),
            // GestureDetector(
            // child: Container(
            // decoration: BoxDecoration(
            // //color: Colors.teal,
            // borderRadius: BorderRadius.circular(25),
            // ),
            // child: Column(
            // children: [
            // Image(
            // image: AssetImage(
            // 'assets/images/agriculture.png',
            // ),
            // width: 110,
            // height: 110,
            // ),
            // SizedBox(height: 30),
            // Text(
            // 'Agriculture',
            // style: TextStyle(
            // fontWeight: FontWeight.bold, fontSize: 17),
            // )
            // ],
            // ),
            // ),
            // onTap: () {
            // Navigator.push(
            // context,
            // MaterialPageRoute(
            // builder: (context) => Agriculture()));
            // },
            // ),
            // ],
            // ),
            // ),
            // ],
            // ),
            // ));
          ],
        ));
  }
}

class Searchs extends SearchDelegate {
  List name = [
    'Kind clinic',
    'children clinic',
    'beauty clinic',
    'bony clinic',
    'heart clinic',
    'nerves clinic',
    'surgery clinic',
    'teeth clinic'
  ];
  List screens = [
    KindScreen(),
    ChildrenScreen(),
    BeautyScreen(),
    BonyScreen(),
    HeartScreen(),
    NervesScreen(),
    SurgeryScreen(),
    TeethScreen(),
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filtername =
        name.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
        itemCount: query == "" ? name.length : filtername.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                child: query == ""
                    ? Text(
                        "${name[i]}",
                        style: TextStyle(fontSize: 20),
                      )
                    : GestureDetector(
                        child: Text(
                          "${filtername[i]}",
                          style: TextStyle(fontSize: 20),
                        ),
                        onTap: () {
                          int z = name.indexOf(filtername[i]);
                          print("i=={$z}");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => screens[z]),
                          );

                          /* Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => screens[i]),
                    );*/
                        },
                      )),
          );
        });
    throw UnimplementedError();
  }
}
