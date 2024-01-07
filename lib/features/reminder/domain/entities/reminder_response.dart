
class GetReminderResponse {
  final int code;
  final String errorMessage;
  final List<DatumResponse> data;

  GetReminderResponse({
    required this.code,
    required this.errorMessage,
    required this.data,
  });
}

class DatumResponse {
  final DateTime time;
  final String text;
  final String color;

  DatumResponse({
    required this.time,
    required this.text,
    required this.color,
  });

}
