import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts_String.dart';
import '../../../../view_model/services/Login_Services/Login_Helper_Function/Login_Storage_Helper.dart';
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
        TextFormField(
          controller: deptIdController,
          obscureText: true,
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.key),
            labelText: RTexts.password,
            suffixIcon: Icon(Iconsax.eye_slash),
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
          child: ElevatedButton(
            onPressed: () async {
              // Store teacherId and deptId in local storage

              String teacherId = teacherIdController.text.trim();
              String deptId = deptIdController.text.trim();

              Login_Storage_Helper.storeData(teacherId, deptId, context);

              Get.to(const BottomNavigationMenu());
            },
            child: const Text(RTexts.Login),
          ),
        ),
      ],
    );
  }
}

