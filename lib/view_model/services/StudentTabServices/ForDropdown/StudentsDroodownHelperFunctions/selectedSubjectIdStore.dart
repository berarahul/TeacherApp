import 'package:get_storage/get_storage.dart';

class StudentTabSelectedSubjectIdStore {
  final _box = GetStorage(); // Initialize GetStorage

  int get selectedSubjectId => _box.read('selectedSubjectId') ?? 0;

  set selectedSubjectId(int value) => _box.write('selectedSubjectId', value);

  void clearSelectedSubjectId() => _box.remove('selectedSubjectId');
}
