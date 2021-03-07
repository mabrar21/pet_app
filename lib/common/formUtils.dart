import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormUils {
  Future<Null> selectDate(BuildContext context,value, onChange) async {
    DateTime? _selectedDate = (await showDatePicker(
      context: context,
      initialDate: value,
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    ));
    onChange(_selectedDate);
  }

  Future<Null> selectTime(BuildContext context, value, onChange) async {
    TimeOfDay? _selectedTime = (await showTimePicker(
      context: context,
      initialTime: value,
    ));
    onChange(_selectedTime);
  }
}
