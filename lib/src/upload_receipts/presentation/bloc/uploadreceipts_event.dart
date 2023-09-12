part of 'uploadreceipts_bloc.dart';

abstract class UploadReceiptsEvent extends Equatable {
  const UploadReceiptsEvent();
}

class InitDataBase extends UploadReceiptsEvent {
  @override
  List<Object?> get props => [];
}
