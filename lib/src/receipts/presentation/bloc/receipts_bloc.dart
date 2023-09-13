import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/data/source/database_helper.dart';
import 'package:super_app/src/camera/presentation/bloc/camera_bloc.dart';

part 'receipts_event.dart';

part 'receipts_state.dart';

class ReceiptsBloc extends Bloc<ReceiptsEvent, ReceiptsState> {
  ReceiptsBloc(
    this.databaseHelper,
  ) : super(const ReceiptsState()) {
    on<ReceiptSaveImageEvent>(_saveImageEvent);
  }

  final DatabaseHelper databaseHelper;

  Future<void> _saveImageEvent(
    ReceiptSaveImageEvent event,
    Emitter<ReceiptsState> emit,
  ) async {
    emit(state.copyWith(saveImageStatus: SaveImageStatus.saving));
    for (final e in event.path) {
      await databaseHelper.insertImage(e);
    }
    emit(state.copyWith(
      saveImageStatus: SaveImageStatus.saved,
    ));
  }
}
