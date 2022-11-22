import 'package:flutter/material.dart';

class ImageLandscapeListError extends StatelessWidget {
  final PageController pageController;
  final String error;
  final double height;

  const ImageLandscapeListError({
    super.key,
    required this.pageController,
    required this.error,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: PageView.builder(
        controller: pageController,
        itemCount: 1,
        itemBuilder: (_, __) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[850],
            ),
            child: Center(
              child: Text(error),
            ),
          );
        },
      ),
    );
  }
}
