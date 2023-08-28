import 'package:flutter/material.dart';

class CarrierDropdown extends StatefulWidget {
  const CarrierDropdown({super.key});

  @override
  _CarrierDropdownState createState() => _CarrierDropdownState();
}

class _CarrierDropdownState extends State<CarrierDropdown> {
  String? selectedCarrier;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedCarrier,
      hint: const Text("통신사 선택"),
      onChanged: (String? newValue) {
        setState(() {
          selectedCarrier = newValue;
        });
      },
      items: <String>['SKT', 'KT', 'U+', '알뜰폰']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      }).toList(),
    );
  }
}
