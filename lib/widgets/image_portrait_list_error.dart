import 'package:flutter/material.dart';

class ImagePortraitListError extends StatelessWidget {
  final String error;
  final double height;
  final double width;

  const ImagePortraitListError({
    super.key,
    required this.error,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 4,
        itemBuilder: (_, __) {
          return Container(
            width: width,
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
