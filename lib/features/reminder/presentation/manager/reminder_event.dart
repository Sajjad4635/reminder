part of 'reminder_bloc.dart';

@immutable
abstract class ReminderEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetReminderEvent extends ReminderEvent {}
