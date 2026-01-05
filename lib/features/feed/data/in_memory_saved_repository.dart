import 'saved_repository.dart';

class InMemorySavedRepository implements SavedRepository {
  Set<String> _ids = <String>{};

  @override
  Set<String> readSavedIds() => _ids;
  

  @override
  void writeSavedIds(Set<String> ids) {
    _ids = ids;
  }
}
