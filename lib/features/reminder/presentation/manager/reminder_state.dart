part of 'reminder_bloc.dart';

abstract class ReminderState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends ReminderState {}

//***************************Get Reminder Data************************

class GetReminderLoadingState extends ReminderState {}

class GetReminderSuccessState extends ReminderState {
  final GetReminderResponse reminderData;

  GetReminderSuccessState({required this.reminderData});

  @override
  List<Object> get props => [reminderData];
}

class GetReminderErrorState extends ReminderState {
  final String message;

  GetReminderErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
//************************************************************
