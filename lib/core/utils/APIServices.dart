import 'package:dio/dio.dart';

class APIServices
{
  final Dio dio;
  final String baseURL = "https://www.googleapis.com/books/v1/";

  APIServices({required this.dio});


  Future<Map<String,dynamic>> get({required String endPoint})async
  {
    var response = await dio.get('$baseURL$endPoint');

    return response.data ;
  }
}

//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