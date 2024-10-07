import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/style/colors.dart';

class CustomDropdowntextstell<T> extends StatelessWidget {
  const CustomDropdowntextstell({
    super.key,
    required this.items,
    required this.label,
    required this.hittext,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.textFormColor,
    required this.onChanged,
    this.value,
    required this.itemToString,
  });

  final List<T> items; // Generic type for items
  final String label;
  final String hittext;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final Color? textFormColor;
  final ValueChanged<T?> onChanged; // Generic type for onChanged
  final T? value; // Holds the selected value
  final String Function(T item)
      itemToString; // Function to convert item to string

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DropdownButtonFormField<T>(
          value: value, // Bind the selected value
          decoration: InputDecoration(
            filled: true,
            fillColor: textFormColor ?? AppColos.textFormFiledColor,
            labelText: label,
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
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
              borderSide: BorderSide(
                color: borderColor ?? Colors.transparent,
                width: borderWidth ?? 1.0,
              ),
            ),
            // Other borders omitted for brevity...
          ),
          hint: Text(hittext),
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          onChanged: onChanged, // Use the passed callback
          items: items.map<DropdownMenuItem<T>>((item) {
            return DropdownMenuItem<T>(
              value: item, // Use the item directly as value
              child: Text(
                  itemToString(item)), // Convert item to string for display
            );
          }).toList(),
        ),
      ],
    );
  }
}
