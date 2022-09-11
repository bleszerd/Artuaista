import 'dart:convert';

import 'package:artuaista/core/domain/services/store_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedprefsStoreServiceImpl implements StoreService {
  @override
  Future<void> setItem(String key, dynamic dataMap) async {
    var sharedPrefs = await SharedPreferences.getInstance();

    var encodedMap = jsonEncode(dataMap);

    sharedPrefs.setString(key, encodedMap);
  }

  @override
  Future<T?> getItem<T>(String key) async {
    var sharedPrefs = await SharedPreferences.getInstance();

    var encodedMap = sharedPrefs.getString(key);

    if (encodedMap == null) return null;

    var decodedResult = jsonDecode(encodedMap);

    return decodedResult as T;
  }

  @override
  Future<bool> hasKey(String key) async {
    var sharedPrefs = await SharedPreferences.getInstance();

    bool containsKey = sharedPrefs.containsKey(key);

    return containsKey;
  }
}
