import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/core/theme/app_colors.dart';
import 'package:super_app/core/theme/app_text_styles.dart';
import 'package:super_app/core/utils/app_utils.dart';
import 'package:super_app/route/route_name.dart';
import 'package:super_app/src/camera/presentation/bloc/camera_bloc.dart';
import 'package:super_app/src/receipts/presentation/bloc/receipts_bloc.dart';

class ReceiptsScreen extends StatefulWidget {
  const ReceiptsScreen({
    super.key,
    required this.args,
  });

  final ReceiptsScreenArgs args;

  @override
  State<ReceiptsScreen> createState() => _ReceiptsScreenState();
}

class _ReceiptsScreenState extends State<ReceiptsScreen> {
  @override
  Widget build(BuildContext context) =>
      BlocConsumer<ReceiptsBloc, ReceiptsState>(
        listener: (context, state) {
          if (state.saveImageStatus == SaveImageStatus.saved) {
            Navigator.popAndPushNamed(context, Routes.allReceipt,
                arguments: widget.args);
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Receipts'),
          ),
          body: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: AppUtils.kGap16),
              SliverPadding(
                padding: AppUtils.kPaddingHorizontal5,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: widget.args.path.length * 2,
                    (context, index) => index.isEven
                        ? ListTile(
                            leading: Image.asset(widget.args.path[index ~/ 2]),
                            tileColor: ThemeColors.light.white,
                            title: Text(
                              widget.args.path[index ~/ 2].split('/').last,
                              maxLines: 1,
                            ),
                          )
                        : AppUtils.kDivider,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: AppUtils.kGap16),
            ],
          ),
          bottomNavigationBar: SafeArea(
            minimum: AppUtils.kPaddingAll14,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      sortAndGroupImages(imagePaths);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          ThemeColors.light.primary.withOpacity(.15),
                    ),
                    child: Text(
                      'Restore',
                      style: AppTextStyles.light.regularCaption1.copyWith(
                        color: ThemeColors.light.primary,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                // SliverToBoxAdapter(
                //   child: Column(
                //     children: [],
                //   ),
                // ),
                AppUtils.kGap16,
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<ReceiptsBloc>().add(
                            ReceiptSaveImageEvent(
                              path: widget.args.path,
                            ),
                          );
                    },
                    child: const Text('Save Changes'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class ReceiptsScreenArgs {
  const ReceiptsScreenArgs({
    required this.path,
  });

  final List<String> path;
}

List<String> imagePaths = [
  'image1.png',
  'image2.jpeg',
  'image3.jpeg',
  'image4.png',
  'image5.jpeg',
  'image6.png',
  'image7.png',
  'image8.svg',
  'image8.gif',
  'image8.jpg',
  'image8.mpg',
  'image8.png',
  'image8.webm',
];

class ImageFile {
  ImageFile({
    required this.path,
    required this.type,
  });

  String path;
  String type;
}

List<String> sortAndGroupImages(List<String> images) {
  final List<ImageFile> imageFiles = [];
  final Set sortList = {};
  for (final e in images) {
    print(e.split('.').last);
    sortList.add(e.split('.').last);
  }
  print('newnewnew');
  print(sortList);
  return images;
}
