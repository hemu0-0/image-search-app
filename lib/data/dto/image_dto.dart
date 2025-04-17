class ImageDto {
  final String? userImageUrl;
  final List<String>? tags;
  final String? user;

  ImageDto({this.userImageUrl, this.tags, this.user});

  factory ImageDto.fromJson(Map<String, dynamic> json) {
    return ImageDto(
      userImageUrl: json['pageURL'] as String?,
      tags: (json['tags'] as String?)?.split(', ').toList(),
      user: json['user'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'pageURL': userImageUrl, 'tags': tags?.join(', '), 'user': user};
  }
}
