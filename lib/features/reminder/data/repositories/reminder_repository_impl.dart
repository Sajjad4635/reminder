import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:reminder/core/error/failures.dart';
import 'package:reminder/core/network/network_info.dart';
import 'package:reminder/features/reminder/data/data_sources/reminder_api.dart';
import 'package:reminder/features/reminder/data/models/reminder_response_model.dart';
import 'package:reminder/features/reminder/domain/repositories/reminder_repository.dart';

import '../../../../core/error/exceptions.dart';

class ReminderRepositoryImpl implements ReminderRepository {
  final ReminderApi reminderApi;

  ReminderRepositoryImpl({required this.reminderApi});

  @override
  Future<Either<Failure, GetReminderResponseModel>> getReminder() async {
      try {
        var response = await reminderApi.getReminder();
        if (response.code == 0) {
          return Right(response);
        } else {
          return Left(ApiFailure(message: response.errorMessage));
        }
      } on ServerException catch (e) {
        debugPrint(e.toString());
        return const Left(ServerFailure(message: 'SERVER_ERROR'));
      }
    
  }
}
