class ImageDto {
  final String? pageUrl;
  final List<String>? tags;
  final String? user;

  ImageDto({this.pageUrl, this.tags, this.user});

  factory ImageDto.fromJson(Map<String, dynamic> json) {
    return ImageDto(
      pageUrl: json['pageURL'] as String?,
      tags: (json['tags'] as String?)?.split(', ').toList(),
      user: json['user'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'pageURL': pageUrl, 'tags': tags?.join(', '), 'user': user};
  }
}
