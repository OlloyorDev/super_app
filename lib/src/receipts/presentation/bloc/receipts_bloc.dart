import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'receipts_event.dart';
part 'receipts_state.dart';

class ReceiptsBloc extends Bloc<ReceiptsEvent, ReceiptsState> {
  ReceiptsBloc() : super(ReceiptsInitial()) {
    on<ReceiptsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
