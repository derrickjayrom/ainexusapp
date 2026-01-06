import 'package:ainexusapp/features/feed/data/saved_repository.dart';
import 'package:ainexusapp/features/feed/data/shared_prefs_saved_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final savedRepositoryProvider = Provider<SavedRepository>((ref) {
  return SharedPrefsSavedRepository();
});

class SavedIdsController extends AsyncNotifier<Set<String>> {
  late final SavedRepository _repo;

  @override
  Future<Set<String>> build() async {
    _repo = ref.read(savedRepositoryProvider);
    return _repo.loadSavedIds();
  }

  bool isSaved(String id) => (state.value ?? const <String>{}).contains(id);

  Future<void> toggle(String id) async {
    final current = state.value ?? <String>{};
    final next = Set<String>.from(current);

    if (!next.add(id)) {
      next.remove(id);
    }

    state = AsyncData(next);
    await _repo.saveSavedIds(next);
  }

  Future<void> remove(String id) async {
    final current = state.value ?? <String>{};
    if (!current.contains(id)) return;

    final next = Set<String>.from(current)..remove(id);
    state = AsyncData(next);
    await _repo.saveSavedIds(next);
  }

  Future<void> clear() async {
    state = const AsyncData(<String>{});
    await _repo.saveSavedIds(<String>{});
  }
}

final savedIdsProvider = AsyncNotifierProvider<SavedIdsController, Set<String>>(
  SavedIdsController.new,
);
