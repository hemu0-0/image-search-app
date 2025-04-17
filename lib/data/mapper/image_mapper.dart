import '../../domain/model/image_model.dart';
import '../dto/image_dto.dart';

extension ImageMapper on ImageDto {
  Image toDomain() {
    return Image(
      imageUrl: userImageUrl ?? '',
      user: user ?? 'Unknown',
      tags: tags ?? [],
    );
  }
}
