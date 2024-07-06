import 'package:ahramgo/feature/onBoarding/presentation/views/Onboarding.dart';
import 'package:ahramgo/feature/onBoarding/presentation/views/widgets/Customcare.dart';
import 'package:ahramgo/feature/onBoarding/presentation/views/widgets/CustomerTrust.dart';
import 'package:ahramgo/feature/onBoarding/presentation/views/widgets/ServicesAllTime.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
abstract class AppRouter {
  static const kCustomertrust = '/Customertrust';
  static const kServicesalltime = '/Servicesalltime';
  static const kCustomCare = "/CustomCare";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(
        path: kCustomertrust,
        builder: (context, state) => const Customertrust(),
      ),
      GoRoute(
        path: kServicesalltime,
        builder: (context, state) => const Servicesalltime(),
      ),
      GoRoute(
        path: kCustomCare,
        builder: (context, state) => const CustomCare(),
      ),
    ],
  );
}
