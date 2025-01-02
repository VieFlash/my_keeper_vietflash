import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../presentation/widgets/common_text_styles.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({
    Key? key,
    this.message,
  }) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            message ?? "S.current.page_not_found",
            style: CommonTextStyles.medium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
