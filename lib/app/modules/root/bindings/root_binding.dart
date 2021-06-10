import 'package:get/get.dart';

import '../../account/controllers/account_controller.dart';
import '../../bookings/controllers/booking_controller.dart';
import '../../bookings/controllers/bookings_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../messages/controllers/messages_controller.dart';
import '../../search/controllers/search_controller.dart';
import '../../category/controllers/categories_controller.dart';
import '../controllers/root_controller.dart';
import '../../auth/controllers/auth_controller.dart';


class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );
    Get.lazyPut(()=>CategoriesController());
    Get.put(HomeController(), permanent: true);
    Get.put(BookingsController(), permanent: true);

    Get.lazyPut<BookingController>(
      () => BookingController(),
    );
    Get.lazyPut<MessagesController>(
      () => MessagesController(),
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
