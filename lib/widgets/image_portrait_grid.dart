import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/models.dart';

class ImagePortraitGrid extends StatelessWidget {
  final ScrollController scrollController;
  final List<Movie> movies;
  final bool showAppBar;
  final String title;

  const ImagePortraitGrid({
    super.key,
    required this.scrollController,
    required this.movies,
    required this.showAppBar,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AnimatedContainer(
            height: showAppBar
                ? kToolbarHeight + MediaQuery.of(context).padding.top
                : 0,
            duration: const Duration(milliseconds: 300),
            child: AppBar(
              title: Text(title),
              elevation: 0,
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        body: GridView.builder(
          controller: scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 3 / 4,
          ),
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/detail',
                  arguments: movies[index].id,
                );
              },
              child: movies[index].posterPath != null
                  ? CachedNetworkImage(
                      imageUrl:
                          Const.posterImageUrl + movies[index].posterPath!,
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
                      fadeOutDuration: const Duration(milliseconds: 0),
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
        ),
      ),
    );
  }
}
