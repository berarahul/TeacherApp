import 'dart:ui';

import 'package:flutter/material.dart';



class AppColors{

  AppColors._();


  // App Basics Colors
  static const Color primaryColor = Color(0xFF4B68FF);
  static const Color secondaryColor = Color(0xFFFFE24B);
  static const Color occent = Color(0xFFb0c7ff);


  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6c7570);
  static const Color textwhite = Colors.white;

  //background Colors

  static const Color light= Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  //Background Container colors

  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = AppColors.textwhite.withOpacity(0.1);



  static const Color accentColor = Color(0xFFFF6347);
  static const Color textColor = Color(0xFF333333);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color redColor = Color(0xFFDC0000);

}