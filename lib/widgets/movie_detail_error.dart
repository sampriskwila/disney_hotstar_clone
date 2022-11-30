import 'package:flutter/material.dart';

class MovieDetailErrors extends StatelessWidget {
  final String error;

  const MovieDetailErrors({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
        elevation: 0,
      ),
      body: Center(
        child: Text(error),
      ),
    );
  }
}
