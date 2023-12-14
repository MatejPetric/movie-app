import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum HiveBoxesEnum { movies, genres, favorites }

class HiveStorageService {
  Future<void> openBox<T>(String boxName) async {
    await Hive.openBox<T>(boxName);
  }

  Future<void> closeBox({required String boxName}) async {
    await Hive.box(boxName).close();
  }

  Future<void> deleteValue<T>({
    required String key,
    required String boxName,
  }) async {
    await Hive.box<T>(boxName).delete(key);
  }

  T getValue<T>({
    required String key,
    required String boxName,
  }) =>
      Hive.box(boxName).get(key);

  List<T> getAll<T>({
    required String boxName,
  }) =>
      Hive.box<T>(boxName).values.toList();

  bool hasValue<T>({
    required String key,
    required String boxName,
  }) =>
      Hive.box<T>(boxName).containsKey(key);

  Future<void> setValue<T>(
      {required String key,
      required String boxName,
      required dynamic data}) async {
    await Hive.box<T>(boxName).put(key, data);
  }

  Future<void> clear({required String boxName}) async {
    await Hive.box(boxName).clear();
  }
}

final hiveStorageServiceProvider =
    Provider<HiveStorageService>((ref) => HiveStorageService());
