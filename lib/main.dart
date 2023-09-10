import 'package:flutter/material.dart';
import 'package:super_app/core/theme/app_theme.dart';
import 'package:super_app/route/app_route.dart';
import 'package:super_app/route/route_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        initialRoute: Routes.splash,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        onUnknownRoute: AppRoutes.onUnknownRoute,
      );
}
