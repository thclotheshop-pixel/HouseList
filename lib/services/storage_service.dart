import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String shoppingItemsKey = 'shopping_items';

  Future<void> saveShoppingItems(List<String> items) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(shoppingItemsKey, items);
  }

  Future<List<String>> loadShoppingItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(shoppingItemsKey) ?? [];
  }
}