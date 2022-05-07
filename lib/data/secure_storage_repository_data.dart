import 'dart:convert';
import 'package:poke_dex/domain/repositories/secure_storage_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageRepositoryData extends SecureStorageRepository {
  final FlutterSecureStorage storage;

  SecureStorageRepositoryData() : storage = const FlutterSecureStorage();

  @override
  Future setFavoritesItem(List<int> ids) async {
    await storage.write(key: 'favorites', value: jsonEncode(ids));
  }

  @override
  Future<List<int>> getFavoritesItems() async {
    final data = await storage.read(key: 'favorites');

    if (data == null || data.isEmpty) {
      return [];
    }

    return List<int>.from(jsonDecode(data));
  }
}
