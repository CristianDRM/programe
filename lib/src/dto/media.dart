import 'tag.dart';

class Media {
  const Media({
    required this.id,
    required this.name,
    required this.url,
    required this.description,
    required this.type,
    required this.tags,
  });
  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json['id'],
        name: json['name'],
        url: json['url'],
        description: json['description'],
        tags: (json['tags'] as List<dynamic>).map((tag) => Tag(name: tag)),
        type: MediaType.values.elementAt(json['type']),
      );
  final String name;
  final String id;
  final String description;
  final String url;
  final MediaType type;
  final Iterable<Tag> tags;
}

enum MediaType { video, audio, article }
