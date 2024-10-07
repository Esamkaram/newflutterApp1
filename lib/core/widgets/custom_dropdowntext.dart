import 'package:flutter/material.dart';

class CustomDropdowntext extends StatefulWidget {
  const CustomDropdowntext({super.key});

  @override
  State<CustomDropdowntext> createState() => _CustomDropdowntextState();
}

class _CustomDropdowntextState extends State<CustomDropdowntext> {
  String? dropdownValue;

  // List of items in our dropdown menu
  var items = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Select an Option',
            border: OutlineInputBorder(),
          ),
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
