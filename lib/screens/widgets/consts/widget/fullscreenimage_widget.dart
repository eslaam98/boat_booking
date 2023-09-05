import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Hero(
        tag: imageUrl,
        child: InteractiveViewer(
            child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.contain,
          height: double.infinity,
          width: double.infinity,
        )),
      ),
    ));
  }
}
