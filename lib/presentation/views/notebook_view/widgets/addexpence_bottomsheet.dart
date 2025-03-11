import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:my_keeper_vietflash/common/res/dimens.dart';

import '../../../../common/constants/assets.dart';
import '../../../../common/res/colors.dart';

class AddExpenseBottomSheet extends StatefulWidget {
  const AddExpenseBottomSheet({super.key});

  @override
  _AddExpenseBottomSheetState createState() => _AddExpenseBottomSheetState();
}

class _AddExpenseBottomSheetState extends State<AddExpenseBottomSheet> {
  String expression = "";

  void onButtonPressed(String buttonText) {
    setState(() {
      bool isOperator = ["+", "-", "×", "/"].contains(buttonText);
      bool isLastCharOperator = expression.isNotEmpty &&
          ["+", "-", "×", "/"].contains(expression[expression.length - 1]);

      var parts = expression.split(RegExp(r'([+\-×/])'));
      String lastNumber =
          parts.isNotEmpty ? parts.last.replaceAll(',', '') : "";
      bool isCurrentNumberDecimal = lastNumber.contains(".");
      int decimalDigits =
          isCurrentNumberDecimal ? lastNumber.split('.').last.length : 0;

      if (buttonText == "C") {
        if (expression.isNotEmpty) {
          expression = expression.substring(0, expression.length - 1);
        }
      } else if (buttonText == "=") {
        try {
          Parser p = Parser();
          Expression exp =
              p.parse(expression.replaceAll("×", "*").replaceAll(",", ""));
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          expression = eval == eval.toInt()
              ? NumberFormat("#,###").format(eval.toInt())
              : NumberFormat("#,###.##").format(eval);
        } catch (e) {
          expression = "Error";
        }
      } else if (isOperator) {
        if (expression.isNotEmpty && !isLastCharOperator) {
          expression += buttonText;
        }
      } else if (buttonText == ".") {
        if (!isCurrentNumberDecimal) {
          expression += buttonText;
        }
      } else {
        if ((!isCurrentNumberDecimal && lastNumber.length < 8) ||
            (isCurrentNumberDecimal && decimalDigits < 2)) {
          expression += buttonText;
        }
      }

      expression = formatExpression(expression);
    });
  }

  String formatExpression(String exp) {
    List<String> parts = exp.split(RegExp(r'([+\-×/])'));
    for (int i = 0; i < parts.length; i++) {
      if (!RegExp(r'[+\-×/]').hasMatch(parts[i]) && parts[i].isNotEmpty) {
        if (!parts[i].contains(".")) {
          parts[i] = NumberFormat("#,###")
              .format(int.parse(parts[i].replaceAll(",", "")));
        }
      }
    }
    return rebuildExpression(exp, parts);
  }

  String rebuildExpression(String originalExp, List<String> formattedParts) {
    List<String> operators = RegExp(r'[+\-×/]')
        .allMatches(originalExp)
        .map((m) => m.group(0)!)
        .toList();

    String result = "";
    for (int i = 0; i < formattedParts.length; i++) {
      result += formattedParts[i];
      if (i < operators.length) {
        result += operators[i];
      }
    }
    return result;
  }

  Widget buildButtonText(String text, {Color color = ColorsRes.white}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(DimensRes.sp3),
        child: GestureDetector(
          onTap: () => onButtonPressed(text),
          child: Container(
            height: DimensRes.sp34,
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
                color: color,
                borderRadius:
                    const BorderRadius.all(Radius.circular(DimensRes.sp24))),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: DimensRes.sp18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButtonIcon(String text, String icon,
      {Color color = ColorsRes.white}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(DimensRes.sp3),
        child: GestureDetector(
          onTap: () => onButtonPressed(text),
          child: Container(
            height: DimensRes.sp34,
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              color: color,
              borderRadius:
                  const BorderRadius.all(Radius.circular(DimensRes.sp24)),
            ),
            child: Center(
              child: Image.asset(
                icon,
                height: DimensRes.sp20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.95,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(DimensRes.sp12),
            decoration: BoxDecoration(
              color: ColorsRes.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(DimensRes.sp16),
                topRight: Radius.circular(DimensRes.sp16),
              ),
              border: Border.all(
                color: ColorsRes.black,
                width: 2,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(DimensRes.sp6),
                      margin: const EdgeInsets.only(bottom: DimensRes.sp6),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          color: ColorsRes.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            expression,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            '(VNĐ)',
                            style: TextStyle(
                                color: ColorsRes.darkGray,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  Row(children: [
                    buildButtonText("8386", color: Colors.white60),
                    buildButtonText("8386", color: Colors.white60),
                    buildButtonText("8386", color: Colors.white60),
                    buildButtonIcon("C", Assets.clearIcon,
                        color: Colors.white60),
                  ]),
                  Row(children: [
                    buildButtonText("7"),
                    buildButtonText("8"),
                    buildButtonText("9"),
                    buildButtonText("/", color: Colors.white60)
                  ]),
                  Row(children: [
                    buildButtonText("4"),
                    buildButtonText("5"),
                    buildButtonText("6"),
                    buildButtonText("×", color: Colors.white60)
                  ]),
                  Row(children: [
                    buildButtonText("1"),
                    buildButtonText("2"),
                    buildButtonText("3"),
                    buildButtonText("-", color: Colors.white60)
                  ]),
                  Row(children: [
                    buildButtonText("."),
                    buildButtonText("0"),
                    buildButtonText("="),
                    buildButtonText("+", color: Colors.white60)
                  ]),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
