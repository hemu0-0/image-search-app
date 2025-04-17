class Image {
  final String imageUrl;
  final String user;
  final List<String> tags;

  Image({required this.imageUrl, required this.user, required this.tags});

  Image copyWith({String? imageUrl, String? user, List<String>? tags}) {
    return Image(
      imageUrl: imageUrl ?? this.imageUrl,
      user: user ?? this.user,
      tags: tags ?? this.tags,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Image &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          user == other.user &&
          tags == other.tags;

  @override
  int get hashCode => imageUrl.hashCode ^ user.hashCode ^ tags.hashCode;

  @override
  String toString() {
    return 'Image{imageUrl: $imageUrl, user: $user, tags: $tags}';
  }
}
