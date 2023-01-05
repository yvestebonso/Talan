import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



const List<String> list = <String>[ 'Femme', 'Homme'];

class CustomDropDownButton extends StatefulWidget {

  const CustomDropDownButton({super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String dropdownValue = list.first;

  _CustomDropDownButtonState();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.cyan),
      underline: Container(
        height: 2,
        color: Colors.cyan,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),

    );

  }

}
