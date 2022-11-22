import 'package:flutter/material.dart';

class SeriesScreen extends StatelessWidget {
  final ScrollController? scrollController;

  const SeriesScreen({
    super.key,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Series Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
