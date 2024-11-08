import 'package:get_storage/get_storage.dart';

class StorageService {
  StorageService._privateConstructor();

  static final StorageService _instance = StorageService._privateConstructor();

  factory StorageService() {
    return _instance;
  }

  final GetStorage _storage = GetStorage();

  Future<void> write(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  String? read(String key) {
    print(_storage.read(key));
    return _storage.read(key);
  }

  Future<void> remove(String key) async {
    await _storage.remove(key);
  }

  Future<void> clear() async {
    await _storage.erase();
  }
}
