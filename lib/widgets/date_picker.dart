import 'package:dev_frame/generated/l10n.dart';
import 'package:dev_frame/utils/constants.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final TextEditingController controller;
  final bool isRequired;

  const DatePicker({@required this.controller, @required this.isRequired});

  @override
  DatePickerState createState() => DatePickerState();
}

class DatePickerState extends State<DatePicker> {
  DateTime _date = new DateTime.now();

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2016),
      lastDate: DateTime.now().add(Duration(days: 365))
    );
    
    if (picked != null) {
      setState(() {
        _date = picked;
        widget.controller.text = getDateFormat(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectDate();
      },
      child: IgnorePointer(
        child: new TextFormField(
          controller: widget.controller,
          decoration: new InputDecoration(
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.calendar_today),
          ),
          validator: (v) {
            if (widget.isRequired == true) {
              if (v.isEmpty) {
                return DevFrameLocalization.of(context).requiredValidation;
              } 
              else {
                return null;
              }
            }          
            return null;          
          },
          onSaved: (String val) {},
        ),
      ),
    );
  }
}
