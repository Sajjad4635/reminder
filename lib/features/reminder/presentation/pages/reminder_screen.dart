import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder/core/widgets/loading_widget.dart';
import 'package:reminder/features/reminder/presentation/manager/reminder_bloc.dart';
import 'package:reminder/features/reminder/presentation/widgets/header_widget.dart';
import 'package:reminder/features/reminder/presentation/widgets/reminder_item_widget.dart';
import 'package:reminder/features/reminder/presentation/widgets/try_again_widget.dart';
import 'package:reminder/injection.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (_) => serviceLocator<ReminderBloc>()..add(GetReminderEvent()),
        child: BlocListener<ReminderBloc, ReminderState>(
          listener: (context, state) {},
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              header(),
              const SizedBox(
                height: 20,
              ),
              Divider(
                height: 4,
                color: Colors.grey.withOpacity(0.5),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(child: BlocBuilder<ReminderBloc, ReminderState>(
                builder: (context, state) {
                  if (state is GetReminderLoadingState) {
                    return const Center(child: LoadingWidget());
                  } else if (state is GetReminderSuccessState) {
                    return reminderItem(data: state.reminderData);
                  } else if (state is GetReminderErrorState) {
                    return tryAgain(context: context, message: state.message);
                  } else {
                    return const SizedBox();
                  }
                },
              ))
            ],
          ),
        ),
      )),
    );
  }
}
