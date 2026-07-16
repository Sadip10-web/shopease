import 'package:shopease/models/category_model.dart';

class CategoryService {
  // Setup your Base client or GetConnect client here if needed

  Future<List<CategoryModel>> fetchCategories() async {
    // Backend API context: GET /api/categories
    // Expected top-level shape:
    // { "success": true, "message": "...", "data": [...] }

    await Future<void>.delayed(const Duration(milliseconds: 500));

    // Hardcoded initial data acting as local mock for now
    return const [
      CategoryModel(
        id: 1,
        name: 'Electronics',
        imageUrl: null,
        productCount: 125,
      ),
      CategoryModel(id: 2, name: 'Fashion', imageUrl: null, productCount: 89),
      CategoryModel(id: 3, name: 'Grocery', imageUrl: null, productCount: 64),
      CategoryModel(id: 4, name: 'Sports', imageUrl: null, productCount: 48),
      CategoryModel(id: 5, name: 'Beauty', imageUrl: null, productCount: 37),
    ];
  }
}
