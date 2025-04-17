class ImageDto {
  final String? webformatURL;
  final String? tags;
  final String? user;

  ImageDto({this.webformatURL, this.tags, this.user});

  factory ImageDto.fromJson(Map<String, dynamic> json) {
    return ImageDto(
      webformatURL: json['webformatURL'] as String?,
      tags: json['tags']?.toString(),
      user: json['user'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'webformatURL': webformatURL, 'tags': tags, 'user': user};
  }
}
