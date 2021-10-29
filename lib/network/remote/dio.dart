import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      headers: {
          'Content-Type':'application/json'
      }//if happened error get data
        ));
  }

  static Future<Response> getData(
      {required String url}) async {
    return await dio.get(url);
  }

  static Future<Response> postData(
      {required String url, required Map<String, dynamic> data}) async {
    return dio.post(url, data: data);
  }
}
