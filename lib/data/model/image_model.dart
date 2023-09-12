import 'package:hive/hive.dart';

part 'image_model.g.dart';

@HiveType(typeId: 0)
class ImageModel {
  ImageModel({
    required this.path,
    required this.name,
  });

  @HiveField(0)
  String path;

  @HiveField(1)
  String name;
}
