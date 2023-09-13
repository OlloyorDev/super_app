import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/data/source/database_helper.dart';

part 'all_receipts_event.dart';

part 'all_receipts_state.dart';

class AllReceiptsBloc extends Bloc<AllReceiptsEvent, AllReceiptsState> {
  AllReceiptsBloc(
    this.databaseHelper,
  ) : super(const AllReceiptsState()) {
    on<GetDataBase>(_getDataBase);
    on<DeleteIndexImage>(_deleteIndexImage);
    on<ClearDbEvent>(_clearDbEvent);
  }

  final DatabaseHelper databaseHelper;

  /// get all images
  Future<void> _getDataBase(
    GetDataBase event,
    Emitter<AllReceiptsState> emit,
  ) async {
    final List<Map<String, dynamic>> imageList =
        await databaseHelper.getImages();
    emit(state.copyWith(
      imageList: imageList,
    ));
  }

  Future<void> _deleteIndexImage(
    DeleteIndexImage event,
    Emitter<AllReceiptsState> emit,
  ) async {
    var imageList = state.imageList;
    final int id = imageList?[event.index]['id'];
    await databaseHelper.deleteImage(id);
    imageList = await databaseHelper.getImages();
    emit(
      state.copyWith(
        imageList: imageList,
      ),
    );
  }

  Future<void> _clearDbEvent(
    ClearDbEvent event,
    Emitter<AllReceiptsState> emit,
  ) async {
    await databaseHelper.deleteAll();
    emit(state.copyWith(
      imageList: [],
    ));
  }
}
