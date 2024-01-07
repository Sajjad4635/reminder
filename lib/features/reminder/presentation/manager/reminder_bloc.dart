import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder/core/error/failures.dart';
import 'package:reminder/core/usecases/usecase.dart';
import 'package:reminder/features/reminder/domain/entities/reminder_response.dart';
import 'package:reminder/features/reminder/domain/use_cases/reminder_usecase.dart';

part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  final GetReminderUseCase getReminderUseCase;

  ReminderBloc({
    required this.getReminderUseCase,
  }) : super(Empty()) {
    on<GetReminderEvent>((event, emit) async {
      emit(GetReminderLoadingState());
      final either = await getReminderUseCase(NoParams());
      either.fold((l) {
        handleFailureGetReminder(l, emit);
      }, (r) {
        emit(
          ///we can use data from 'r'
          GetReminderSuccessState(reminderData: r),
        );
      });
    });
  }

  void handleFailureGetReminder(Failure failure, emit) {
    switch (failure.runtimeType) {
      case ApiFailure:
        emit(
          GetReminderErrorState(
            message: (failure as ApiFailure).message,
          ),
        );
        break;
      case ServerFailure:
        emit(
          GetReminderErrorState(
            message: (failure as ServerFailure).message,
          ),
        );
        break;
      case InternetFailure:
        emit(
          GetReminderErrorState(
            message: (failure as InternetFailure).message,
          ),
        );
        break;
    }
  }
}
