import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePicker {
  BuildContext context;
  final ValueChanged<DateTime> onDateTimeChanged;

  DatePicker(this.context, {@required this.onDateTimeChanged});

  void show() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            child: Stack(
              children: <Widget>[
                CupertinoDatePicker(
                  minimumYear: 1900,
                  maximumYear: DateTime.now().year,
                  initialDateTime: DateTime.now(),
                  maximumDate: DateTime.now(),
                  onDateTimeChanged: onDateTimeChanged,
                  mode: CupertinoDatePickerMode.date,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: CupertinoButton(
                    child: Text('확인'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          );
      });
  }
}