import 'package:flutter/material.dart';

class SchoolItem extends StatefulWidget {
  const SchoolItem(
      {super.key, required this.groupValue, required this.titelString});
  final int groupValue;
  final String titelString;
  @override
  State<SchoolItem> createState() => _SchoolItemState();
}

enum SingingCharacter { lafayette, jefferson }

class _SchoolItemState extends State<SchoolItem> {
  SingingCharacter? _character = SingingCharacter.lafayette;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                _character = value;
              });
            }),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          widget.titelString,
        ),
      ],
    );
  }
}
