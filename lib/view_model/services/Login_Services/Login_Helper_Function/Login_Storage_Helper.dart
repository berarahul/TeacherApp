// import 'package:flutter/cupertino.dart';
// import 'package:get_storage/get_storage.dart';
//
// class Login_Storage_Helper{
//
//
//   static void storeData(
//       String teacherId,
//       String deptId,
//       BuildContext context,
//       ){
//     GetStorage box = GetStorage();
//     box.write('teacherId', teacherId);
//     box.write('deptId', deptId);
//
//     print('teacherId: $teacherId');
//     print('deptId: $deptId');
//
//
//   }
//   static String? retrieveTeacherId() {
//     GetStorage box = GetStorage();
//     return box.read('teacherId');
//   }
//
//   static String? retrieveDeptId() {
//     GetStorage box = GetStorage();
//     return box.read('deptId');
//   }
//
//
// }


import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class LoginStorageHelper {
  static void storeData(
      int id,
      String name, // Updated to include only id and name
      ) {
    GetStorage box = GetStorage();
    box.write('id', id);
    box.write('name', name); // Store name

    print('id: $id');
    print('name: $name'); // Print name
  }

  static int retrieveId() {
    GetStorage box = GetStorage();
    return box.read('id');
  }

  static String? retrieveName() {
    GetStorage box = GetStorage();
    return box.read('name');
  }
}
