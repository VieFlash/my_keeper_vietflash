import 'package:floor/floor.dart';

@entity
class BookModel {
  @primaryKey
  final int id;

  final String name;

  BookModel(this.id, this.name);
}