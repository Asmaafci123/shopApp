import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        ));
  }

  static Future<Response> getData(
      {
        required String url,
        String lang='en',
        String? token
      }) async {
    dio.options.headers={//لانه مش بيعمل override
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization':token
    };
    return await dio.get(url);
  }

  static Future<Response> postData(
      {
        required String url,
        required Map<String, dynamic> data,
        String lang='en',
        String? token
      }) async {
    dio.options.headers={
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization':token
    };
    return await dio.post(url, data: data);
  }
}
