import 'package:flutter/material.dart';
import 'package:reminder/core/utils/time_convertor.dart';
import 'package:reminder/core/widgets/text_widget.dart';
import 'package:reminder/features/reminder/domain/entities/reminder_response.dart';

Widget reminderItem({required GetReminderResponse data}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0),
    child: ListView.builder(
      itemCount: data.data.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xff + int.parse(data.data[index].color, radix: 16) + 0xFF000000).withOpacity(0.9),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget.bold(
                  text: DateTimeConvertor.dateTimeToHour(data.data[index].time),
                  color: Colors.white,
                  textDirection: TextDirection.ltr,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextWidget.regular(
                  text: data.data[index].text,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
