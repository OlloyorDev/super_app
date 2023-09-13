import 'dart:async';
import 'dart:isolate';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/data/source/database_helper.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CamerasEvent, CameraState> {
  CameraBloc() : super(CameraState()) {
    on<CameraEvent>(_onCameraEvent);
    on<OpenCameraEvent>(_openCameraEvent);
    on<SaveImageEvent>(_saveImageEvent);
    on<SaveMultiImageEvent>(_saveMultiImageEvent);
  }

  void _saveImageEvent(
    SaveImageEvent event,
    Emitter<CameraState> emit,
  ) {
    emit(state.copyWith(saveImageStatus: SaveImageStatus.saving));
    final List<String> images = [event.path];
    emit(state.copyWith(
      images: images,
      saveImageStatus: SaveImageStatus.saved,
    ));
  }

  void _saveMultiImageEvent(
    SaveMultiImageEvent event,
    Emitter<CameraState> emit,
  ) {
    emit(state.copyWith(
      isCamera: !state.isCamera,
      saveMultiImageStatus: SaveMultiImageStatus.saving,
    ));
    final List<String> images = [...event.path];
    emit(state.copyWith(
      images: images,
      saveMultiImageStatus: SaveMultiImageStatus.saved,
    ));
  }

  void _onCameraEvent(
    CameraEvent event,
    Emitter<CameraState> emit,
  ) {
    emit(
      state.copyWith(
        isCamera: event.isCamera,
      ),
    );
  }

  void _openCameraEvent(
    OpenCameraEvent event,
    Emitter<CameraState> emit,
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
