abstract class SecureStorageRepository {
  Future setFavoritesItem(List<int> ids);

  Future<List<int>> getFavoritesItems();
}
