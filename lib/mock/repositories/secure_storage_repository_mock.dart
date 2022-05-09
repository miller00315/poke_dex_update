import 'package:poke_dex/domain/repositories/secure_storage_repository.dart';

class SecureStorageRepositoryMock extends SecureStorageRepository {
  List<int> favorites = [];

  @override
  Future<List<int>> getFavoritesItems() async {
    return Future.value(favorites);
  }

  @override
  Future setFavoritesItem(List<int> ids) async {
    await Future.delayed(const Duration(milliseconds: 100));

    favorites = ids;
  }
}
