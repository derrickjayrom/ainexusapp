import 'saved_repository.dart';

class InMemorySavedRepository implements SavedRepository {
  Set<String> _ids = <String>{};

  @override
  Future<Set<String>> loadSavedIds() async => _ids;

  @override
  Future<void> saveSavedIds(Set<String> ids) async {
    _ids = ids;
  }
}
