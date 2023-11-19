import 'package:aubilous/resourses/app_sizes.dart';
import 'package:aubilous/router/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "WorkSans",

        // Estilo do divider
        dividerTheme: const DividerThemeData(
          thickness: 1,
          space: AppSizes.s08,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: AppSizes.s09,
          ),
          displayMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: AppSizes.s06,
          ),
          displaySmall: TextStyle(
            color: Colors.white.withOpacity(.8),
            fontWeight: FontWeight.w500,
            fontSize: AppSizes.s05,
          ),
          //
          // Title medium
          titleMedium: TextStyle(
            fontSize: AppSizes.s05,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade900,
          ),

          // Body Medium
          bodyMedium: TextStyle(
            fontSize: AppSizes.s03_5,
            color: Colors.grey.shade600,
          ),
        ),
      ),
      initialRoute: AppRouter.managerDashboardFeature,
      onGenerateRoute: AppRouter.controller,
    );
  }
}
