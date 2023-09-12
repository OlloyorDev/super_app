import 'package:file_picker/file_picker.dart';

mixin FileMixin {
  Future<List<String>> pickImage() async {
    final List<String> filePath = [];
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg'],
      withData: true,
      withReadStream: true,
      lockParentWindow: true,
      dialogTitle: 'Fayl tanlang',
      onFileLoading: print,
      allowMultiple: true,
    );

    return filePath;
  }
}
