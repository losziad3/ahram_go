import 'package:ahramgo/core/utils/app_router.dart';
import 'package:ahramgo/core/utils/assets.dart';
import 'package:ahramgo/core/utils/routes.dart';
import 'package:ahramgo/core/utils/widgets/CustomButton.dart';
import 'package:ahramgo/features/onboarding/widgets/custom_services_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServicesAllTime extends StatelessWidget {
  const ServicesAllTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ServicesScreen(
              image: kThirdOnboarding,
              text1: "خدمتنا متوفرة طوال الوقت",
              text2: "نسعى بكل جهد أن نكون بجانبكم طوال الوقت، فلن تشعر أنك",
              text3: "بمفردك أبدًا."),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(Routes.kCustomCare);
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.10,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 20, left: 15, right: 15),
                child: Custombutton(
                  text: "ابدأ الآن",
                  color: Color(0xFF144CA1),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
