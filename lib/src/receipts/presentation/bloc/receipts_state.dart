part of 'receipts_bloc.dart';

class ReceiptsState extends Equatable {
  const ReceiptsState({
    this.isCamera = false,
    this.cameraStatus = CameraStatus.loading,
  });

  final bool isCamera;
  final CameraStatus cameraStatus;

  ReceiptsState copyWith({
    bool? isCamera,
    CameraStatus? cameraStatus,
  }) =>
      ReceiptsState(
        isCamera: isCamera ?? this.isCamera,
        cameraStatus: cameraStatus ?? this.cameraStatus,
      );

  @override
  List<Object?> get props => [
        isCamera,
        cameraStatus,
      ];
}

enum CameraStatus { loading, on, off }
