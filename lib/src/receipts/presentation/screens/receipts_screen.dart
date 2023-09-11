import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/constants/svg/app_svg.dart';
import 'package:super_app/core/theme/app_colors.dart';
import 'package:super_app/core/theme/app_text_styles.dart';
import 'package:super_app/core/utils/app_utils.dart';
import 'package:super_app/src/receipts/presentation/bloc/receipts_bloc.dart';
import 'package:super_app/src/receipts/presentation/mixins/receipts_mixin.dart';
import 'package:super_app/src/receipts/presentation/widgets/snap_button.dart';

class ReceiptsScreen extends StatefulWidget {
  const ReceiptsScreen({super.key});

  @override
  State<ReceiptsScreen> createState() => _ReceiptsScreenState();
}

class _ReceiptsScreenState extends State<ReceiptsScreen> with ReceiptsMixin {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    initCameras();
  }

  void initCameras() {
    context
        .read<ReceiptsBloc>()
        .add(const OpenCameraEvent(cameraStatus: CameraStatus.loading));
    availableCameras().then((cameras) {
      if (cameras.isNotEmpty) {
        _controller =
            CameraController(cameras.first, ResolutionPreset.ultraHigh);
        _initializeControllerFuture = _controller.initialize().then((_) {
          setState(() {});
        });
      }
    });
    context
        .read<ReceiptsBloc>()
        .add(const OpenCameraEvent(cameraStatus: CameraStatus.on));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ReceiptsBloc, ReceiptsState>(
        builder: (context, state) => Scaffold(
          backgroundColor: ThemeColors.light.black,
          body: GestureDetector(
            onTap: () {
              if (state.isCamera) {
                context.read<ReceiptsBloc>().add(
                      CameraEvent(
                        isCamera: !state.isCamera,
                      ),
                    );
              }
            },
            child: state.cameraStatus == CameraStatus.loading
                ? const CircularProgressIndicator.adaptive()
                : CameraPreview(
                    _controller,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.close,
                                  color: ThemeColors.light.white,
                                ),
                              ),
                              Text(
                                'Snap a receipt',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.light.appbarTitle.copyWith(
                                  color: ThemeColors.light.white,
                                ),
                              ),
                              const SizedBox(width: 50),
                            ],
                          ),
                        ),
                        AppUtils.kSpacer,
                        Padding(
                          padding: AppUtils.kPaddingHorizontal48,
                          child: Visibility(
                            visible: state.isCamera,
                            maintainAnimation: true,
                            maintainState: true,
                            child: AnimatedOpacity(
                              curve: Curves.fastOutSlowIn,
                              duration: const Duration(milliseconds: 10),
                              opacity: state.isCamera ? 1 : 0,
                              child: Container(
                                height: 91,
                                width: 228,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: ThemeColors.light.background,
                                ),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Ink(
                                        height: 43,
                                        padding: AppUtils.kPaddingHorizontal16,
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Take library',
                                              style: AppTextStyles
                                                  .light.regularCaption1
                                                  .copyWith(
                                                color: ThemeColors.light.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const Icon(Icons.photo_library)
                                          ],
                                        ),
                                      ),
                                    ),
                                    AppUtils.kDivider,
                                    InkWell(
                                      onTap: () {},
                                      child: Ink(
                                        height: 43,
                                        padding: AppUtils.kPaddingHorizontal16,
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Choose files',
                                              style: AppTextStyles
                                                  .light.regularCaption1
                                                  .copyWith(
                                                color: ThemeColors.light.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const Icon(
                                                Icons.file_present_rounded)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SafeArea(
                          child: Ink(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: AppUtils.kPaddingHorizontal48,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SnapButton(
                                    onTap: () {
                                      context.read<ReceiptsBloc>().add(
                                            CameraEvent(
                                              isCamera: !state.isCamera,
                                            ),
                                          );
                                    },
                                    svg: AppSvg.photo,
                                  ),
                                  SnapButton(
                                    onTap: () {
                                      context.read<ReceiptsBloc>().add(
                                            CameraEvent(
                                              isCamera: !state.isCamera,
                                            ),
                                          );
                                    },
                                    icon: Icons.camera_alt_outlined,
                                  ),
                                  SnapButton(
                                    onTap: () {},
                                    svg: AppSvg.flash,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      );
}
