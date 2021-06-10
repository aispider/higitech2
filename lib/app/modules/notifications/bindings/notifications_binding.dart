import 'package:get/get.dart';
import '../controllers/notifications_controller.dart';
import '../../../modules/root/controllers/root_controller.dart';


class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<RootController>(
      () => RootController(),
    );
    Get.lazyPut<NotificationsController>(
      () => NotificationsController(),
    );
    
  }
}
