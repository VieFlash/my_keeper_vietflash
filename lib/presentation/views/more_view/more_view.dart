import 'package:flutter/material.dart';

import '../../../common/res/colors.dart';

class MoreView extends StatefulWidget {
  const MoreView({super.key});

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
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
