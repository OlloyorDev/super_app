import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/core/app_utils.dart';
import 'package:super_app/core/extention/app_extention.dart';
import 'package:super_app/core/theme/app_colors.dart';
import 'package:super_app/src/home/presentation/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Super App'),
          ),
          body: Padding(
            padding: AppUtils.kPaddingHorizontal16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  Icons.photo_camera_outlined,
                  size: 40,
                  color: ThemeColors.light.primary,
                ),
                AppUtils.kGap6,
                ElevatedButton(
                  onPressed: () {
                    debugPrint('Start Receipt');
                  },
                  child: const Text(
                    'Start Receipt',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
