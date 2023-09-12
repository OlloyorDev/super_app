import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/core/theme/app_colors.dart';
import 'package:super_app/core/theme/app_text_styles.dart';
import 'package:super_app/core/utils/app_utils.dart';
import 'package:super_app/route/route_name.dart';
import 'package:super_app/src/receipts/presentation/screens/receipts_screen.dart';
import 'package:super_app/src/upload_receipts/presentation/bloc/uploadreceipts_bloc.dart';

class UploadReceiptsScreen extends StatefulWidget {
  const UploadReceiptsScreen({
    super.key,
    required this.args,
  });

  final UploadReceiptArgs args;

  @override
  State<UploadReceiptsScreen> createState() => _UploadReceiptsScreenState();
}

class _UploadReceiptsScreenState extends State<UploadReceiptsScreen> {
  @override
  void initState() {
    // context.read<UploadReceiptsBloc>().add(InitDataBase());
    debugPrint(widget.args.imageList.length.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<UploadReceiptsBloc, UploadReceiptsState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text('Uploaded receipts'),
          ),
          body: RefreshIndicator(
            onRefresh: () async {},
            child: Padding(
              padding: AppUtils.kPaddingHorizontal16,
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: AppUtils.kGap16),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: widget.args.imageList.length * 2,
                      (context, index) {
                        final imageItem = widget.args.imageList[index ~/ 2];
                        return index.isEven
                            ? Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 66,
                                      alignment: Alignment.center,
                                      child: ListTile(
                                        tileColor: ThemeColors.light.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        contentPadding: AppUtils.kPaddingAll8,
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Ink(
                                            height: 50,
                                            width: 50,
                                            child: Image.asset(widget
                                                .args.imageList[index ~/ 2]),
                                          ),
                                        ),
                                        title: Text(
                                          widget.args.imageList[index ~/ 2].split('/').last,
                                          maxLines: 1,
                                        ),
                                        trailing: IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            context
                                                .read<UploadReceiptsBloc>()
                                                .add(
                                                  DeleteIndexImage(
                                                    index: index,
                                                  ),
                                                );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  AppUtils.kGap4,
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        Routes.receipt,
                                      );
                                    },
                                    child: Container(
                                      height: 66,
                                      width: 66,
                                      decoration: BoxDecoration(
                                        color: ThemeColors.light.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.camera_alt_outlined,
                                            color: ThemeColors.light.primary,
                                          ),
                                          Text(
                                            'Retake',
                                            style: AppTextStyles
                                                .light.regularCaption1
                                                .copyWith(
                                              color: ThemeColors.light.primary,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : AppUtils.kGap4;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            minimum: AppUtils.kPaddingAll14,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          ThemeColors.light.primary.withOpacity(.15),
                    ),
                    child: Text(
                      '+ Add receipt',
                      style: AppTextStyles.light.regularCaption1.copyWith(
                        color: ThemeColors.light.primary,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                AppUtils.kGap16,
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Confirm'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
