import 'package:reminder/core/error/exceptions.dart';
import 'package:reminder/core/network/remote_service.dart';
import 'package:reminder/features/reminder/data/models/reminder_response_model.dart';

abstract class ReminderApi {
  Future<GetReminderResponseModel> getReminder();
}

class ReminderApiImpl implements ReminderApi {
  RemoteService remoteService;

  ReminderApiImpl(this.remoteService);

  @override
  Future<GetReminderResponseModel> getReminder() async {
    try {
      print('alsd;jfk');
      var response = await remoteService.getReminder();
      print('111111111');
      if (response.code == 0) {
        return response;
      } else {
        throw ServerException(statusCode: 500, error: 'ServerException');
      }
    } catch (e) {
      throw ServerException(statusCode: 501, error: e.toString());
    }
  }
}
