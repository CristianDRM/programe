import 'tag.dart';

class TagGroup {
  const TagGroup({
    required this.tags,
    required this.name,
    required this.order,
  });
  factory TagGroup.fromJson(Map<String, dynamic> json) => TagGroup(
        name: json['name'],
        order: json['order'],
        tags: (json['tags'] as List<dynamic>).map(
          (data) => Tag(name: data),
        ),
      );

  final Iterable<Tag> tags;
  final String name;
  final int order;
}

class SectionTagGroup {
  const SectionTagGroup({
    required this.sectionTags,
    required this.tagGroup,
  });

  final Iterable<Tag> sectionTags;
  final TagGroup tagGroup;
}
