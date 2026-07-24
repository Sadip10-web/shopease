import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/controller/search_product_controller.dart';
import 'package:shopease/services/search_product_service.dart';
import '../widgets/product_card.dart';

class SearchScreen extends StatefulWidget {
  // Added optional parameters to the constructor
  final int? initialCategoryId;
  final String? initialCategoryName;

  const SearchScreen({
    super.key,
    this.initialCategoryId,
    this.initialCategoryName,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  Timer? debounce;
  late final SearchProductController controller;

  @override
  void initState() {
    super.initState();

    controller = Get.put(SearchProductController(SearchProductService()));

    // If redirected with an initial category, handle it automatically
    if (widget.initialCategoryName != null) {
      searchController.text = widget.initialCategoryName!;
    }

    // Trigger an initial request if starting with a pre-selected category ID
    if (widget.initialCategoryId != null) {
      controller.searchProducts(
        queryParameters: {"category_id": widget.initialCategoryId, "page": 1},
      );
    }
  }

  void search(String value) {
    debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 500), () {
      controller.searchProducts(queryParameters: {"q": value, "page": 1});
    });
  }

  @override
  void dispose() {
    debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Products")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              onChanged: search,
              decoration: const InputDecoration(
                hintText: "Search Product",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.error.value != null) {
                return Center(child: Text(controller.error.value!));
              }

              if (controller.products.isEmpty) {
                return const Center(child: Text("No Products Found"));
              }

              return GridView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: controller.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .65,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final product = controller.products[index];

                  return ProductCard(
                    productId: product.id,
                    productTitle: product.name,
                    image: product.imageUrl,
                    newPrice: product.price.toString(),
                    oldPrice: product.originalPrice?.toString(),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
