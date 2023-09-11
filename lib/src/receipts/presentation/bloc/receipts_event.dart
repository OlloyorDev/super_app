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
