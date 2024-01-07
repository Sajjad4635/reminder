import 'package:dio/dio.dart';
import 'package:reminder/core/constants/network_const.dart';
import 'package:reminder/core/network/remote_service.dart';

class DioProvider {
  late Dio dio;
  late RemoteService remoteService;
  static final DioProvider _instance = DioProvider._internal();

  factory DioProvider() => _instance;

  DioProvider._internal() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(milliseconds:NetworkConst.kConnectTimeout),
        receiveTimeout: const Duration(milliseconds: NetworkConst.kReceiveTimeout),
      ),
    )..interceptors.addAll(
        [
          // LoggingInterceptor(),
          // AuthenticationInterceptor(),
        ],
      );
    remoteService = RemoteService(dio);
  }
}
