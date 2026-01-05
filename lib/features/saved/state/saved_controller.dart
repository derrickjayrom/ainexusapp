import 'package:ainexusapp/features/feed/data/in_memory_saved_repository.dart';
import 'package:ainexusapp/features/feed/data/saved_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final savedRepositoryProvider = Provider<SavedRepository>((ref) {
  return InMemorySavedRepository();
});

class SavedController extends StateNotifier<Set<String>> {
  SavedController(this._repo) : super(_repo.readSavedIds());

  final SavedRepository _repo;

  bool isSaved(String id) => state.contains(id);

  void toggle(String id) {
    final next = Set<String>.from(state);
    if (!next.add(id)) {
      next.remove(id);
    }
    state = next;
    _repo.writeSavedIds(next);
  }

  void remove(String id) {
    if (!state.contains(id)) return;
    final next = Set<String>.from(state)..remove(id);
    state = next;
    _repo.writeSavedIds(next);
  }

  void clear() {
    state = <String>{};
    _repo.writeSavedIds(state);
  }
}

final savedIdsProvider = StateNotifierProvider<SavedController, Set<String>>((
  ref,
) {
  final repo = ref.watch(savedRepositoryProvider);
  return SavedController(repo);
});
