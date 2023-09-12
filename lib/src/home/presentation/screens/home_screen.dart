import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:super_app/core/utils/app_utils.dart';
import 'package:super_app/route/route_name.dart';
import 'package:super_app/src/home/presentation/bloc/home_bloc.dart';
import 'package:super_app/src/upload_receipts/news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Database database;

  Future<Database> _openDatabase() async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String dbPath = join(appDocDir.path, 'image_database.db');
    return openDatabase(dbPath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE IF NOT EXISTS images (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        path TEXT
      )
      ''');
    });
  }

  @override
  void initState() {
    initDatabase();
    super.initState();
  }

  Future<void> initDatabase() async {
    database = await _openDatabase();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const News()));
            },
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Super App'),
          ),
          body: Padding(
            padding: AppUtils.kPaddingHorizontal16,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AppUtils.kGap6,
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.uploadReceipt);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_present_sharp,
                          size: 25,
                          weight: 1,
                        ),
                        AppUtils.kGap12,
                        Text(
                          'All Receipt',
                        ),
                      ],
                    ),
                  ),
                  AppUtils.kGap12,
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.receipt);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.photo_camera_outlined,
                          size: 25,
                          weight: 1,
                        ),
                        AppUtils.kGap12,
                        Text(
                          'Start Receipt',
                        ),
                      ],
                    ),
                  ),
                  AppUtils.kGap100,
                ],
              ),
            ),
          ),
        ),
      );
}
