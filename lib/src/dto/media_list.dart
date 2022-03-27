import 'media.dart';

class MediaList {
  const MediaList({
    required this.name,
    required this.items,
  });
  factory MediaList.fromJson(Map<String, dynamic> json) => MediaList(
        name: json['name'],
        items: (json['items'] as List<dynamic>)
            .map((item) => item as Map<String, dynamic>)
            .map(Media.fromJson),
      );
  final Iterable<Media> items;
  final String name;

  MediaList copyWith({Iterable<Media>? items, String? name}) =>
      MediaList(items: items ?? this.items, name: name ?? this.name);
}
