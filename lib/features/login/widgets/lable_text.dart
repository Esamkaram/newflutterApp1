import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/style/custom_text.dart';

class LableText extends StatelessWidget {
  const LableText(
      {super.key, required this.textFormFiled, required this.hederTextLable});
  final Widget textFormFiled;
  final String hederTextLable;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hederTextLable,
          style: Styles.titlestyle,
        ),
        const SizedBox(
          height: 5.0,
        ),
        textFormFiled,
        const SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}
