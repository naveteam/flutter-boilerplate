import 'package:dio/dio.dart';

abstract class DioModule {
  static BaseOptions get jsonPlaceholderClientOptions {
    return BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      contentType: "application/json",
      responseType: ResponseType.json,
    );
  }

  static Dio get jsonPlaceholderClient {
    return Dio(jsonPlaceholderClientOptions);
  }
}
