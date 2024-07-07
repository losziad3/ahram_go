import 'package:ahramgo/core/utils/app_router.dart';
import 'package:ahramgo/core/utils/routes.dart';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Cairo'),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.kOnboarding,
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
