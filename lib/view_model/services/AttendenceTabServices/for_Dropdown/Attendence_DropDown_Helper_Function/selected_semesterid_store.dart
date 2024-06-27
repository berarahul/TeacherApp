import 'package:get_storage/get_storage.dart';

class SelectedSemesterIdStore {
  final _box = GetStorage(); // Initialize GetStorage

  int get SelectedSemesterId => _box.read('SelectedSemesterId') ?? 0;

  set SelectedSemesterId(int? value) => _box.write('SelectedSemesterId', value);

  void clearSelectedSemesterId() => _box.remove('SelectedSemesterId');
}
