import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:super_app/data/model/image_model.dart';
import 'package:super_app/data/source/database_helper.dart';
import 'package:super_app/data/source/local_source.dart';

final sl = GetIt.instance;
late Box<dynamic> _box;

Future<void> init() async {
  await initHive();
  sl
    ..registerSingleton<LocalSource>(LocalSource(_box))
    ..registerSingleton<DatabaseHelper>(DatabaseHelper.instance);
}

Future<void> initHive() async {
  const boxName = 'super_app';
  final Directory directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(ImageModelAdapter());
  _box = await Hive.openBox<dynamic>(boxName);
}
