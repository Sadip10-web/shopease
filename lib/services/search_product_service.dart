import 'package:dio/dio.dart';

class SearchProductService {
  final Dio dio = Dio();

  Future<Response> searchProducts({
    required Map<String, dynamic> queryParameters,
  }) async {
    return await dio.get('/products', queryParameters: queryParameters);
  }
}
