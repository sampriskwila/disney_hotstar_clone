import 'package:flutter/material.dart';

class ImagePortraitListLoader extends StatelessWidget {
  final double height;
  final double width;

  const ImagePortraitListLoader({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 5,
        itemBuilder: (_, __) {
          return Container(
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[850],
            ),
          );
        },
      ),
    );
  }
}
