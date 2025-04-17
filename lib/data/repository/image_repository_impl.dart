import 'package:image_search_app/data/mapper/image_mapper.dart';
import 'package:image_search_app/domain/model/image_model.dart';

import '../../domain/repository/image_repository.dart';
import '../data_source/image_data_source.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource dataSource;

  ImageRepositoryImpl(this.dataSource);

  @override
  Future<List<Images>> searchImages(String query) async {
    final images = await dataSource.searchImages(query);
    return images.map((image) => image.toDomain()).toList();
  }
}
