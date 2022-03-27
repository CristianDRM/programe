import 'package:cloud_firestore/cloud_firestore.dart';

import '../dto/media_list.dart';
import '../dto/tag.dart';

class MediaListInteractor {
  const MediaListInteractor({
    required this.firestore,
  });
  final FirebaseFirestore firestore;

  Stream<Iterable<MediaList>> observeMediaListBy({
    required Iterable<Tag> tags,
  }) =>
      firestore
          .collection('media_list')
          .snapshots()
          .map((query) => query.docs.map((doc) => doc.data()))
          .map((docs) => docs.map(MediaList.fromJson))
          .map(
            (mediaLists) => mediaLists.map(
              (item) => item.copyWith(
                items: item.items.where(
                  (e) => e.tags.hasIntersection(tags),
                ),
              ),
            ),
          )
          .map(
            (mediaLists) => mediaLists.where(
              (mediaList) => mediaList.items.isNotEmpty,
            ),
          );
}

extension _Contains on Iterable<Tag> {
  bool hasIntersection(Iterable<Tag> values) {
    for (final currentTag in this) {
      if (values.contains(currentTag)) {
        return true;
      }
    }
    return false;
  }
}
