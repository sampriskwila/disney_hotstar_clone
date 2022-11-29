import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/models.dart';

class ImageLandscapeList extends StatelessWidget {
  final PageController pageController;
  final List<Movie> images;
  final double height;

  const ImageLandscapeList({
    super.key,
    required this.pageController,
    required this.images,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: PageView.builder(
        controller: pageController,
        itemCount: images.sublist(0, 5).length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                '/detail',
                arguments: images[index].id,
              );
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                if (images[index].backdropPath != null)
                  CachedNetworkImage(
                    imageUrl: AppConstants.backdropImageUrl + images[index].backdropPath!,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
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
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[850],
                        ),
                      );
                    },
                    fadeInDuration: const Duration(milliseconds: 0),
                    fadeOutDuration: const Duration(milliseconds: 0),
                  )
                else
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[850],
                    ),
                    child: const Center(
                      child: Text('No Image'),
                    ),
                  ),
                Container(
                  height: height / 3,
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(8),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black87,
                      ],
                    ),
                  ),
                  child: Text(
                    images[index].title ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
