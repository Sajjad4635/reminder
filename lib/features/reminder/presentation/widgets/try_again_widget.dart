import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder/core/widgets/text_widget.dart';
import 'package:reminder/features/reminder/presentation/manager/reminder_bloc.dart';

Widget tryAgain({required BuildContext context, required String message}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextWidget.bold(
        text: message,
        color: Colors.black,
      ),
      const SizedBox(
        height: 20,
      ),
      GestureDetector(
        onTap: () {
          context.read<ReminderBloc>().add(GetReminderEvent());
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          width: 138,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: TextWidget.bold(
              text: 'تلاش مجدد',
              color: Colors.white,
            ),
          ),
        ),
      )
    ],
  );
}
