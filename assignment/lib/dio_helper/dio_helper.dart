import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://apt.exdezign.com/api/",
      receiveDataWhenStatusError: true,
      //this will not throw error "DioError DioErrorType.response: Http status error 422"
      validateStatus: (status) => true,
// headers: {

// }
    ));
  }

  static Future<Response> getData({
    required String path,
    Map<String, dynamic>? query,
    String lang = "en",
    String? token,
  }) async {
    dio.options.headers = {
      "lang": lang,
      "Authorization": token,
      "Content-Type": "application/json"
    };
    return await dio.get(path, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      String lang = "en",
      String? token,
      required Map<String, dynamic> data}) async {
    dio.options.headers = {
      "lang": lang,
      "Authorization": token,
      "Content-Type": "application/json"
    };
    return dio.post(url, queryParameters: query, data: data);
  }
}
