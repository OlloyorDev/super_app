import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/core/log_bloc_observer.dart';
import 'package:super_app/core/theme/app_theme.dart';
import 'package:super_app/route/app_route.dart';
import 'package:super_app/route/route_name.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }
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
