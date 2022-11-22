import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../arguments/arguments.dart';
import '../bloc/bloc.dart';
import '../repositories/repositories.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  bool _showAppBar = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _showAppBar = true;
        });
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _showAppBar = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenreBloc(
        repository: TMDBRepository(),
      )..add(LoadGenresEvent()),
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: AnimatedContainer(
              height: _showAppBar
                  ? kToolbarHeight + MediaQuery.of(context).padding.top
                  : 0,
              duration: const Duration(milliseconds: 300),
              child: AppBar(
                title: const Text('Genres'),
                elevation: 0,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          body: BlocBuilder<GenreBloc, GenreState>(
            builder: (context, state) {
              if (state is GenreLoaded) {
                return GridView.builder(
                  controller: _scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 16 / 6,
                  ),
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  itemCount: state.genres.length,
                  itemBuilder: (context, index) {
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
                );
              }
              if (state is GenreError) {
                return Center(
                  child: Text(state.error),
                );
              }
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 16 / 6,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 16,
                itemBuilder: (_, __) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
