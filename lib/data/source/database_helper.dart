import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String path = await getDatabasesPath();
    final String dbPath = join(path, 'image_database.db');

    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE images (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            path TEXT
          )
        ''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> getImages() async {
    final db = await database;
    return db.query('images');
  }

  Future<int> insertImage(String path) async {
    final db = await database;
    return db.insert(
      'images',
      {'path': path},
    );
  }

  Future<dynamic> deleteAll() async {
    final Database db = await instance.database;
    return db.rawDelete('DELETE FROM images');
  }

  Future<int> updateImage(int id, String newPath) async {
    final db = await database;
    return db.update(
      'images',
      {'path': newPath},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteImage(int id) async {
    final db = await database;
    return db.delete(
      'images',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
