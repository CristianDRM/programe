import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:programe/src/dto/tag.dart';
import 'package:programe/src/interactors/providers.dart';
import 'package:programe/src/pages/tags_group/tags_group_result_container.dart';

import '../media_list/media_lists_container.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProgrAME')),
      floatingActionButton: const _SearchButton(),
      body: Column(
        children: const [
          TagsGroupResultContainer(),
        ],
      ),
    );
  }
}

class _SearchButton extends ConsumerWidget {
  const _SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagsFinder = ref.watch(observeAllTagsProvider);
    return tagsFinder.when(
      data: (tags) => FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            builder: (context) {
              return MultiSelectBottomSheet<Tag>(
                items: tags
                    .map(
                      (tag) => MultiSelectItem(
                        tag,
                        tag.name,
                      ),
                    )
                    .toList(),
                initialValue: const [],
                initialChildSize: 0.8,
                minChildSize: 0.8,
                title: Text(
                  'Selecione quais conteudos você quer ver',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.black),
                ),
                cancelText: const Text('Cancelar'),
                confirmText: const Text('Confirmar'),
                onConfirm: (tags) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => MediaListsContainer(
                        tags: tags,
                      ),
                    ),
                  );
                },
                maxChildSize: 1,
              );
            },
          );
        },
        child: const Icon(Icons.search),
      ),
      error: (_, __) => Container(),
      loading: () => Container(),
    );
  }
}
