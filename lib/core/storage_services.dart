
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:template/core/app_helper.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find<StorageService>();

  late GetStorage _box;

  Future<StorageService> init() async {
    await GetStorage.init();
    _box = GetStorage();
    return this;
  }

  Future<void> write(String key, dynamic value) async {
    await _box.write(key, value);
  }

  T? read<T>(String key, {T? defaultValue}) {
    return _box.read<T>(key) ?? defaultValue;
  }

  Future<void> remove(String key) async {
    await _box.remove(key);
  }

  Future<void> clearAll() async {
    await _box.erase();
    AppHelper.clear();
  }

  Future<void> saveToken(String token) async {
    await write('token', token);
    AppHelper.token = token;
  }


}