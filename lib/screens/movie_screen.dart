import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({
    super.key,
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
