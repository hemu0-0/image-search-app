import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/image_model.dart';

part 'search_image_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  final List<Images> images;
  final bool isLoading;

  const SearchState({this.images = const [], this.isLoading = false});
}
