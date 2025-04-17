import '../model/image_model.dart';

abstract interface class ImageRepository {
  Future<List<Images>> searchImages(String query);
}
