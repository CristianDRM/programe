import 'package:flutter/material.dart';
import '../../dto/media_list.dart';
import 'media_container.dart';

class MediaListContainer extends StatelessWidget {
  const MediaListContainer({
    Key? key,
    required this.item,
  }) : super(key: key);
  final MediaList item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(item.name, style: Theme.of(context).textTheme.headline6),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) => SizedBox(
              width: 260,
              child: MediaContainer(
                media: item.items.elementAt(
                  index,
                ),
              ),
            ),
            itemCount: item.items.length,
          ),
        ),
      ],
    );
  }
}
