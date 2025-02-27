import 'package:flutter/material.dart';

import '../../../common/res/colors.dart';

class AnalyticsView extends StatefulWidget {
  const AnalyticsView({super.key});

  @override
  State<AnalyticsView> createState() => _AnalyticsViewState();
}

class _AnalyticsViewState extends State<AnalyticsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.white,
      body: SafeArea(
        child: Center(
          child: Container(
            child: Text('Analytics View', style: TextStyle(color: Colors.black, fontSize: 20),),
          ),
        ),
      ),
    );
  }
}
