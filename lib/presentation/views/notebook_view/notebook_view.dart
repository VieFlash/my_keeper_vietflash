import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_keeper_vietflash/common/base/base_mixin.dart';

import '../../../common/res/colors.dart';

class NotebookView extends StatefulWidget {
  const NotebookView({super.key});

  @override
  State<NotebookView> createState() => _NotebookViewState();
}

class _NotebookViewState extends State<NotebookView>
    with BaseMixin, SingleTickerProviderStateMixin {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("open notebook view");
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsRes.white,
      body: SafeArea(
        child: Center(
          child: Text(
            'NoteBook View',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
