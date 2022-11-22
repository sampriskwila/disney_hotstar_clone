import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/bloc.dart';

class CustomAppBar extends StatelessWidget {
  final String logo;

  const CustomAppBar({
    super.key,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 0,
      title: Row(
        children: [
          SvgPicture.asset(logo),
          const SizedBox(width: 12),
          BlocBuilder<BottomNavbarBloc, BottomNavbarState>(
            builder: (context, state) {
              if (state is BottomNavbarHome) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.blue,
                    ),
                    child: const Text(
                      'SUBSCRIBE',
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {},
        ),
      ],
    );
  }
}
