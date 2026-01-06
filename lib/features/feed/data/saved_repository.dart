abstract class SavedRepository {
  Future<Set<String>> loadSavedIds();
  Future<void> saveSavedIds(Set<String> ids);
}
