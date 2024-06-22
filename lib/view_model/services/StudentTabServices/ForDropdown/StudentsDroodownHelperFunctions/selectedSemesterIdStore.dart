import 'package:get_storage/get_storage.dart';

class StudentTabSelectedSemesterIdStore {
  final _box = GetStorage(); // Initialize GetStorage

  int get selectedSemesterId => _box.read('selectedSemesterId') ?? 0;

  set selectedSemesterId(int value) => _box.write('selectedSemesterId', value);

  void clearSelectedSemesterId() => _box.remove('selectedSemesterId');
}
