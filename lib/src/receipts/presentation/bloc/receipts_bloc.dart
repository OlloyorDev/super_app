import 'dart:async';
import 'dart:isolate';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/data/source/database_helper.dart';

part 'receipts_event.dart';

part 'receipts_state.dart';

class ReceiptsBloc extends Bloc<ReceiptsEvent, ReceiptsState> {
  ReceiptsBloc({
    required this.databaseHelper,
  }) : super(const ReceiptsState()) {
    on<CameraEvent>(_onCameraEvent);
    on<OpenCameraEvent>(_openCameraEvent);
    on<SaveImageEvent>(_saveImageEvent);
    on<SaveMultiImageEvent>(_saveMultiImageEvent);
  }

  final DatabaseHelper databaseHelper;

  Future<void> _saveImageEvent(
    SaveImageEvent event,
    Emitter<ReceiptsState> emit,
  ) async {
    emit(state.copyWith(saveImageStatus: SaveImageStatus.saving));
    await databaseHelper.insertImage(event.path);
    emit(state.copyWith(saveImageStatus: SaveImageStatus.saved));
  }

  Future<void> _saveMultiImageEvent(
    SaveMultiImageEvent event,
    Emitter<ReceiptsState> emit,
  ) async {
    emit(state.copyWith(
      isCamera: !state.isCamera,
      saveMultiImageStatus: SaveMultiImageStatus.saving,
    ));
    for (final e in event.path) {
      await databaseHelper.insertImage(e);
    }
    emit(state.copyWith(saveMultiImageStatus: SaveMultiImageStatus.saved));
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

  Future<void> writeImagesWithIsolate({
    required DatabaseHelper database,
    required List<String> list,
  }) async {
    final receivePort = ReceivePort();
    final isolate = await Isolate.spawn(
      (message) async {
        final list = message['list']! as List<String>;
        final sendPort = message['sendPort']! as SendPort;
        for (final e in list) {
          await database.insertImage(e);
        }
        sendPort.send('done');
      },
      {
        'list': list,
        'sendPort': receivePort.sendPort,
      },
    );
    final completer = Completer<void>();
    receivePort.listen((message) {
      if (message == 'done') {
        completer.complete();
        receivePort.close();
      }
    });
    await completer.future;
    isolate.kill();
  }
}
