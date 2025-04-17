import 'package:flutter/material.dart';
import 'package:image_search_app/presentation/main/search_image/search_image_state.dart';

import '../../../domain/use_case/image_use_case.dart';

class SearchViewModel with ChangeNotifier {
  final SearchImageUseCase _searchImageUseCase;

  SearchViewModel(this._searchImageUseCase);

  SearchState _state = const SearchState();

  SearchState get state => _state;

  Future<void> search(String query) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final result = await _searchImageUseCase(query);
      _state = _state.copyWith(images: result, isLoading: false);
    } catch (_) {
      _state = _state.copyWith(images: [], isLoading: false);
    }

    notifyListeners();
  }
}
