import 'package:shared_preferences/shared_preferences.dart';

class CacheService{

  Future readCache({required String Key}) async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var cache = sharedPreferences.getString(Key);
    return cache;
  }

  Future writeCache({required String Key, required String Value}) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(Key, Value);
  }

  Future deleteCache({required String Key}) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(Key);
  }
}