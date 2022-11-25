import 'package:flutter/material.dart';

class DisneyScreen extends StatelessWidget {
  const DisneyScreen({
    super.key,
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
