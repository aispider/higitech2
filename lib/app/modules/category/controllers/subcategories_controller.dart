import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../models/category_model.dart';
import '../../../repositories/category_repository.dart';
import '../../search/controllers/search_controller.dart';

enum SubCategoriesLayout { GRID, LIST }

class SubCategoriesController extends GetxController {
  CategoryRepository _categoryRepository;
  final category = new Category().obs;

  final categories = <Category>[].obs;
  final layout = SubCategoriesLayout.GRID.obs;

  SubCategoriesController() {
    _categoryRepository = new CategoryRepository();
  }

  @override
  Future<void> onInit() async {
    category.value = Get.arguments as Category;
    await refreshSubCategories();
    super.onInit();
  }

  Future refreshSubCategories({bool showMessage}) async {
    await getSubCategories(category.value.id);
    if (showMessage == true) {
      Get.showSnackbar(Ui.SuccessSnackBar(message: "List of subcategories refreshed successfully".tr));
    }
  }

  Future getSubCategories(String categoryId) async {
    try {
      categories.assignAll(await _categoryRepository.getSubCategories(categoryId));
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }
}
