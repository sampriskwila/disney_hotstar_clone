import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  final ScrollController? scrollController;

  const HomeScreen({
    super.key,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: scrollController,
        children: const [
          ImageCarousel(),
          SizedBox(height: 8),
          TopPicksForYou(title: 'Top Picks For You'),
        ],
      ),
    );
  }
}
