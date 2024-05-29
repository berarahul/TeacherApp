
import 'package:get_storage/get_storage.dart';

class LocalStorageService {
  final _box = GetStorage();


  Future<void> write<T>(String key, T value) async {
    await _box.write(key, value);
  }


  T read<T>(String key) {
    return _box.read(key) as T;
  }


  Future<void> delete(String key) async {
    await _box.remove(key);
  }
}