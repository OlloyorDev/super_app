import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'receipts_event.dart';

part 'receipts_state.dart';

class ReceiptsBloc extends Bloc<ReceiptsEvent, ReceiptsState> {
  ReceiptsBloc() : super(const ReceiptsState()) {
    on<CameraEvent>(_onCameraEvent);
    on<OpenCameraEvent>(_openCameraEvent);
  }

  void _onCameraEvent(
    CameraEvent event,
    Emitter<ReceiptsState> emit,
  ) {
    emit(
      state.copyWith(
        isCamera: event.isCamera,
      ),
    );
  }

  void _openCameraEvent(
    OpenCameraEvent event,
    Emitter<ReceiptsState> emit,
  ) {
    emit(
      state.copyWith(
        cameraStatus: event.cameraStatus,
      ),
    );
  }
}
