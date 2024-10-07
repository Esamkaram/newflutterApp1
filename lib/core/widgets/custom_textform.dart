import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/style/colors.dart';

class CustomTextform extends StatelessWidget {
  const CustomTextform(
      {super.key,
      this.controller,
      this.type,
      this.onSubmit,
      this.onChinged,
      this.onTap,
      this.lable,
      this.preFix,
      this.suffix,
      this.suffixprssed,
      this.validate,
      this.hittext,
      this.labolStyle,
      this.hitstyle,
      this.borderRadius,
      this.borderColor,
      this.borderWidth,
      this.textFormColor});

  final TextEditingController? controller;
  final TextInputType? type;
  final bool isPassword = false;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChinged;
  final VoidCallback? onTap;
  final bool isClickable = true;
  final String? lable;
  final String? hittext;
  final IconData? preFix;
  final IconData? suffix;
  final VoidCallback? suffixprssed;
  final String? Function(String?)? validate;
  final TextStyle? labolStyle;
  final TextStyle? hitstyle;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final Color? textFormColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textDirection: TextDirection.rtl,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChinged,
      onTap: onTap,
      enabled: isClickable,
      decoration: InputDecoration(
        filled: true,
        fillColor: textFormColor ?? AppColos.textFormFiledColor,
        labelText: lable,
        hintText: hittext,
        hintStyle: hitstyle ??
            const TextStyle(
              fontSize: 12.0,
              color: Colors.black,
            ),
        labelStyle: labolStyle ??
            const TextStyle(
              fontSize: 16.0,
            ),
        prefixIcon: Icon(
          preFix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixprssed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
          borderSide: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
          borderSide: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 1.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
          borderSide: BorderSide(
            color: Colors.red, // Error border color
            width: borderWidth ?? 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
          borderSide: BorderSide(
            color: Colors.red, // Error border color
            width: borderWidth ?? 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
          borderSide: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 1.0,
          ),
        ),
      ),
      validator: validate,
    );
  }
}
