import 'package:ahramgo/core/utils/app_router.dart';
import 'package:ahramgo/core/utils/assets.dart';
import 'package:ahramgo/feature/onBoarding/presentation/views/widgets/RowCustomButton.dart';
import 'package:ahramgo/feature/onBoarding/presentation/views/widgets/CustomServicesScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Onboardingbody extends StatelessWidget {
  const Onboardingbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Servicesscreen(
              image: AssetsData.image0,
              text1: "مصداقية في الوقت",
              text2: "نساعدك في الوصول إلى المكان المطلوب في الوقت المحدد    .",
              text3: "     بدون أي تأخير منّا"),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 20.0), // Optional: Add some padding to the bottom
            child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kCustomertrust);
                },
                child: const ListCustomButton()),
          ),
        ],
      ),
    );
  }
}
