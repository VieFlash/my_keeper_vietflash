import 'package:floor/floor.dart';
import 'package:my_keeper_vietflash/domain/model/book_model.dart';

@dao
abstract class BookDAO {
  @Query('SELECT * FROM Book')
  Future<List<BookModel>> getAllBook();

  @insert
  Future<void> addBook(BookModel book);
}