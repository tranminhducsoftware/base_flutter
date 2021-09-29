import 'package:flutter_secure_storage/flutter_secure_storage.dart';

 class SecureStorage {
   static  final FlutterSecureStorage storage = new FlutterSecureStorage();

  static  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

   static Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

   static Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }
}