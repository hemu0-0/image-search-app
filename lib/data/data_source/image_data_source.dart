import '../dto/image_dto.dart';

abstract interface class ImageDataSource {
  Future<List<ImageDto>> searchImages(String query);
}
