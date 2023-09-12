import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/data/source/database_helper.dart';

part 'uploadreceipts_event.dart';

part 'uploadreceipts_state.dart';

class UploadReceiptsBloc
    extends Bloc<UploadReceiptsEvent, UploadReceiptsState> {
  UploadReceiptsBloc({
    required this.databaseHelper,
  }) : super(const UploadReceiptsState()) {
    on<InitDataBase>(_initDataBase);
    on<DeleteIndexImage>(_deleteIndexImage);
  }

  final DatabaseHelper databaseHelper;

  Future<void> _initDataBase(
    InitDataBase event,
    Emitter<UploadReceiptsState> emit,
  ) async {
    final List<Map<String, dynamic>> imageList =
        await databaseHelper.getImages();
    emit(state.copyWith(
      imageList: imageList,
    ));
  }

  Future<void> _deleteIndexImage(
    DeleteIndexImage event,
    Emitter<UploadReceiptsState> emit,
  ) async {
    var imageList = state.imageList;
    final int id = imageList?[event.index]['id'];
    await databaseHelper.deleteImage(id);
    imageList = await databaseHelper.getImages();
    emit(
      state.copyWith(
        imageList: imageList,
      ),
    );
  }
}
