part of 'receipts_bloc.dart';

class   ReceiptsState extends Equatable {
  const ReceiptsState({
    this.isCamera = false,
    this.cameraStatus = CameraStatus.loading,
    this.saveImageStatus = SaveImageStatus.intintial,
    this.saveMultiImageStatus = SaveMultiImageStatus.intintial,
  });

  final bool isCamera;
  final CameraStatus cameraStatus;
  final SaveImageStatus saveImageStatus;
  final SaveMultiImageStatus saveMultiImageStatus;

  ReceiptsState copyWith({
    bool? isCamera,
    CameraStatus? cameraStatus,
    SaveImageStatus? saveImageStatus,
    SaveMultiImageStatus? saveMultiImageStatus,
  }) =>
      ReceiptsState(
        isCamera: isCamera ?? this.isCamera,
        cameraStatus: cameraStatus ?? this.cameraStatus,
        saveImageStatus: saveImageStatus ?? SaveImageStatus.intintial,
        saveMultiImageStatus: saveMultiImageStatus ?? SaveMultiImageStatus.intintial,
      );

  @override
  List<Object?> get props => [
        isCamera,
        cameraStatus,
        saveImageStatus,
        saveMultiImageStatus,
      ];
}

enum CameraStatus { loading, on, off }

enum SaveImageStatus { intintial, saving, saved }

enum SaveMultiImageStatus { intintial, saving, saved }

extension SaveImageStatusX on SaveImageStatus {
  bool get intintial => this == SaveImageStatus.intintial;

  bool get saving => this == SaveImageStatus.saving;

  bool get isSaved => this == SaveImageStatus.saved;
}

extension SaveMultiImageStatusX on SaveMultiImageStatus {
  bool get intintial => this == SaveMultiImageStatus.intintial;

  bool get saving => this == SaveMultiImageStatus.saving;

  bool get isSaved => this == SaveMultiImageStatus.saved;
}
