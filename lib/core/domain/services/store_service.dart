abstract class StoreService {
  Future<void> setItem(String key, dynamic dataMap);
  Future<T?> getItem<T>(String key);
  Future<bool> hasKey(String key);
}
