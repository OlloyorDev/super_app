part of 'uploadreceipts_bloc.dart';

class UploadReceiptsState extends Equatable {
  UploadReceiptsState({
    this.imageList,
  });
  List<Map<String, dynamic>>? imageList = [];

  UploadReceiptsState copyWith({
    List<Map<String, dynamic>>? imageList,
  }) => UploadReceiptsState(
      imageList: imageList ?? this.imageList,
    );

  @override
  List<Object?> get props => [];
}
