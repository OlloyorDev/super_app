import 'package:hive/hive.dart';

class LocalSource {
  const LocalSource(this.box);

  final Box<dynamic> box;

  static const String _boxName = 'images';

  Box<dynamic> get _imageBox => Hive.box<dynamic>(_boxName);

  Future<List<dynamic>> getImages() async => _imageBox.values.toList();

  Future<void> insertImage(String image) async {
    await _imageBox.add(image);
  }

  Future<void> deleteImage(int index) async {
    await _imageBox.deleteAt(index);
  }
}
