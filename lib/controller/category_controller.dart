import 'package:get/get.dart';
import 'package:shopease/service/category_service.dart';

import '../models/category_model.dart';
// import '../services/category_service.dart';

class CategoryController extends GetxController {
  final CategoryService service;

  CategoryController(this.service);

  final categories = <CategoryModel>[].obs;

  final isLoading = false.obs;

  final error = RxnString();

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  Future<void> loadCategories() async {
    try {
      isLoading.value = true;
      error.value = null;

      final response = await service.getCategories();

      final List<dynamic> data = response.data['data'];

      categories.assignAll(data.map((e) => CategoryModel.fromJson(e)).toList());
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
