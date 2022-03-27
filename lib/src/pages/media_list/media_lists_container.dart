import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:programe/src/interactors/providers.dart';
import 'package:programe/src/dto/tag.dart';
import 'media_list_container.dart';

class MediaListsContainer extends ConsumerWidget {
  const MediaListsContainer({
    Key? key,
    required this.tags,
  }) : super(key: key);
  final Iterable<Tag> tags;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagsAsyncValue = ref.watch(observeMediaListByTagProvider(tags));
    return tagsAsyncValue.when(
      data: (items) => Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: items
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: MediaListContainer(item: item),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      error: (_, __) => const Text('Algo deu errado'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
