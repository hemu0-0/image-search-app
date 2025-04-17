import '../model/image_model.dart';
import '../repository/image_repository.dart';

class SearchImageUseCase {
  final ImageRepository repository;

  SearchImageUseCase(this.repository);

  Future<List<Images>> call(String query) async {
    return repository.searchImages(query);
  }
}
