abstract class SavedRepository {
  Set<String> readSavedIds(); // sync for now (in-memory)
  void writeSavedIds(Set<String> ids);
}
