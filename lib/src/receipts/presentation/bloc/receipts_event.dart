part of 'receipts_bloc.dart';

abstract class ReceiptsEvent extends Equatable {
  const ReceiptsEvent();
}

class CameraEvent extends ReceiptsEvent {
  const CameraEvent({required this.isCamera});

  final bool isCamera;

  @override
  List<Object?> get props => [isCamera];
}

class OpenCameraEvent extends ReceiptsEvent {
  const OpenCameraEvent({
    required this.cameraStatus,
  });

  final CameraStatus cameraStatus;

  @override
  List<Object?> get props => [];
}

class SaveImageEvent extends ReceiptsEvent {
  const SaveImageEvent({
    required this.path,
  });

  final String path;

  @override
  List<Object?> get props => [path];
}

class SaveMultiImageEvent extends ReceiptsEvent {
  const SaveMultiImageEvent({
    required this.path,
  });

  final List<String> path;

  @override
  List<Object?> get props => [path];
}
