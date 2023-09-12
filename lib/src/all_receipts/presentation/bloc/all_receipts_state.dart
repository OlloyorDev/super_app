part of 'all_receipts_bloc.dart';

class AllReceiptsState extends Equatable {
  const AllReceiptsState({
    this.imageList,
  });

  final List<Map<String, dynamic>>? imageList;

  AllReceiptsState copyWith({
    List<Map<String, dynamic>>? imageList,
  }) =>
      AllReceiptsState(
        imageList: imageList ?? this.imageList,
      );

  @override
  List<Object?> get props => [imageList];
}
