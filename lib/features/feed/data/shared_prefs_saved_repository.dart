import 'package:ainexusapp/features/feed/data/saved_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsSavedRepository implements SavedRepository {
  static const _key = 'saved_ids';

  @override
  Future<Set<String>> loadSavedIds() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? <String>[];
    return list.toSet();
  }

  @override
  Future<void> saveSavedIds(Set<String> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, ids.toList()..sort());
  }
}
