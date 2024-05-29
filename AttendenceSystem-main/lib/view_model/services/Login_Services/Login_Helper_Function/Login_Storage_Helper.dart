import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class Login_Storage_Helper{


  static void storeData(
      String teacherId,
      String deptId,
      BuildContext context,
      ){
    GetStorage box = GetStorage();
    box.write('teacherId', teacherId);
    box.write('deptId', deptId);

    print('teacherId: $teacherId');
    print('deptId: $deptId');


  }
  static String? retrieveTeacherId() {
    GetStorage box = GetStorage();
    return box.read('teacherId');
  }

  static String? retrieveDeptId() {
    GetStorage box = GetStorage();
    return box.read('deptId');
  }


}