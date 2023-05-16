import 'package:clinicmanagement/search.dart';
import 'package:flutter/material.dart';

import 'doctor/doctor_screen.dart';
import 'dummy_data/clinics_dummy_data.dart';
import 'models/clinic.dart';

class HOME extends StatefulWidget {
  const HOME({super.key});

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 8, right: 8),
        child: GestureDetector(
          child: Container(
            width: 280,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: const [
                    Text(
                      '  Search of a Clinics',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 85,
                    ),
                    Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Search()));
          },
        ),
      ),
      const SizedBox(
        height: 25,
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 200),
            itemBuilder: (ctx, index) => buildClinicItem(ctx, clinics[index]),
            itemCount: clinics.length,
          ),
        ),
      ),
    ]);
  }

  GestureDetector buildClinicItem(BuildContext context, Clinic clinic) {
    return GestureDetector(
      child: Container(
        width: 150,
        height: 250,
        decoration: BoxDecoration(
          border: const Border(
            left: BorderSide(
              width: 3.0,
              color: Colors.teal,
            ),
            top: BorderSide(width: 3.0, color: Colors.teal),
            bottom: BorderSide(
              width: 3.0,
              color: Colors.teal,
            ),
            right: BorderSide(width: 3.0, color: Colors.teal),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Image(
              image: AssetImage(clinic.image),
              width: 160,
              height: 140,
            ),
            const SizedBox(
              height: 1.2,
            ),
            Text(
              clinic.name,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) =>  DoctorScreen(doctors:clinic.doctors ,)));
      },
    );
  }
}
