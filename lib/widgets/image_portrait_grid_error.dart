import 'package:flutter/material.dart';

import '../styles/styles.dart';

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
    return Container(
      color: AppColors.backgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            elevation: 0,
          ),
          body: Center(
            child: Text(error),
          ),
        ),
      ),
    );
  }
}
