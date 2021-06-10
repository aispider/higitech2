import 'package:get/get.dart';

import '../controllers/categories_controller.dart';
import '../controllers/category_controller.dart';
import '../controllers/subcategories_controller.dart';
import '../../root/controllers/root_controller.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../search/controllers/search_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
     Get.lazyPut<SubCategoriesController>(
      () => SubCategoriesController(),
    );
    Get.lazyPut<CategoriesController>(
      () => CategoriesController(),
    );
    Get.lazyPut<RootController>(
      () => RootController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut(()=>SearchController());
    
  }
}
