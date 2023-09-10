import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_receipts_event.dart';

part 'all_receipts_state.dart';

class AllReceiptsBloc extends Bloc<AllReceiptsEvent, AllReceiptsState> {
  AllReceiptsBloc() : super(const AllReceiptsState()) {
    on<AllReceiptsEvent>((event, emit) {});
  }
}
