import 'package:ahramgo/components/custom_button.dart';
import 'package:ahramgo/core/utils/assets.dart';
import 'package:ahramgo/core/utils/routes.dart';
import 'package:ahramgo/features/onboarding/widgets/custom_services_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomCare extends StatelessWidget {
  const CustomCare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ServicesScreen(
              image: kFourthOnboarding,
              text1: "رعاية كاملة وشاملة",
              text2: "نسعى لتوفير كل سُبل الرعاية الشاملة من أجل سياريتك وكل ",
              text3: "هذا في مكان واحد."),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(Routes.kLoginScreen);
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.10,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 20, left: 15, right: 15),
                child: CustomButton(
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
