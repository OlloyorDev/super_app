part of 'camera_bloc.dart';

// ignore: must_be_immutable
class CameraState extends Equatable {
  CameraState({
    this.isCamera = false,
    this.cameraStatus = CameraStatus.loading,
    this.saveImageStatus = SaveImageStatus.intintial,
    this.saveMultiImageStatus = SaveMultiImageStatus.intintial,
    this.images,
  });

  final bool isCamera;
  final CameraStatus cameraStatus;
  final SaveImageStatus saveImageStatus;
  final SaveMultiImageStatus saveMultiImageStatus;
  List<String>? images = [];

  CameraState copyWith({
    bool? isCamera,
    CameraStatus? cameraStatus,
    SaveImageStatus? saveImageStatus,
    SaveMultiImageStatus? saveMultiImageStatus,
    List<String>? images,
  }) =>
      CameraState(
        isCamera: isCamera ?? this.isCamera,
        cameraStatus: cameraStatus ?? this.cameraStatus,
        saveImageStatus: saveImageStatus ?? SaveImageStatus.intintial,
        saveMultiImageStatus:
            saveMultiImageStatus ?? SaveMultiImageStatus.intintial,
        images: images ?? this.images,
      );

  @override
  List<Object?> get props => [
        isCamera,
        cameraStatus,
        saveImageStatus,
        saveMultiImageStatus,
        images,
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
