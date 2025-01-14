import 'package:flutter/material.dart';

import '../../common/res/colors.dart';
import '../../common/res/dimens.dart';
import '../../utils/mixin/safe_click.dart';
import 'common_text_styles.dart';

class CommonButton extends StatelessWidget with SafeClick {
  CommonButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.formKey,
    this.backgroundColor,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(
      vertical: DimensRes.sp16,
      horizontal: DimensRes.sp50,
    ),
    this.borderRadius = DimensRes.sp24,
    this.borderSide = BorderSide.none,
    this.isDisable = false,
    this.leadingIcon,
    this.maxLines = 2,
    this.gap,
  });

  final GlobalKey<FormState>? formKey;
  final Function()? onPressed;
  final String title;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final BorderSide borderSide;
  final bool isDisable;
  final Widget? leadingIcon;
  final int maxLines;
  final double? gap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisable
          ? null
          : () {
        if (formKey != null) {
          final currentState = formKey!.currentState;
          if (currentState == null || !currentState.validate()) {
            return;
          }
        }
        onSafeClickListener(callback: () {
          onPressed!();
        });
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith((states) => 0),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return ColorsRes.textDisable.withOpacity(0.2);
            }
            return ColorsRes.primary;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
              (states) => isDisable
              ? ColorsRes.buttonDisable
              : backgroundColor ?? ColorsRes.primary,
        ),
        minimumSize: MaterialStateProperty.resolveWith((states) => Size.zero),
        padding: MaterialStateProperty.resolveWith((states) => padding),
        shape: MaterialStateProperty.resolveWith(
              (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: borderSide,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) leadingIcon!,
          if (leadingIcon != null) SizedBox(width: gap ?? DimensRes.sp4),
          Flexible(
            child: Text(
              title,
              style: textStyle ??
                  CommonTextStyles.bold.copyWith(color: ColorsRes.white),
              softWrap: false,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
