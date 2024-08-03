import 'package:attendence/res/Colors/AppColors.dart';
import 'package:attendence/utils/constants/sizes.dart';
import 'package:attendence/utils/constants/texts_String.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../models/forSingup/SingupModel.dart';
import '../../../res/components/roundButton.dart';
import '../../../view_model/services/SingupServices/SingupController.dart';

class SingUpPage extends StatelessWidget {
  SingUpPage({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController idCardNumberController = TextEditingController();

  // Create an Obx variable to manage the visibility state of the password
  final RxBool _isPasswordVisible = false.obs;

  // Key to manage the form state
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final SingupController singupController = Get.put(SingupController());

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              // Title
              Text(
                RTexts.SingUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: RSizes.spacebtwsections,),
              // Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: firstNameController,
                            decoration: const InputDecoration(
                              labelText: RTexts.firstName,
                              prefixIcon: Icon(Iconsax.user),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your first name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: RSizes.spacebtwInputFields,),
                        Expanded(
                          child: TextFormField(
                            controller: lastNameController,
                            decoration: const InputDecoration(
                              labelText: RTexts.lastName,
                              prefixIcon: Icon(Iconsax.user),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your last name';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: RSizes.spacebtwInputFields,),
                    // Username
                    TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        labelText: RTexts.UserName,
                        prefixIcon: Icon(Iconsax.user_edit),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: RSizes.spacebtwInputFields,),
                    // Password
                    TextFormField(
                      controller: passwordController,

                      decoration: const InputDecoration(
                        labelText: RTexts.password,
                        prefixIcon: Icon(Iconsax.key),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: RSizes.spacebtwInputFields,),
                    // Confirm Password with eye icon
                    Obx(
                          () => TextFormField(
                        controller: confirmPasswordController,
                        obscureText: !_isPasswordVisible.value,
                        decoration: InputDecoration(
                          labelText: RTexts.confirmPassword,
                          prefixIcon: const Icon(Iconsax.key),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible.value ? Iconsax.eye : Iconsax.eye_slash,
                            ),
                            onPressed: () {
                              _isPasswordVisible.value = !_isPasswordVisible.value;
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: RSizes.spacebtwInputFields,),
                    // ID Card Number
                    TextFormField(
                      controller: idCardNumberController,
                      decoration: const InputDecoration(
                        labelText: RTexts.adharNumber,
                        prefixIcon: Icon(Iconsax.cards),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your ID card number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 100,),
                    // Create Account Button
                    Obx(
                          () => RoundButton(
                        title: RTexts.CreateAccount,
                        height: 45,
                        width: 200,
                        textColor: AppColors.textwhite,
                        buttonColor: AppColors.appcolor,
                        loading: singupController.isLoading.value,
                        onPress: () async {
                          if (_formKey.currentState!.validate()) {
                            // Combine first name and last name
                            String fullName = '${firstNameController.text} ${lastNameController.text}';

                            TeacherRegistration newTeacher = TeacherRegistration(
                              name: fullName,
                              username: usernameController.text,
                              password: passwordController.text,
                              confirmPassword: confirmPasswordController.text,
                              idCardNumber: idCardNumberController.text,
                            );

                            await singupController.registerTeacher(newTeacher);
                            cleartextfield();
                          } else {
                            Get.snackbar('Error', 'Please fill all the fields');
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );

  }
  void cleartextfield(){
    firstNameController.clear();
    lastNameController.clear();
    usernameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    idCardNumberController.clear();
  }
}
