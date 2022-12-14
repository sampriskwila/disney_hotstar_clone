import 'package:flutter/material.dart';

class ImagePortraitGridError extends StatelessWidget {
  final String title;
  final String error;

  const ImagePortraitGridError({
    super.key,
    required this.title,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0,
      ),
      body: Center(
        child: Text(error),
      ),
    );
  }
}
