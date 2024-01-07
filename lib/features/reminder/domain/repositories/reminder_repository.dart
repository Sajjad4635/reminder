import 'package:dartz/dartz.dart';
import 'package:reminder/features/reminder/domain/entities/reminder_response.dart';

import '../../../../core/error/failures.dart';

abstract class ReminderRepository {
  Future<Either<Failure, GetReminderResponse>> getReminder();
}
