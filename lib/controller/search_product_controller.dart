import 'package:get/get.dart';
import 'package:shopease/services/search_product_service.dart';

import '../models/search_product_model.dart';
// import '../services/search_product_service.dart';

class SearchProductController extends GetxController {
  final SearchProductService service;

  SearchProductController(this.service);

  final products = <SearchProductModel>[].obs;

  final isLoading = false.obs;
  final isLoadingMore = false.obs;

  final error = RxnString();

  int currentPage = 1;
  int lastPage = 1;

  Future<void> searchProducts({
    required Map<String, dynamic> queryParameters,
    bool reset = true,
  }) async {
    if (reset) {
      currentPage = 1;
      products.clear();
    }

    try {
      isLoading.value = true;
      error.value = null;

      final response = await service.searchProducts(
        queryParameters: queryParameters,
      );

      final pagination = response.data['data'] as Map<String, dynamic>;

      final items = pagination['data'] as List<dynamic>;

      products.assignAll(
        items
            .whereType<Map<String, dynamic>>()
            .map(SearchProductModel.fromJson)
            .toList(),
      );

      currentPage = pagination['current_page'] ?? 1;
      lastPage = pagination['last_page'] ?? 1;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadMore({required Map<String, dynamic> queryParameters}) async {
    if (currentPage >= lastPage) return;

    try {
      isLoadingMore.value = true;

      currentPage++;

      queryParameters['page'] = currentPage;

      final response = await service.searchProducts(
        queryParameters: queryParameters,
      );

      final pagination = response.data['data'] as Map<String, dynamic>;

      final items = pagination['data'] as List<dynamic>;

      products.addAll(
        items
            .whereType<Map<String, dynamic>>()
            .map(SearchProductModel.fromJson)
            .toList(),
      );
    } finally {
      isLoadingMore.value = false;
    }
  }
}
