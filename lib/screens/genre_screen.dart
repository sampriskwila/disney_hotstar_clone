import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../arguments/arguments.dart';
import '../bloc/bloc.dart';
import '../repositories/repositories.dart';
import '../styles/styles.dart';

class GenreScreen extends StatelessWidget {
  const GenreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenreBloc(
        repository: TMDBRepository(),
      )..add(LoadGenresEvent()),
      child: Container(
        color: AppColors.backgroundColor,
        child: SafeArea(
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: const Text('Genres'),
                  floating: true,
                  elevation: 0,
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ],
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  sliver: BlocBuilder<GenreBloc, GenreState>(
                    builder: (context, state) {
                      if (state is GenreLoaded) {
                        return SliverGrid(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 16 / 7,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    '/selected_genre',
                                    arguments: GenreArguments(
                                      state.genres[index].name!,
                                      state.genres[index].id!,
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[850],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      state.genres[index].name?.toUpperCase() ?? '',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            childCount: state.genres.length,
                          ),
                        );
                      }
                      if (state is GenreError) {
                        return Center(
                          child: Text(state.error),
                        );
                      }
                      return SliverGrid(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 16 / 7,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[850],
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          },
                          childCount: 16,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
