import 'package:file_picker/file_picker.dart';

mixin FileMixin {
  Future<List<String>> pickFile() async {
    final List<String> paths = [];

    final FilePickerResult? result = await FilePicker.platform
        .pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg'],
      withData: true,
      withReadStream: true,
      lockParentWindow: true,
      onFileLoading: print,
      allowMultiple: true,
    )
        .then((value) async {
      for (final e in value?.files ?? []) {
        paths.add(e.path ?? '');
      }
    });
    return paths;
  }
}
