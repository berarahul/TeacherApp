import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../main.dart';
import '../models/for_attandance_tab/DepartmentModel.dart';
import 'local_storage_service.dart';


class MyStorageController extends GetxController {
  final _storageService = GetStorage();
  RxList<DepartmentModel> departments = <DepartmentModel>[].obs;
  RxString teacherId = ''.obs;

  void storageTeacherId(String id) async {
    teacherId.value = id;
    await _storageService.write('teacherId', id);
  }

  Future<String> getTeacherId() async {
    return await _storageService.read('teacherId') ?? '';
  }

  void removeTeacherId() async {
    await _storageService.remove('teacherId');
  }

  void addDepartment(DepartmentModel department) async {
    final savedDepartments = await getDepartments();
    savedDepartments.add(department);
    await _storageService.write('departments', jsonEncode(savedDepartments.map((dept) => dept.toJson()).toList()));
  }

  void addDepartments(List<DepartmentModel> departments) async {
    final savedDepartments = await getDepartments();
    savedDepartments.addAll(departments);
    await _storageService.write('departments', jsonEncode(savedDepartments.map((dept) => dept.toJson()).toList()));
  }

  Future<List<DepartmentModel>> getDepartments() async {
    final savedDepartments = await _storageService.read("departments");
    var departs = savedDepartments != null
        ? List<DepartmentModel>.from(jsonDecode(savedDepartments).map((deptMap) => DepartmentModel.fromJson(deptMap)))
        : <DepartmentModel>[];

    return departs;
  }

  Future<List<DepartmentModel>> getDepartmentsById() async {
    final savedDepartments = await getDepartments();
   savedDepartments.forEach((element) {
     print("Element: ${element.toJson()}");
   });
    var departs = savedDepartments.where((dept) => dept.teacherId == teacherId.value).toList();
    print("Departments by Id: $departs");
    return departs;
  }
}