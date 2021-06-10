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
import '../../global_widgets/main_drawer_widget.dart';

class LoginView extends GetView<AuthController> {
  final Setting _settings = Get.find<SettingsService>().setting.value;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Helper().onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Login".tr,
            style: Get.textTheme.headline6.merge(TextStyle(color: context.theme.primaryColor)),
          ),
          centerTitle: false,
          backgroundColor: Get.theme.accentColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          
        ),
       
        body: Form(
          key: controller.loginFormKey,
          child: ListView(
            primary: true,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    height:70,
                    width: Get.width,
                    
                    margin: EdgeInsets.only(bottom: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      
                    ),
                  ),
                  Container(
                   
                    child: ClipRRect(
                     
                      child: Image.asset(
                        'assets/icon/icon.png',
                        fit: BoxFit.cover,
                        width: 181,
                        height: 50,
                      ),
                    ),
                  ),
                ],
              ),
              Obx(() {
                if (controller.loading.isTrue)
                  return CircularLoadingWidget(height: 300);
                else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFieldWidget(
                        labelText: " Email address".tr,
                        hintText: "  Enter your Email address".tr,
                         isFirst: false,
                        onSaved: (input) => controller.currentUser.value.email = input,
                        validator: (input) => !input.contains('@') ? "Should be a valid email".tr : null,
                         suffixIcon: Icon(
                     Icons.alternate_email,
                    color: Colors.orange,

                    
                  ),
                      ),
                     Obx(() {
                        return TextFieldWidget(
                          labelText: "Password".tr,
                          hintText: "  ••••••••••••".tr,
                          onSaved: (input) => controller.currentUser.value.password = input,
                          validator: (input) => input.length < 3 ? "Should be more than 3 characters".tr : null,
                          obscureText: controller.hidePassword.value,
                          //iconData: Icons.lock_outline,
                          keyboardType: TextInputType.visiblePassword,
                           suffixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.orange,

                    
                  ),
                         
                        );
                      }), 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.offAndToNamed(Routes.FORGOT_PASSWORD);
                            },
                            child: Text("Forgot Password?".tr,
                            style: TextStyle(color: Colors.orange),
                            ),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 20),
                      BlockButtonWidget(
                        onPressed: () {
                          controller.login();
                        },
                        color: Colors.white,
                        text: Text(
                          "Login".tr,
                          style: Get.textTheme.headline6.merge(TextStyle(color: Colors.black)),
                        ),
                        
                      ).paddingSymmetric(vertical: 5, horizontal: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                           
                            child: Text("0r".tr,
                            
                            ),
                          ),
                        ],
                      ).paddingSymmetric(vertical: 1),


                      BlockButtonWidget(
                        onPressed: () {
                           Get.offAndToNamed(Routes.REGISTER);
                        },
                        color: Colors.white,
                        text: Text(
                          "Signup".tr,
                          style: Get.textTheme.headline6.merge(TextStyle(color: Colors.black)),
                        ),
                      ).paddingSymmetric(vertical: 5, horizontal: 20),
                      
                    ],
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
