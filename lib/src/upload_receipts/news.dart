import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:super_app/data/source/database_helper.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final List<Map<String, dynamic>> _imageList = [];
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  Future<void> loadImages() async {
    final List<Map<String, dynamic>> images =
        await DatabaseHelper.instance.getImages();

    _imageList
      ..clear()
      ..addAll(images);
  }

  Future<void> _addImage(String path) async {
    final int id = await DatabaseHelper.instance.insertImage(path);
    setState(() {
      _imageList.add({'id': id, 'path': path});
    });
  }

  Future<void> _deleteImage(int index) async {
    final int id = _imageList[index]['id'];
    await DatabaseHelper.instance.deleteImage(id);
    setState(() {
      _imageList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Image List'),
          actions: [
            IconButton(
              onPressed: () {
                DatabaseHelper.instance.deleteAll();
                _imageList.clear();
                setState(() {});
              },
              icon: const Icon(
                Icons.delete_outline_outlined,
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: _imageList.length,
          itemBuilder: (context, index) {
            final imageItem = _imageList[index];
            return ListTile(
              leading: Image.asset(imageItem['path']),
              title: Text(
                '${imageItem['path'].split('/').last}',
                maxLines: 1,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  _deleteImage(index);
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            final XFile? imageFile =
                await _imagePicker.pickMultiImage().then((value) {
              for (final e in value) {
                _addImage(e.path);
              }
            });
          },
        ),
      );
}
