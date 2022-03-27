import 'package:flutter/material.dart';
import '../../dto/media.dart';
import 'dart:html' as html;

class MediaContainer extends StatelessWidget {
  const MediaContainer({
    Key? key,
    required this.media,
  }) : super(key: key);
  final Media media;

  @override
  Widget build(BuildContext context) {
    return _MediaItem(
      media: media,
    );
  }
}

class _MediaItem extends StatelessWidget {
  const _MediaItem({
    Key? key,
    required this.media,
  }) : super(key: key);
  final Media media;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        html.window.open(
          media.url,
          'new tab',
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green,
            width: 1,
          ),
        ),
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                media.name,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 16),
              Text(media.description),
            ],
          ),
        ),
      ),
    );
  }
}
