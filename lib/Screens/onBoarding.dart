import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components.dart/cachHelper.dart';

class BoardingModel {
  String? image;
  String? title1;
  String? title2;

  BoardingModel({
    required this.image,
    required this.title1,
    required this.title2,
  });
}

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<BoardingModel> onboarding = [
    BoardingModel(
        image: 'assets/images/Public health-amico.png',
        title1: 'Welcome to our app',
        title2: 'We are here to make your life easier'),
    BoardingModel(
        image: 'assets/images/Rhinoplasty-bro.png',
        title1: 'clinicPioneers',
        title2:
            'A center that provides you with care in all specialties, saves your time, and facilitates communication with the most skilled doctors'),
    BoardingModel(
        image: 'assets/images/Public health-amico.png',
        title1: 'Now , if you are ready',
        title2: 'Let\'s Get Start  ;)'),
  ];

  var boardingController = PageController();

  bool islast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                  onPressed: () {
                    CacheHelper.saveData(key: 'onBoarding', value: true).then(
                      (value) {
                        // if (value == true)
                        //  navigateAndFinish(context, ShopLogin());
                      },
                    );
                  },
                  child: const Text(
                    'skip',
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'font',
                        color: Color(0xFF11CCC3)),
                  )),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) =>
                      onboardingItem(onboarding[index]),
                  itemCount: onboarding.length,
                  controller: boardingController,
                  onPageChanged: (index) {
                    if (index == onboarding.length - 1) {
                      setState(() {
                        islast = true;
                      });
                    } else {
                      setState(() {
                        islast = false;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardingController,
                    count: onboarding.length,
                    effect: const ExpandingDotsEffect(
                        activeDotColor: Color(0xFF11CCC3),
                        dotHeight: 10,
                        dotColor: Colors.grey,
                        spacing: 2,
                        expansionFactor: 2),
                  ),
                  const Spacer(),
                  FloatingActionButton(
                    backgroundColor: Color(0xFF11CCC3),
                    onPressed: () {
                      if (islast) {
                        CacheHelper.saveData(key: 'onBoarding', value: true)
                            .then((value) {
                          if (value == true) {
                            //  navigateAndFinish(context, ShopLogin());
                          }
                        });
                      }

                      boardingController.nextPage(
                          duration: const Duration(milliseconds: 50),
                          curve: Curves.fastLinearToSlowEaseIn);
                    },
                    child: const Icon(
                      FontAwesomeIcons.arrowRight,
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget onboardingItem(BoardingModel model) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Image(image: AssetImage('${model.image}')),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${model.title1}',
          style: const TextStyle(
              fontFamily: 'font', fontSize: 30, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${model.title2}',
          style: const TextStyle(
            fontFamily: 'font',
            fontSize: 20,
          ),
        ),
      ]);
}
