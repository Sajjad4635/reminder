import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reminder/core/utils/time_convertor.dart';
import 'package:reminder/core/widgets/text_widget.dart';

Widget dateShow(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget.bold(text: DateTimeConvertor.dateTimeToWeekDay(DateTime.now()), fontSize: 20, color: Colors.black,),
        TextWidget.medium(text: DateTimeConvertor.dateTimeToDate(DateTime.now()), fontSize: 16, color: Colors.black,)
      ],
    ),
  );
}