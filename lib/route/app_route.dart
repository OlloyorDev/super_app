import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/core/eror/eror_page.dart';
import 'package:super_app/injector_container.dart';
import 'package:super_app/route/route_name.dart';
import 'package:super_app/src/all_receipts/presentation/bloc/all_receipts_bloc.dart';
import 'package:super_app/src/all_receipts/presentation/screens/all_receipts_screen.dart';
import 'package:super_app/src/camera/presentation/bloc/camera_bloc.dart';
import 'package:super_app/src/camera/presentation/screens/camera_screen.dart';
import 'package:super_app/src/home/presentation/bloc/home_bloc.dart';
import 'package:super_app/src/home/presentation/screens/home_screen.dart';
import 'package:super_app/src/receipts/presentation/bloc/receipts_bloc.dart';
import 'package:super_app/src/receipts/presentation/screens/receipts_screen.dart';
import 'package:super_app/src/splash/splash_screen.dart';
import 'package:super_app/src/upload_receipts/presentation/bloc/uploadreceipts_bloc.dart';
import 'package:super_app/src/upload_receipts/presentation/screens/upload_receipts_screen.dart';

part 'name_routes.dart';

sealed class AppRoutes {
  AppRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('route : ${settings.name}');
    }
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<HomeBloc>(),
            child: const HomeScreen(),
          ),
        );
      case Routes.camera:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<CameraBloc>(),
            child: const CameraScreen(),
          ),
        );
      case Routes.receipt:
        final ReceiptsScreenArgs args =
            settings.arguments! as ReceiptsScreenArgs;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<ReceiptsBloc>(),
            child: ReceiptsScreen(args: args),
          ),
        );
      case Routes.allReceipt:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<AllReceiptsBloc>(),
            child: const AllReceiptsScreen(),
          ),
        );
      case Routes.uploadReceipt:
        final UploadReceiptArgs args = settings.arguments! as UploadReceiptArgs;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<UploadReceiptsBloc>(),
            child: UploadReceiptsScreen(args: args),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => ErrorPage(settings: settings));
    }
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('Navigate to: $settings');
    }
    return MaterialPageRoute(
      builder: (_) => ErrorPage(
        settings: settings,
      ),
    );
  }
}
