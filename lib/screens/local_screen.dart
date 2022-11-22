import 'package:flutter/material.dart';

class LocalScreen extends StatelessWidget {
  final ScrollController? scrollController;

  const LocalScreen({
    super.key,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Local Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
