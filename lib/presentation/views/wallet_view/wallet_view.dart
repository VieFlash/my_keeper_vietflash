import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/res/colors.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.white,
      body: SafeArea(
        child: Center(
          child: Container(
            child: Text('Wallet View', style: TextStyle(color: Colors.black, fontSize: 20),),
          ),
        ),
      ),
    );
  }
}
