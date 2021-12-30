import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  final TextEditingController controller;

  const DropDownButton({@required this.controller});

  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String dropdownValue = 'Connected';
  @override
  Widget build(BuildContext context) {
    if (widget.controller.text == '' || widget.controller.text == null) {
      widget.controller.text = dropdownValue;
    } else {
      dropdownValue = widget.controller.text;
    }

    return DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue,
      icon: const Icon(Icons.arrow_forward_ios),
      iconSize: 22,
      elevation: 12,
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (newValue) {
        setState(() {
          dropdownValue = newValue;
          widget.controller.text = dropdownValue;
        });
      },
      items: <String>['Connected', 'Disconnected', 'On Hold']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
