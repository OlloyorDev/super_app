import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/core/extention/count_extention.dart';
import 'package:super_app/core/theme/app_colors.dart';
import 'package:super_app/core/utils/app_utils.dart';
import 'package:super_app/route/route_name.dart';
import 'package:super_app/src/all_receipts/presentation/bloc/all_receipts_bloc.dart';

import '../../../upload_receipts/presentation/screens/upload_receipts_screen.dart';

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
              SliverPadding(
                padding: AppUtils.kPaddingHorizontal16,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: (state.imageList ?? []).length * 2,
                    (context, index) {
                      final imageItem = state.imageList?[index ~/ 2];
                      if (index.isEven) {
                        return ListTile(
                          tileColor: ThemeColors.light.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: index == 0
                                  ? const Radius.circular(8)
                                  : Radius.zero,
                              topRight: index == 0
                                  ? const Radius.circular(8)
                                  : Radius.zero,
                              bottomLeft:
                                  index == (state.imageList?.length ?? -1)
                                      ? const Radius.circular(8)
                                      : Radius.zero,
                              bottomRight:
                                  index == (state.imageList?.length ?? -1)
                                      ? const Radius.circular(8)
                                      : Radius.zero,
                            ),
                          ),
                          contentPadding: AppUtils.kPaddingAll8,
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Ink(
                              height: 50,
                              width: 50,
                              child: Image.asset(imageItem?['path'] ?? ''),
                            ),
                          ),
                          title: Text(
                            '${imageItem?['path'].split('/').last}',
                            maxLines: 1,
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: Colors.grey,
                          ),
                        );
                      }
                      return AppUtils.kDivider;
                    },
                  ),
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
              ),
              const SliverToBoxAdapter(child: AppUtils.kGap16),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.popAndPushNamed(
                context,
                Routes.camera,
              );
            },
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
        ),
      );
}
