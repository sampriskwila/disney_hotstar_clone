import 'package:flutter/material.dart';

class DisneyScreen extends StatelessWidget {
  final ScrollController? scrollController;

  const DisneyScreen({
    super.key,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Disney Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
