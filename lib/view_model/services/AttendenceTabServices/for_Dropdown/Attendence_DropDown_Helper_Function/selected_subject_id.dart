import 'package:get_storage/get_storage.dart';

class SelectedSubjectIdStore{


  final _box = GetStorage(); // Initialize GetStorage

  int get SelectedSubjectId => _box.read('SelectedSubjectId') ?? 0;

  set SelectedSubjectId(int value) => _box.write('SelectedSubjectId', value);

  void clearSelectedSubjectId() => _box.remove('SelectedSubjectId');





}