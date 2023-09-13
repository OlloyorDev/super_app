part of 'all_receipts_bloc.dart';

abstract class AllReceiptsEvent extends Equatable {
  const AllReceiptsEvent();
}

class GetDataBase extends AllReceiptsEvent {
  const GetDataBase();

  @override
  List<Object?> get props => [];
}

class DeleteIndexImage extends AllReceiptsEvent {
  const DeleteIndexImage({
    required this.index,
  });

  final int index;

  @override
  List<Object?> get props => [index];
}
