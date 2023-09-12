import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/core/theme/app_colors.dart';
import 'package:super_app/core/theme/app_text_styles.dart';
import 'package:super_app/core/utils/app_utils.dart';
import 'package:super_app/route/route_name.dart';
import 'package:super_app/src/all_receipts/presentation/bloc/all_receipts_bloc.dart';
import 'package:super_app/src/upload_receipts/presentation/bloc/uploadreceipts_bloc.dart';

class AllReceiptsScreen extends StatefulWidget {
  const AllReceiptsScreen({super.key});

  @override
  State<AllReceiptsScreen> createState() => _AllReceiptsScreenState();
}

class _AllReceiptsScreenState extends State<AllReceiptsScreen> {
  @override
  void initState() {
    context.read<AllReceiptsBloc>().add(const GetDataBase());
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AllReceiptsBloc, AllReceiptsState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text('All Receipt'),
          ),
          body: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: AppUtils.kGap16),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: (state.imageList ?? []).length * 2,
                  (context, index) {
                    final imageItem = state.imageList?[index ~/ 2];
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
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    contentPadding: AppUtils.kPaddingAll8,
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Ink(
                                        height: 50,
                                        width: 50,
                                        child: Image.asset(
                                            imageItem?['path'] ?? ''),
                                      ),
                                    ),
                                    title: Text(
                                      '${imageItem?['path'].split('/').last}',
                                      maxLines: 1,
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ),
                              AppUtils.kGap4,
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 66,
                                  width: 66,
                                  decoration: BoxDecoration(
                                    color: ThemeColors.light.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
              SliverVisibility(
                visible: state.imageList?.isEmpty ?? true,
                sliver: const SliverFillRemaining(
                  child: Center(
                    child: Text(
                      'No image found',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, Routes.receipt);
            },
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
        ),
      );
}
