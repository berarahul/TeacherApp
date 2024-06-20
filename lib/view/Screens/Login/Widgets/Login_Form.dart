import 'package:attendence/local_storage/my_storage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../res/components/roundButton.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts_String.dart';
import '../../../../view_model/services/Login_Services/Login_Helper_Function/Login_Storage_Helper.dart';
import '../../../../view_model/services/Login_Services/login_controller.dart';
import '../../BottomNavigation/Bottom_Navigation_Menu.dart';

class Login_form extends StatelessWidget {
  const Login_form({
    super.key,
    required this.teacherIdController,
    required this.deptIdController,
  });

  final TextEditingController teacherIdController;
  final TextEditingController deptIdController;

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Username TextFormField
        TextFormField(
          controller: teacherIdController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.person),
            labelText: RTexts.username,
          ),
        ),
        const SizedBox(height: RSizes.spacebtwInputFields),

        // Password TextFormField
        Obx(
          () => TextFormField(
            controller: deptIdController,
            obscureText: loginController.obscureText.value,
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.key),
              labelText: RTexts.password,
              suffixIcon: IconButton(
                icon: Icon(
                  loginController.obscureText.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye,
                ),
                onPressed: loginController.togglePasswordVisibility,
              ),
            ),
          ),
        ),
        const SizedBox(height: RSizes.xl),

        // Forget Password Button
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                RTexts.Forgetpassword,
                style: TextStyle(fontSize: RSizes.fontSizeLg),
              ),
            ),
          ],
        ),
        const SizedBox(height: RSizes.xl),

        // Sign In Button
        SizedBox(
            width: double.infinity,
            child: Obx(() {
              return RoundButton(
                height: 45,
                title: 'Login',
                loading: loginController.isLoading.value,
                onPress: () async {
                  loginController.setLoading(true);
                  await Future.delayed(Duration(seconds: 2));

                  String teacherId = teacherIdController.text.trim();
                  String deptId = deptIdController.text.trim();
                  Login_Storage_Helper.storeData(teacherId, deptId, context);
                  Get.find<MyStorageController>().storageTeacherId(teacherId);
                  loginController.setLoading(false);
                  Get.to(const BottomNavigationMenu());
                },
                width: 160,
              );
            })),
      ],
    );
  }
}
