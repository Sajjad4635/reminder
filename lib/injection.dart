import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:reminder/core/constants/url_consts.dart';
import 'package:reminder/core/network/remote_service.dart';
import 'package:reminder/features/reminder/data/data_sources/reminder_api.dart';
import 'package:reminder/features/reminder/data/repositories/reminder_repository_impl.dart';
import 'package:reminder/features/reminder/domain/repositories/reminder_repository.dart';
import 'package:reminder/features/reminder/domain/use_cases/reminder_usecase.dart';
import 'package:reminder/features/reminder/presentation/manager/reminder_bloc.dart';

final serviceLocator = GetIt.instance;

Future init() async {
  ///feature get reminder
  ///bloc
  serviceLocator.registerFactory(
    () => RemoteService(Dio(), baseUrl: BASE_URL),
  );
  serviceLocator.registerFactory(
    () => ReminderBloc(getReminderUseCase: serviceLocator()),
  );

  ///usecases

  serviceLocator.registerLazySingleton(() => GetReminderUseCase(serviceLocator()));

  ///repository

  serviceLocator.registerLazySingleton<ReminderRepository>(() => ReminderRepositoryImpl(reminderApi: serviceLocator()));

  ///data sources
  serviceLocator.registerLazySingleton<ReminderApi>(() => ReminderApiImpl(serviceLocator()));
}
