import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/models.dart';

class ImagePortraitGrid extends StatelessWidget {
  final ScrollController? scrollController;
  final List<Movie> movies;
  final String title;

  const ImagePortraitGrid({
    super.key,
    this.scrollController,
    required this.movies,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0c111b),
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(
                title: Text(title),
                floating: true,
                elevation: 0,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 3 / 4,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/detail',
                            arguments: movies[index].id,
                          );
                        },
                        child: movies[index].posterPath != null
                            ? CachedNetworkImage(
                                imageUrl: Const.posterImageUrl +
                                    movies[index].posterPath!,
                                imageBuilder: (context, imageProvider) {
                                  return Container(
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
                                    decoration: BoxDecoration(
                                      color: Colors.grey[850],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  );
                                },
                                fadeInDuration: const Duration(milliseconds: 0),
                                fadeOutDuration:
                                    const Duration(milliseconds: 0),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[850],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Text('No Image'),
                                ),
                              ),
                      );
                    },
                    childCount: movies.length,
                  ),
                ),
              ),
            ],
          ),
          // body: GridView.builder(
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 3,
          //     crossAxisSpacing: 8,
          //     mainAxisSpacing: 8,
          //     childAspectRatio: 3 / 4,
          //   ),
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 16,
          //     vertical: 8,
          //   ),
          //   itemCount: movies.length,
          //   itemBuilder: (context, index) {
          //     return GestureDetector(
          //       onTap: () {
          //         Navigator.of(context).pushNamed(
          //           '/detail',
          //           arguments: movies[index].id,
          //         );
          //       },
          //       child: movies[index].posterPath != null
          //           ? CachedNetworkImage(
          //               imageUrl:
          //                   Const.posterImageUrl + movies[index].posterPath!,
          //               imageBuilder: (context, imageProvider) {
          //                 return Container(
          //                   decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(8),
          //                     image: DecorationImage(
          //                       fit: BoxFit.cover,
          //                       image: imageProvider,
          //                     ),
          //                   ),
          //                 );
          //               },
          //               placeholder: (context, url) {
          //                 return Container(
          //                   decoration: BoxDecoration(
          //                     color: Colors.grey[850],
          //                     borderRadius: BorderRadius.circular(8),
          //                   ),
          //                 );
          //               },
          //               fadeInDuration: const Duration(milliseconds: 0),
          //               fadeOutDuration: const Duration(milliseconds: 0),
          //             )
          //           : Container(
          //               decoration: BoxDecoration(
          //                 color: Colors.grey[850],
          //                 borderRadius: BorderRadius.circular(8),
          //               ),
          //               child: const Center(
          //                 child: Text('No Image'),
          //               ),
          //             ),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
