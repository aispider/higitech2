import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/helper.dart';
import '../../../../common/ui.dart';
import '../../../models/setting_model.dart';
import '../../../routes/app_routes.dart';
import '../../../services/settings_service.dart';
import '../../global_widgets/block_button_widget.dart';
import '../../global_widgets/circular_loading_widget.dart';
import '../../global_widgets/text_field_widget.dart';
import '../../root/controllers/root_controller.dart';
import '../controllers/auth_controller.dart';

class RegisterView extends GetView<AuthController> {
  final Setting _settings = Get.find<SettingsService>().setting.value;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Helper().onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Signup".tr,
            style: Get.textTheme.headline6.merge(TextStyle(color: context.theme.primaryColor)),
          ),
          centerTitle: false,
          backgroundColor: Get.theme.accentColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          
        ),
        body: Form(
          key: controller.registerFormKey,
          child: ListView(
            primary: true,
            children: [
             
              Obx(() {
                if (controller.loading.isTrue) {
                  return CircularLoadingWidget(height: 300);
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFieldWidget(
                        labelText: "Full Name".tr,
                        hintText: "John Doe".tr,
                        initialValue: controller.currentUser?.value?.name,
                        onSaved: (input) => controller.currentUser.value.name = input,
                        validator: (input) => input.length < 3 ? "Should be more than 3 characters".tr : null,
                        iconData: Icons.person_outline,
                        isFirst: true,
                        isLast: false,
                      ),
                      TextFieldWidget(
                        labelText: "Email Address".tr,
                        hintText: "johndoe@gmail.com".tr,
                        initialValue: controller.currentUser?.value?.email,
                        onSaved: (input) => controller.currentUser.value.email = input,
                        validator: (input) => !input.contains('@') ? "Should be a valid email".tr : null,
                        iconData: Icons.alternate_email,
                        isFirst: false,
                        isLast: false,
                      ),
                      TextFieldWidget(
                        labelText: "Phone Number".tr,
                        hintText: "+1 223 665 7896".tr,
                        initialValue: controller.currentUser?.value?.phoneNumber,
                        onSaved: (input) {
                          if (input.startsWith("00")) {
                            input = "+" + input.substring(2);
                          }
                          return controller.currentUser.value.phoneNumber = input;
                        },
                        validator: (input) {
                          return !input.startsWith('\+') && !input.startsWith('00') ? "Should be valid mobile number with country code" : null;
                        },
                        iconData: Icons.phone_android_outlined,
                        isLast: false,
                        isFirst: false,
                      ),
                      Obx(() {
                        return TextFieldWidget(
                          labelText: "Password".tr,
                          hintText: "••••••••••••".tr,
                          initialValue: controller.currentUser?.value?.password,
                          onSaved: (input) => controller.currentUser.value.password = input,
                          validator: (input) => input.length < 3 ? "Should be more than 3 characters".tr : null,
                          obscureText: controller.hidePassword.value,
                          iconData: Icons.lock_outline,
                          keyboardType: TextInputType.visiblePassword,
                          isLast: true,
                          isFirst: false,
                         
                        );
                      }),
                    ],
                  );
                }
              })
            ],
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              children: [
                SizedBox(
                  width: Get.width,
                  child: BlockButtonWidget(
                    onPressed: () {
                      controller.register();
                      //Get.offAllNamed(Routes.PHONE_VERIFICATION);
                    },
                    color: Colors.white,
                    text: Text(
                      "Register".tr,
                      style: Get.textTheme.headline6.merge(TextStyle(color: Colors.black)),
                    ),
                  ).paddingOnly(top: 15, bottom: 5, right: 20, left: 20),
                ),
                TextButton(
                  onPressed: () {
                    //Get.offAllNamed(Routes.LOGIN);
                     Get.toNamed(Routes.LOGIN);
                  },
                  child: Text("You already have an account?".tr,
                  style: TextStyle(color: Colors.orange),
                  ),
                ).paddingOnly(bottom: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
