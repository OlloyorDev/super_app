import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/data/source/database_helper.dart';

part 'all_receipts_event.dart';

part 'all_receipts_state.dart';

class AllReceiptsBloc extends Bloc<AllReceiptsEvent, AllReceiptsState> {
  AllReceiptsBloc({
    required this.databaseHelper,
  }) : super(const AllReceiptsState()) {
    on<GetDataBase>(_getDataBase);
  }

  final DatabaseHelper databaseHelper;

  /// get all images
  Future<void> _getDataBase(
    GetDataBase event,
    Emitter<AllReceiptsState> emit,
  ) async {
    final List<Map<String, dynamic>> imageList = await databaseHelper.getImages();
    emit(state.copyWith(
      imageList: imageList,
    ));
  }
}
