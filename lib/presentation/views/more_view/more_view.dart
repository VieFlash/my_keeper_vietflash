import 'package:flutter/material.dart';

import '../../../common/res/colors.dart';
import '../../../data/database/app_database.dart';
import '../../../domain/model/book_model.dart';

class MoreView extends StatefulWidget {
  const MoreView({super.key});

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  Future<void> loadData() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final bookDao = database.bookDao;
   /* final book = Book(1, 'Frank');

    await bookDao.addBook(book);*/
    //final result = await bookDao.getAllBook();

    //print('result: ${result.first.id} -- ${result.first.name}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.white,
      body: SafeArea(
        child: Center(
          child: Container(
            child: Text('More View', style: TextStyle(color: Colors.black, fontSize: 20),),
          ),
        ),
      ),
    );
  }
}
