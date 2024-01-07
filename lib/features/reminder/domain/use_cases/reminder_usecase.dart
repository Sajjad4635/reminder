import 'package:dartz/dartz.dart';
import 'package:reminder/core/error/failures.dart';
import 'package:reminder/core/usecases/usecase.dart';
import 'package:reminder/features/reminder/domain/entities/reminder_response.dart';
import 'package:reminder/features/reminder/domain/repositories/reminder_repository.dart';

class GetReminderUseCase implements UseCase<GetReminderResponse, NoParams> {
  final ReminderRepository repository;

  GetReminderUseCase(this.repository);

  @override
  Future<Either<Failure, GetReminderResponse>> call(NoParams params) async {
    return await repository.getReminder();
  }
}
