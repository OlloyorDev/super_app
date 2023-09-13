import 'package:get_it/get_it.dart';
import 'package:super_app/data/source/database_helper.dart';
import 'package:super_app/src/all_receipts/presentation/bloc/all_receipts_bloc.dart';
import 'package:super_app/src/camera/presentation/bloc/camera_bloc.dart';
import 'package:super_app/src/home/presentation/bloc/home_bloc.dart';
import 'package:super_app/src/receipts/presentation/bloc/receipts_bloc.dart';
import 'package:super_app/src/upload_receipts/presentation/bloc/uploadreceipts_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    ..registerSingleton<DatabaseHelper>(DatabaseHelper.instance)
    ..registerFactory<HomeBloc>(() => HomeBloc(sl()))
    ..registerFactory<ReceiptsBloc>(() => ReceiptsBloc(sl()))
    ..registerFactory(CameraBloc.new)
    ..registerFactory(() => AllReceiptsBloc(sl()))
    ..registerFactory(() => UploadReceiptsBloc(sl()));
}
