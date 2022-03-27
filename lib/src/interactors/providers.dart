import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:programe/src/dto/tag.dart';

import 'media_list_interactor.dart';
import 'tags_interactor.dart';

final _firestoreProvider = Provider((_) => FirebaseFirestore.instance);
final _tagsInteractorProvider = Provider(
  (ref) => TagsInteractor(
    firestore: ref.watch(_firestoreProvider),
  ),
);
final _mediaListInteractorProvider = Provider(
  (ref) => MediaListInteractor(
    firestore: ref.watch(_firestoreProvider),
  ),
);

final observeAllTagsProvider = StreamProvider(
  (ref) => ref.watch(_tagsInteractorProvider).observeAllTags(),
);
final observeTagsGroupProvider = StreamProvider(
  (ref) => ref.watch(_tagsInteractorProvider).observeTagsGroup(),
);

final observeMediaListByTagProvider = StreamProviderFamily(
  (
    ref,
    Iterable<Tag> tags,
  ) =>
      ref.watch(_mediaListInteractorProvider).observeMediaListBy(tags: tags),
);
