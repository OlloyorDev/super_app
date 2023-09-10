import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'uploadreceipts_event.dart';

part 'uploadreceipts_state.dart';

class UploadReceiptsBloc
    extends Bloc<UploadreceiptsEvent, UploadReceiptsState> {
  UploadReceiptsBloc() : super(const UploadReceiptsState()) {
    on<UploadreceiptsEvent>((event, emit) {});
  }
}
