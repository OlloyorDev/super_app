part of 'receipts_bloc.dart';

class ReceiptsState extends Equatable {
  const ReceiptsState({
    this.saveImageStatus = SaveImageStatus.intintial,
  });

  final SaveImageStatus saveImageStatus;

  ReceiptsState copyWith({
    SaveImageStatus? saveImageStatus,
  }) =>
      ReceiptsState(
        saveImageStatus: saveImageStatus ?? this.saveImageStatus,
      );

  @override
  List<Object?> get props => [saveImageStatus];
}
