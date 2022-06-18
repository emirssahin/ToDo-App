import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final String dbName = "tododb2.sqlite";

  static Future<Database> connectDb() async {
    String dbPath = join(await getDatabasesPath(), dbName);

    if (await databaseExists(dbPath)) {
      print("Db is already exists");
    } else {
      ByteData data = await rootBundle.load("veritabani/$dbName");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(dbPath).writeAsBytes(bytes, flush: true);
      print("Db has copied");
    }

    return openDatabase(dbPath);
  }
}
