import 'package:flutter/material.dart';
import 'customThemes/AppBarTheme.dart';
import 'customThemes/Buttom_sheet_Theme.dart';
import 'customThemes/CheckBoxTheme.dart';
import 'customThemes/OutLineButtonTheme.dart';
import 'customThemes/TextFieldTheme.dart';
import 'customThemes/chipTheme.dart';
import 'customThemes/texttheme.dart';
import 'customThemes/elevatedbutton_theme.dart';
class AppTheme{
  AppTheme._();
  static ThemeData lightTheme= ThemeData(

    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTexttheme.lightTexttheme,
    chipTheme: CheapTheme.lightChipTheme,
    appBarTheme: AppbarTheme.lightAppBarTheme,
    checkboxTheme: CheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: ButtomsheetTheme.lightbuttomsheet,
    // elevatedButtonTheme: ElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: OutLineButtonTheme.lightOutLinedButtonTheme,
    inputDecorationTheme: TextFieldTheme.lightTextField,

  );
  static ThemeData darkTheme= ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: AppTexttheme.darkTexttheme,
    chipTheme: CheapTheme.darkChipTheme,
    appBarTheme: AppbarTheme.darkAppBarTheme,
    checkboxTheme: CheckBoxTheme.darkCheckboxTheme,
    bottomSheetTheme: ButtomsheetTheme.darkbuttomsheet,
    // elevatedButtonTheme: ElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: OutLineButtonTheme.darkOutLinedButtonTheme,
    inputDecorationTheme: TextFieldTheme.darkTextField,
  );

}