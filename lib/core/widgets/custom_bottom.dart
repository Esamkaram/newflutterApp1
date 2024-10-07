import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/style/colors.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom(
      {super.key,
      this.width,
      this.onpressed,
      required this.text,
      this.color,
      this.borderRadius,
      this.bottomTextColor,
      this.bottomFontTextSize,
      this.textstyle});
  final double? width;
  final VoidCallback? onpressed;
  final String text;
  final Color? color;
  final double? borderRadius;
  final Color? bottomTextColor;
  final double? bottomFontTextSize;
  final TextStyle? textstyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          borderRadius ?? 21.0,
        ),
        color: color ?? AppColos.primeColor,
      ),
      child: MaterialButton(
        onPressed: onpressed,
        child: Text(
          text,
          style: textstyle ??
              TextStyle(
                fontSize: bottomFontTextSize ?? 16.0,
                color: bottomTextColor ?? Colors.white,
              ),
        ),
      ),
    );
  }
}
