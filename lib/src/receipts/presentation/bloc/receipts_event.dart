part of 'receipts_bloc.dart';

abstract class ReceiptsEvent extends Equatable {
  const ReceiptsEvent();
}

class ReceiptSaveImageEvent extends ReceiptsEvent {
  const ReceiptSaveImageEvent({
    required this.path,
  });

  final List<String> path;

  @override
  List<Object?> get props => [path];
}
