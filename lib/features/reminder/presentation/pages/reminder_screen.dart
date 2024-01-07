import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder/core/utils/time_convertor.dart';
import 'package:reminder/core/widgets/loading_widget.dart';
import 'package:reminder/core/widgets/text_widget.dart';
import 'package:reminder/features/reminder/domain/entities/reminder_response.dart';
import 'package:reminder/features/reminder/presentation/manager/reminder_bloc.dart';
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
              Padding(
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
                    TextWidget.bold(text: 'Schedule', fontSize: 24, color: Colors.black,),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Divider(
                height: 4,
                color: Colors.grey.withOpacity(0.5),
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: BlocBuilder<ReminderBloc, ReminderState>(
                  builder: (context, state){
                    if(state is GetReminderLoadingState){
                      return const Center(
                        child: LoadingWidget(),
                      );
                    }else if(state is GetReminderSuccessState){
                      GetReminderResponse data =  state.reminderData;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: ListView.builder(
                          itemCount: data.data.length,
                          itemBuilder: (context, index){
                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xff+int.parse(data.data[index].color, radix: 16) + 0xFF000000).withOpacity(0.9),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget.bold(text: DateTimeConvertor.dateTimeToHour(data.data[index].time), color: Colors.white, textDirection: TextDirection.ltr,),
                                    const SizedBox(height: 8,),
                                    TextWidget.regular(text: data.data[index].text, color: Colors.white, fontSize: 16,),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }else if(state is GetReminderErrorState){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget.bold(text: state.message, color: Colors.black,),
                          const SizedBox(height: 20,),
                          GestureDetector(
                            onTap:(){
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
                                child: TextWidget.bold(text: 'تلاش مجدد', color: Colors.white,),
                              ),
                            ),
                          )
                        ],
                      );
                    }else{
                      return const SizedBox();
                    }
                  },
                )
              )
            ],
          ),
        ),
      )),
    );
  }
}
