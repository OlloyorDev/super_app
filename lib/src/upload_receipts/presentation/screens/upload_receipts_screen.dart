import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/src/upload_receipts/presentation/bloc/uploadreceipts_bloc.dart';

class UploadReceiptsScreen extends StatefulWidget {
  const UploadReceiptsScreen({super.key});

  @override
  State<UploadReceiptsScreen> createState() => _UploadReceiptsScreenState();
}

class _UploadReceiptsScreenState extends State<UploadReceiptsScreen> {
  @override
  void initState() {
    context.read<UploadReceiptsBloc>().add(InitDataBase());
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
            child: ListView.builder(
              itemCount: state.imageList?.length ?? 0,
              itemBuilder: (context, index) {
                final imageItem = state.imageList?[index];
                return ListTile(
                  leading: Image.asset(imageItem?['path'] ?? ''),
                  title: Text(
                    '${imageItem?['path'].split('/').last}',
                    maxLines: 1,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<UploadReceiptsBloc>().add(
                            DeleteIndexImage(
                              index: index,
                            ),
                          );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      );
}
