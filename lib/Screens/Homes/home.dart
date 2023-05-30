import 'package:clinicmanagement/Screens/Homes/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'dummy_data/clinics_dummy_data.dart';
import '../doctor/doctor_screen.dart';
import '../../models/clinic.dart';
import 'package:animations/animations.dart';

final List<Image> images = [
  Image.asset('assets/images/3.jpg'),
  Image.asset('assets/images/2.jpg'),
  Image.asset('assets/images/1.jpg'),
  Image.asset('assets/images/4.jpg'),
];

bool _isPlaying = true;

class HOME extends StatefulWidget {
  const HOME({super.key});

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;
  void _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  @override
  void initState() {
    /// Creating a scroll controller and adding a listener to it.
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double scrollOffset = _scrollControllerOffset;
    return Column(children: [
      Container(
        height: 150.sp,
        width: double.infinity,
        child: CarouselSlider.builder(
          unlimitedMode: true,
          slideBuilder: (index) {
            return Container(alignment: Alignment.center, child: images[index]);
          },
          slideTransform: CubeTransform(),
          slideIndicator: CircularSlideIndicator(
            currentIndicatorColor: Color(0xff11CCC3),
            padding: EdgeInsets.only(bottom: 32),
            indicatorBorderColor: Colors.grey,
          ),
          itemCount: images.length,
          initialPage: 0,
          enableAutoSlider: true,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 8, right: 8),
        child: GestureDetector(
          child: Container(
            width: 280,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFF11CCC3),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      size: 20,
                      color: Colors.white,
                    ),
                    Text(
                      'Search for Clinic',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('')
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
            itemBuilder: (ctx, index) => AnimationConfiguration.staggeredGrid(
                position: 4,
                duration: Duration(milliseconds: 375),
                columnCount: 2,
                child: ScaleAnimation(
                    child: FadeInAnimation(
                  child: buildClinicItem(ctx, clinics[index]),
                ))),
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
              color: Color(0xFF11CCC3),
            ),
            top: BorderSide(width: 3.0, color: Color(0xFF11CCC3)),
            bottom: BorderSide(
              width: 3.0,
              color: Color(0xFF11CCC3),
            ),
            right: BorderSide(width: 3.0, color: Color(0xFF11CCC3)),
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
              style: const TextStyle(
                  fontFamily: 'font', color: Colors.black, fontSize: 24),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DoctorScreen(
                      doctors: clinic.doctors,
                    )));
      },
    );
  }
}
