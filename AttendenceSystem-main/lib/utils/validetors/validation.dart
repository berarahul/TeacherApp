// import 'package:get_storage/get_storage.dart';
//
// class Rvalidator{
//
//   static String? validateEmail(String? value){
//     if(value==null || value.isEmpty){
//       return 'Username is required';
//     }
//     // Regular expression for email validation
//
//     final emailRegExp= RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     if(!emailRegExp.hasMatch(value)){
//       return 'Invalid email address';
//     }
//     return null;
//   }
//   static String? validatepassword(String? value){
//     if(value==null||value.isEmpty){
//       return 'Password is required';
//     }
//     if(value.length<6){
//       return 'Password must be at least 6 characters long';
//     }
//    if(!value.contains(RegExp(r'[A-Z]'))){
//      return 'Password must contain at least one uppercase letter';
//    }
//
//     if(!value.contains(RegExp(r'[0-9]'))){
//       return 'Password must contain at least one number';
//     }
//     if(!value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))){
//       return 'Password must contain at least one special character';
//     }
//     return null;
//   }
// }