import 'package:ahramgo/core/utils/routes.dart';
import 'package:ahramgo/features/onboarding/screens/Onboarding.dart';
import 'package:ahramgo/features/onboarding/widgets/custom_care.dart';
import 'package:ahramgo/features/onboarding/widgets/customer_trust.dart';
import 'package:ahramgo/features/onboarding/widgets/services_all_time.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.kOnboarding:
        return MaterialPageRoute(
          builder: (context) => const Onboarding(),
        );
      case Routes.kCustomerTrust:
        return MaterialPageRoute(
          builder: (context) => const CustomerTrust(),
        );
      case Routes.kServicesAllTime:
        return MaterialPageRoute(
          builder: (context) => const ServicesAllTime(),
        );
      case Routes.kCustomCare:
        return MaterialPageRoute(
          builder: (context) => const CustomCare(),
        );
      default:
        return null;
    }
  }
}
