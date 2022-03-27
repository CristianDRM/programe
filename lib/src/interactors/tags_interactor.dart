import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:programe/src/dto/media_list.dart';
import 'package:programe/src/dto/tag_group.dart';

import '../dto/tag.dart';

class TagsInteractor {
  const TagsInteractor({
    required this.firestore,
  });
  final FirebaseFirestore firestore;

  Stream<Iterable<Tag>> observeAllTags() => firestore
          .collection('media_list')
          .snapshots()
          .map((query) => query.docs.map((doc) => doc.data()))
          .map((docs) => docs.map(MediaList.fromJson))
          .map((items) => items.expand((item) => item.items))
          .map((media) => media.expand((media) => {...media.tags}))
          .map((tags) {
        final List<Tag> nonRepetedTags = [];
        for (final tag in tags) {
          if (!nonRepetedTags.contains(tag)) {
            nonRepetedTags.add(tag);
          }
        }
        return nonRepetedTags;
      });

  Stream<Iterable<TagGroup>> observeTagsGroup() => firestore
      .collection('tags_group')
      .snapshots()
      .map((query) => query.docs.map((doc) => doc.data()))
      .map((docs) => docs.map(TagGroup.fromJson))
      .map(
        (items) => items.toList()
          ..sort((left, right) => left.order.compareTo(right.order)),
      );
}
