// database.dart

// required package imports
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import '../../domain/model/book_model.dart';
import '../room_database_local/book_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [BookModel])
abstract class AppDatabase extends FloorDatabase {
  BookDAO get bookDao;
}