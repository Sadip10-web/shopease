import 'package:dio/dio.dart';

class CategoryService {
  final Dio dio;

  CategoryService(this.dio);

  Future<Response> getCategories() async {
    return await dio.get('/categories');
  }
}
