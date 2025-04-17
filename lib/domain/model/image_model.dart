class Images {
  final String imageUrl;
  final String user;
  final List<String> tags;

  Images({required this.imageUrl, required this.user, required this.tags});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Images &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          user == other.user &&
          tags == other.tags;

  @override
  int get hashCode => imageUrl.hashCode ^ user.hashCode ^ tags.hashCode;

  @override
  String toString() {
    return 'Images{imageUrl: $imageUrl, user: $user, tags: $tags}';
  }

  Images copyWith({String? imageUrl, String? user, List<String>? tags}) {
    return Images(
      imageUrl: imageUrl ?? this.imageUrl,
      user: user ?? this.user,
      tags: tags ?? this.tags,
    );
  }
}
