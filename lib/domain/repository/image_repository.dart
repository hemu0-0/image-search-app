import '../model/image_model.dart';

abstract interface class ImageRepository {
  Future<List<Image>> searchImages(String query);
}
