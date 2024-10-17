import 'dart:convert';

import 'package:flutter_application_2/features/card/model/carde_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putDate({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences.setBool(key, value);
  }

  static dynamic getDate({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    return await sharedPreferences.setDouble(key, value);
  }

  static Future<bool> removeDate({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }

  static Future<bool> saveCardeList({
    required String key,
    required List<Carde> cardeList,
  }) async {
    List<String> jsonList =
        cardeList.map((carde) => jsonEncode(carde.toJson())).toList();
    return await sharedPreferences.setStringList(key, jsonList);
  }

  static Future<List<Carde>> getCardeList({
    required String key,
  }) async {
    List<String>? jsonList = sharedPreferences.getStringList(key);
    if (jsonList != null) {
      return jsonList.map((json) => Carde.fromJson(jsonDecode(json))).toList();
    }
    return [];
  }

  static Future<void> addCardeToList({
    required String key,
    required Carde newCarde,
  }) async {
    List<Carde> currentList = await getCardeList(key: key);
    currentList.add(newCarde);
    await saveCardeList(key: key, cardeList: currentList);
  }

  static Future<List<Carde>> removeIndexCardeList({
    required String key,
    required int index,
  }) async {
    List<Carde> currentList = await getCardeList(key: key);
    if (index >= 0 && index < currentList.length) {
      currentList.removeAt(index); // Remove the carde at the specified index
      await saveCardeList(
          key: key, cardeList: currentList); // Update the cached list
    }
    return currentList; // Return the updated list
  }
}
