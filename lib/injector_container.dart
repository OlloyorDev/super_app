import 'package:get_it/get_it.dart';
import 'package:super_app/data/source/database_helper.dart';
import 'package:super_app/src/camera/presentation/bloc/camera_bloc.dart';
import 'package:super_app/src/receipts/presentation/bloc/receipts_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    ..registerSingleton<DatabaseHelper>(DatabaseHelper.instance)
    ..registerFactory<CameraBloc>(CameraBloc.new)
    ..registerFactory<ReceiptsBloc>(() => ReceiptsBloc(sl()));
}
