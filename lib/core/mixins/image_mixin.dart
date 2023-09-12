import 'package:image_picker/image_picker.dart';

mixin ImageMixin {
  Future<List<String>> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final List<String> imagePath = [];
    final XFile? image = await picker.pickMultiImage().then((value) {
      for (final e in value) {
        imagePath.add(e.path);
      }
    });
    return imagePath;
  }
}
