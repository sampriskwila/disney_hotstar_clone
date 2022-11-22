import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  final ScrollController? scrollController;

  const MovieScreen({
    super.key,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Movie Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
