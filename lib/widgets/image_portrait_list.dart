import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/models.dart';

class ImagePortraitList extends StatelessWidget {
  final List<Movie> images;
  final double height;
  final double width;

  const ImagePortraitList({
    super.key,
    required this.height,
    required this.width,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                '/detail',
                arguments: images[index].id,
              );
            },
            child: images[index].posterPath != null
                ? CachedNetworkImage(
                    imageUrl:
                        AppConstants.posterImageUrl + images[index].posterPath!,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imageProvider,
                          ),
                        ),
                      );
                    },
                    placeholder: (context, url) {
                      return Container(
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[850],
                        ),
                      );
                    },
                    fadeInDuration: const Duration(milliseconds: 0),
                    fadeOutDuration: const Duration(milliseconds: 0),
                  )
                : Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[850],
                    ),
                    child: const Center(
                      child: Text('No Image'),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
