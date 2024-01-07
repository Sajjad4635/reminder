import 'package:flutter/material.dart';
import 'package:reminder/core/widgets/text_widget.dart';

Widget header() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0),
    child: Row(
      children: [
        const Icon(
          Icons.keyboard_arrow_left,
          size: 25,
          color: Colors.black,
        ),
        const SizedBox(
          width: 10,
        ),
        TextWidget.bold(
          text: 'Schedule',
          fontSize: 24,
          color: Colors.black,
        ),
      ],
    ),
  );
}
