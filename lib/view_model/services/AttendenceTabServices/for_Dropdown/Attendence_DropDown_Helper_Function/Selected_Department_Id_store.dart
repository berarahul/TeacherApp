import 'package:get_storage/get_storage.dart';

class SelectedDepartmentIdStore {
  final _box = GetStorage(); // Initialize GetStorage

  int get selectedDepartmentId => _box.read('selectedDepartmentId') ?? 0;

  set selectedDepartmentId(int value) => _box.write('selectedDepartmentId', value);

  void clearSelectedDepartmentId() => _box.remove('selectedDepartmentId');
}
