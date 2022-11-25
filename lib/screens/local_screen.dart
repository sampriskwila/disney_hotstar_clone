import 'package:flutter/material.dart';

class LocalScreen extends StatelessWidget {
  const LocalScreen({
    super.key,
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
