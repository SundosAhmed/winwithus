import 'package:dio/dio.dart';
import 'package:wiin/screeens/login/loginbloc.dart';

enum REQUEST_TYPE { get, post, delete }

class HttpRequest {
  Future<dynamic> callRequest(
      {required REQUEST_TYPE requestType,
      required String methodName,
      Map<String, dynamic> queryParam = const {},
      Map<String, dynamic>? body,
      String contentType = Headers.jsonContentType}) async {
    Response? response;

    const String baseUrl = "https://whats-your-order.com/api/v1/";

    final dioClient = Dio()
      ..options = BaseOptions(
          baseUrl: baseUrl,
          headers: {
            "Accept": "application/json",
            'authorization': 'Bearer $token'
          },
          followRedirects: false,
          validateStatus: (status) {
            return true;
          });

    switch (requestType) {
      case REQUEST_TYPE.get:
        response = await dioClient.get(methodName,
            queryParameters: queryParam,
            options: Options(
              contentType: contentType,
            ));
        break;
      case REQUEST_TYPE.post:
        response = await dioClient.post(methodName,
            data: body,
            queryParameters: queryParam,
            options: Options(contentType: contentType));
        break;
      case REQUEST_TYPE.delete:
        response = await dioClient.delete(methodName,
            data: body,
            queryParameters: queryParam,
            options: Options(
              contentType: contentType,
            ));
        break;
    }

    return response.data;
  }
}
