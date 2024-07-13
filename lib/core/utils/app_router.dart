import 'package:ahramgo/core/utils/routes.dart';
import 'package:ahramgo/cubits/auth_cubit/cubit.dart';
import 'package:ahramgo/features/authentication/screens/login_screen.dart';
import 'package:ahramgo/features/authentication/screens/otp_screen.dart';
import 'package:ahramgo/features/onboarding/screens/Onboarding.dart';
import 'package:ahramgo/features/onboarding/widgets/custom_care.dart';
import 'package:ahramgo/features/onboarding/widgets/customer_trust.dart';
import 'package:ahramgo/features/onboarding/widgets/services_all_time.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ahramgo/data/repository/ahram_go_repository.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(
        path: Routes.kCustomerTrust,
        builder: (context, state) => const CustomerTrust(),
      ),
      GoRoute(
        path: Routes.kServicesAllTime,
        builder: (context, state) => const ServicesAllTime(),
      ),
      GoRoute(
        path: Routes.kCustomCare,
        builder: (context, state) => const CustomCare(),
      ),
      GoRoute(
        path: Routes.kLoginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(AhramGoRepository()),
          child: LoginScreen(),
        ),
      ),
      GoRoute(path: Routes.kOTPScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => RegisterCubit(AhramGoRepository()),
        child: OTPScreen(),
      ),
      ),

    ],
  );
}
