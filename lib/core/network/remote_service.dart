import 'package:dio/dio.dart';
import 'package:reminder/core/constants/url_consts.dart';
import 'package:reminder/features/reminder/data/models/reminder_response_model.dart';
import 'package:retrofit/http.dart';

part 'remote_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class RemoteService {
  factory RemoteService(Dio dio, {String baseUrl}) = _RemoteService;

  @GET(GET_REMINDER)
  Future<GetReminderResponseModel> getReminder();
}
