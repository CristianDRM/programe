import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:programe/src/dto/tag.dart';
import 'package:programe/src/dto/tag_group.dart';
import 'package:programe/src/interactors/providers.dart';
import 'package:programe/src/pages/media_list/media_lists_page.dart';

import '../media_list/media_lists_container.dart';

class TagsGroupResultContainer extends ConsumerWidget {
  const TagsGroupResultContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final groupsAsyncValue = ref.watch(observeTagsGroupProvider);
    return groupsAsyncValue.when(
      data: (groups) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          Text(
            'Aulas',
            style: theme.textTheme.headline5?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) => Container(
                height: 1,
                color: Colors.grey.withOpacity(0.5),
              ),
              itemBuilder: (_, int index) {
                final item = groups.elementAt(index);
                return ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: IntrinsicWidth(
                    child: InkWell(
                      onTap: () => openDetail(
                        context,
                        group: item,
                      ),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                item.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                              const SizedBox(height: 16),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: item.tags
                                    .map(
                                      (tag) => ChoiceChip(
                                        onSelected: (_) {},
                                        pressElevation: 0.0,
                                        selectedColor: Colors.orange,
                                        elevation: 1,
                                        label: Text(
                                          tag.name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        selected: true,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: groups.length,
            ),
          ),
        ],
      ),
      error: (_, __) => Text('Algo deu errado $_'),
      loading: () => const CircularProgressIndicator(),
    );
  }

  void openDetail(BuildContext context, {required TagGroup group}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MediaListsPage(
          tags: group.tags,
        ),
      ),
    );
  }
}
