import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:super_app/core/utils/app_utils.dart';
import 'package:super_app/core/extention/app_extention.dart';
import 'package:super_app/core/theme/app_colors.dart';
import 'package:super_app/route/route_name.dart';
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
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AppUtils.kGap6,
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.allReceipt);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_present_sharp,
                          size: 25,
                          weight: 1,
                        ),
                        AppUtils.kGap12,
                        Text(
                          'All Receipt',
                        ),
                      ],
                    ),
                  ),
                  AppUtils.kGap12,
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.receipt);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.photo_camera_outlined,
                          size: 25,
                          weight: 1,
                        ),
                        AppUtils.kGap12,
                        Text(
                          'Start Receipt',
                        ),
                      ],
                    ),
                  ),
                  AppUtils.kGap100,
                ],
              ),
            ),
          ),
        ),
      );
}
