import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/data/source/database_helper.dart';

part 'uploadreceipts_event.dart';

part 'uploadreceipts_state.dart';

class UploadReceiptsBloc
    extends Bloc<UploadReceiptsEvent, UploadReceiptsState> {
  UploadReceiptsBloc({
    required this.databaseHelper,
  }) : super(UploadReceiptsState()) {
    on<InitDataBase>(_initDataBase);
  }

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

  final DatabaseHelper databaseHelper;
}
