import 'package:flutter/material.dart';
import '../../common/res/colors.dart';
import '../../common/res/dimens.dart';
import 'common_gaps.dart';
import 'common_text_styles.dart';

Future<dynamic> showIOSDialog({
  required BuildContext context,
  String? title,
  required String firstButtonText,
  required Function() firstButtonCallback,
  bool dismissible = true,
  String? content,
  String? secondButtonText,
  Function()? secondButtonCallback,
  TextStyle? contentTextStyle,
  TextStyle? firstButtonTextStyle,
  TextStyle? secondButtonTextStyle,
  double? titleSize,
  TextAlign? alignContent,
  Widget? contentWidget,
  double? paddingContent,
}) {
  return showDialog(
    barrierDismissible: dismissible,
    context: context, builder: (BuildContext context) {
      return IOSDialog(
        firstButtonCallback: firstButtonCallback,
        firstButtonText: firstButtonText,
        title: title,
        content: content,
        contentTextStyle: contentTextStyle,
        firstButtonTextStyle: firstButtonTextStyle,
        secondButtonCallback: secondButtonCallback,
        secondButtonText: secondButtonText,
        secondButtonTextStyle: secondButtonTextStyle,
        titleSize: titleSize,
        alignContent: alignContent,
        contentWidget: contentWidget,
        paddingContent: paddingContent,
      );
  },
  );
}

class IOSDialog extends StatelessWidget {
  const IOSDialog({
    super.key,
    this.title,
    required this.firstButtonText,
    required this.firstButtonCallback,
    this.secondButtonText,
    this.secondButtonCallback,
    this.content,
    this.contentTextStyle,
    this.firstButtonTextStyle,
    this.secondButtonTextStyle,
    this.titleSize,
    this.alignContent,
    this.contentWidget,
    this.paddingContent,
  });

  final String firstButtonText;
  final String? secondButtonText;
  final String? title;
  final Function() firstButtonCallback;
  final Function()? secondButtonCallback;
  final String? content;
  final TextStyle? contentTextStyle;
  final TextStyle? firstButtonTextStyle;
  final TextStyle? secondButtonTextStyle;
  final double? titleSize;
  final TextAlign? alignContent;
  final Widget? contentWidget;
  final double? paddingContent;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: DimensRes.sp48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DimensRes.sp16),
      ),
      elevation: DimensRes.sp0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: DimensRes.sp100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensRes.sp16),
          color: ColorsRes.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  if (title != null) Gaps.vGap16,
                  if (title != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: DimensRes.sp16),
                      child: Text(
                        title ?? '',
                        style: CommonTextStyles.bold.copyWith(
                          fontSize: titleSize ?? DimensRes.sp16,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  if (content != null) Gaps.vGap10,
                  if (content != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: DimensRes.sp11_5),
                      child: Text(
                        content!,
                        style: contentTextStyle ??
                            CommonTextStyles.small.copyWith(
                              fontWeight: FontWeight.w500,
                              height: 1.45,
                            ),
                        textAlign: alignContent ?? TextAlign.center,
                      ),
                    ),
                  if (contentWidget != null) Gaps.vGap10,
                  if (contentWidget != null)
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: paddingContent ?? DimensRes.sp11_5),
                      child: contentWidget,
                    ),
                  Gaps.vGap10,
                ],
              ),
            ),
            Gaps.vLineGray200,
            if (secondButtonCallback == null && secondButtonCallback == null)
              _buildOneButton(firstButtonText, firstButtonCallback),
            if (secondButtonCallback != null && secondButtonCallback != null)
              _buildTwoButton(
                  firstButtonText,
                  secondButtonText!,
                  firstButtonCallback,
                  secondButtonCallback!,
                  firstButtonTextStyle,
                  secondButtonTextStyle),
          ],
        ),
      ),
    );
  }
}

Widget _buildOneButton(String buttonText, Function() buttonCallback) {
  return Container(
    height: DimensRes.sp47,
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      color: ColorsRes.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(DimensRes.sp16),
        bottomRight: Radius.circular(DimensRes.sp16),
      ),
    ),
    child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 47),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(DimensRes.sp16),
            bottomRight: Radius.circular(DimensRes.sp16),
          ),
        ),
      ),
      onPressed: buttonCallback,
      child: Text(
        buttonText,
        style: CommonTextStyles.normal.copyWith(fontSize: DimensRes.sp18),
      ),
    ),
  );
}

Widget _buildTwoButton(
    String firstButtonText,
    String secondButtonText,
    Function() firstButtonCallback,
    Function() secondButtonCallback,
    TextStyle? firstButtonTextStyle,
    TextStyle? secondButtonTextStyle) {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: ColorsRes.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(DimensRes.sp16),
            ),
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 47),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(DimensRes.sp16),
                ),
              ),
            ),
            onPressed: firstButtonCallback,
            child: Text(
              firstButtonText,
              style: firstButtonTextStyle ??
                  CommonTextStyles.normal.copyWith(fontSize: DimensRes.sp18),
            ),
          ),
        ),
      ),
      Container(
        width: DimensRes.sp1,
        height: DimensRes.sp47,
        color: ColorsRes.gray200,
      ),
      Expanded(
        flex: 1,
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: ColorsRes.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(DimensRes.sp16),
            ),
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 47),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(DimensRes.sp16),
                ),
              ),
            ),
            onPressed: secondButtonCallback,
            child: Text(
              secondButtonText,
              style: secondButtonTextStyle ??
                  CommonTextStyles.normal.copyWith(fontSize: DimensRes.sp18),
            ),
          ),
        ),
      ),
    ],
  );
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.widget,
    this.insetPadding,
    this.backgroundColor,
    this.borderRadius,
  });

  final Widget widget;
  final EdgeInsets? insetPadding;
  final Color? backgroundColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: insetPadding ?? const EdgeInsets.all(DimensRes.sp16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? DimensRes.sp16),
      ),
      backgroundColor: backgroundColor ?? ColorsRes.white,
      child: widget,
    );
  }
}
