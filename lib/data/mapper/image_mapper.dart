import '../../domain/model/image_model.dart';
import '../dto/image_dto.dart';

extension ImageMapper on ImageDto {
  Images toDomain() {
    return Images(
      imageUrl: webformatURL ?? '',
      user: user ?? 'Unknown',
      tags:
          (tags ?? '')
              .split(',')
              .map((e) => e.trim())
              .where((e) => e.isNotEmpty)
              .toList(),
    );
  }
}
