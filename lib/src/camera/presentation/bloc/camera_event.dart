part of 'camera_bloc.dart';

abstract class CamerasEvent extends Equatable {
  const CamerasEvent();
}

class CameraEvent extends CamerasEvent {
  const CameraEvent({required this.isCamera});

  final bool isCamera;

  @override
  List<Object?> get props => [isCamera];
}

class OpenCameraEvent extends CamerasEvent {
  const OpenCameraEvent({
    required this.cameraStatus,
  });

  final CameraStatus cameraStatus;

  @override
  List<Object?> get props => [];
}

class SaveImageEvent extends CamerasEvent {
  const SaveImageEvent({
    required this.path,
  });

  final String path;

  @override
  List<Object?> get props => [path];
}

class SaveMultiImageEvent extends CamerasEvent {
  const SaveMultiImageEvent({
    required this.path,
  });

  final List<String> path;

  @override
  List<Object?> get props => [path];
}
