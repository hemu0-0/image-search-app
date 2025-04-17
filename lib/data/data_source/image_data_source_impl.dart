import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_app/data/data_source/image_data_source.dart';
import 'package:image_search_app/data/dto/image_dto.dart';

class ImageDataSourceImpl implements ImageDataSource {
  final String apiKey = '10711147-dc41758b93b263957026bdadb';

  @override
  Future<List<ImageDto>> searchImages(String query) async {
    final url = Uri.parse(
      'https://pixabay.com/api/?key=$apiKey&q=$query&image_type=photo',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final hits = data['hits'] as List;
      return hits.map((hit) => ImageDto.fromJson(hit)).toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
