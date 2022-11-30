import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/models.dart';
import 'widgets.dart';

class MovieDetailContent extends StatelessWidget {
  final int movieId;
  final MovieDetail movie;
  final double width;
  final double height;

  const MovieDetailContent({
    super.key,
    required this.movieId,
    required this.movie,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title ?? ''),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            VideoContent(movieId: movieId),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (movie.posterPath != null)
                          CachedNetworkImage(
                            imageUrl: AppConstants.posterImageUrl + movie.posterPath!,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                width: width,
                                height: height,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
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
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              );
                            },
                            fadeInDuration: const Duration(milliseconds: 0),
                            fadeOutDuration: const Duration(milliseconds: 0),
                          )
                        else
                          Container(
                            width: width,
                            height: height,
                            decoration: BoxDecoration(
                              color: Colors.grey[850],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Center(
                              child: Text('No Image'),
                            ),
                          ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title ?? 'N/A',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 6),
                              SizedBox(
                                height: 14,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: (movie.languages?.isNotEmpty ?? true) ? movie.languages!.length : 1,
                                  separatorBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      child: Icon(
                                        Icons.circle,
                                        size: 4,
                                        color: Colors.grey[600],
                                      ),
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return Text(
                                      (movie.languages?.isNotEmpty ?? true) ? movie.languages![index].name! : 'N/A',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 6),
                              SizedBox(
                                height: 14,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: (movie.genres?.isNotEmpty ?? true) ? movie.genres!.length : 1,
                                  separatorBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      child: Icon(
                                        Icons.circle,
                                        size: 4,
                                        color: Colors.grey[600],
                                      ),
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return Text(
                                      (movie.genres?.isNotEmpty ?? true) ? movie.genres![index].name! : 'N/A',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 6),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: movie.releaseDate ?? 'N/A',
                                    ),
                                    WidgetSpan(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 4,
                                        ),
                                        child: Icon(
                                          Icons.circle,
                                          size: 4,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      alignment: PlaceholderAlignment.middle,
                                    ),
                                    TextSpan(text: movie.voteAverage?.toStringAsFixed(1) ?? 'N/A'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      movie.overview ?? 'No Description',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SimilarContentList(movieId: movieId, title: 'More Like This'),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
