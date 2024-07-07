import 'package:ahramgo/core/utils/app_router.dart';
import 'package:ahramgo/core/utils/assets.dart';
import 'package:ahramgo/core/utils/routes.dart';
import 'package:ahramgo/features/onboarding/widgets/custom_services_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'row_custom_button.dart';

class CustomerTrust extends StatelessWidget {
  const CustomerTrust({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const ServicesScreen(
            image: kSecondOnboarding,
            text1: "الثقة أساس عملنا",
            text2: "لن تشعر أننا غرباء عنك، ثقة العملاء هي رأس مال التطبيق،",
            text3: "نسعى بجهد للمحافظة على عملائنا."),
        Padding(
          padding: const EdgeInsets.only(
              bottom: 20.0), // Optional: Add some padding to the bottom
          child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(Routes.kServicesAllTime);
              },
              child: const ListCustomButton()),
        ),
      ],
    ));
  }
}
