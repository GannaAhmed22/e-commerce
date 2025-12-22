import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefeServices {
  late final SharedPreferences prefs;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  
  static SharedPrefeServices? _instance;
  SharedPrefeServices._();

  factory SharedPrefeServices(){
    _instance ??= SharedPrefeServices._();
    return _instance!;
  }
  getInstance() async {
    prefs = await SharedPreferences.getInstance();
    return prefs;
  }

 
  
  Future<void> saveSecureString(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String?> getSecureString(String key) async {
    return await secureStorage.read(key: key);
  }

  Future<void> deleteSecureString(String key) async {
    await secureStorage.delete(key: key);
  }
}
