import 'package:ahramgo/core/utils/app_router.dart';
import 'package:ahramgo/core/utils/assets.dart';
import 'package:ahramgo/core/utils/routes.dart';
import 'package:ahramgo/features/onboarding/widgets/custom_services_screen.dart';
import 'package:ahramgo/features/onboarding/widgets/row_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const ServicesScreen(
              image: kFirstOnboarding,
              text1: "مصداقية في الوقت",
              text2: "نساعدك في الوصول إلى المكان المطلوب في الوقت المحدد    .",
              text3: "     بدون أي تأخير منّا"),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 20.0), // Optional: Add some padding to the bottom
            child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(Routes.kCustomerTrust);
                },
                child: const ListCustomButton()),
          ),
        ],
      ),
    );
  }
}
