// views/category_view

import 'package:dio/dio.dart';
import 'package:shopease/controller/category_controller.dart';
import 'package:shopease/service/category_service.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/models/category_model.dart';
import 'package:shopease/views/search_screen.dart';
import 'package:shopease/widgets/category_card.dart';
import 'package:shopease/widgets/fillUp_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late final CategoryController controller;

  final List<String> _fallbackAssets = const [
    'assets/images/electronics.png',
    'assets/images/fashion.png',
    'assets/images/grocery.png',
    'assets/images/sports.png',
    'assets/images/beauty.png',
  ];

  final List<Color> _lightCardColors = const [
    Color(0xFFEAF4FF),
    Color(0xFFF1F8F0),
    Color(0xFFEFF7F0),
    Color(0xFFFFF6E7),
    Color(0xFFF8EFFA),
  ];

  @override
  void initState() {
    super.initState();

    controller = Get.put(CategoryController(CategoryService(Dio())));
  }

  void _openSearch() {
    Get.to(
      () => const SearchScreen(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 250),
    );
  }

  void _openCategory(CategoryModel category) {
    Get.to(
      () => SearchScreen(
        initialCategoryId: category.id,
        initialCategoryName: category.name,
      ),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    Get.delete<CategoryController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: theme.scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          'Categories',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            final horizontalPadding = switch (width) {
              < 360 => 14.0,
              < 700 => 18.0,
              < 1100 => 32.0,
              _ => 48.0,
            };

            final crossAxisCount = switch (width) {
              < 650 => 2,
              < 950 => 3,
              _ => 4,
            };

            return RefreshIndicator(
              onRefresh: controller.loadCategories,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      12,
                      horizontalPadding,
                      110,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FillupWidget(
                                hintText: 'Search products',
                                icon: Icons.search_rounded,
                                keyboardType: TextInputType.text,
                                readOnly: true,
                                onTap: _openSearch,
                              ),
                              const SizedBox(height: 26),
                              Text(
                                'All Categories',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                              const SizedBox(height: 16),

                              Obx(() {
                                if (controller.isLoading.value) {
                                  return const SizedBox(
                                    height: 260,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                }

                                if (controller.error.value != null) {
                                  return _CategoryErrorState(
                                    message: controller.error.value!,
                                    onRetry: controller.loadCategories,
                                  );
                                }

                                if (controller.categories.isEmpty) {
                                  return const _EmptyCategoryState();
                                }

                                return GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.categories.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: crossAxisCount,
                                        mainAxisSpacing: 16,
                                        crossAxisSpacing: 16,
                                        childAspectRatio: width < 400
                                            ? 0.88
                                            : 0.95,
                                      ),
                                  itemBuilder: (context, index) {
                                    final category =
                                        controller.categories[index];

                                    final backgroundColor = isDark
                                        ? theme
                                              .colorScheme
                                              .surfaceContainerHighest
                                        : _lightCardColors[index %
                                              _lightCardColors.length];

                                    return CategoryCard(
                                      title: category.name,
                                      imageUrl: category.imageUrl,
                                      assetImage: index < _fallbackAssets.length
                                          ? _fallbackAssets[index]
                                          : null,
                                      productCount: category.productCount,
                                      backgroundColor: backgroundColor,
                                      onTap: () {
                                        _openCategory(category);
                                      },
                                    );
                                  },
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _EmptyCategoryState extends StatelessWidget {
  const _EmptyCategoryState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 60),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.category_outlined, size: 56),
            SizedBox(height: 12),
            Text('No categories are available'),
          ],
        ),
      ),
    );
  }
}
