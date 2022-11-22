import 'package:flutter/material.dart';

class ImageLandscapeListLoader extends StatelessWidget {
  final PageController pageController;
  final double height;

  const ImageLandscapeListLoader({
    super.key,
    required this.height,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: PageView.builder(
        controller: pageController,
        itemCount: 2,
        itemBuilder: (_, __) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[850],
                ),
              ),
              Container(
                height: height / 3,
                width: double.infinity,
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black87,
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
