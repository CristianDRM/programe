import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:programe/src/dto/tag.dart';
import 'package:programe/src/pages/media_list/media_lists_container.dart';

class MediaListsPage extends ConsumerWidget {
  const MediaListsPage({
    Key? key,
    required this.tags,
  }) : super(key: key);
  final Iterable<Tag> tags;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(tags.map((tag) => tag.name).join(' '))),
      body: MediaListsContainer(tags: tags),
    );
  }
}
