import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/bloc.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  bool _showAppBar = true;
  final ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _showAppBar = true;
        });
      } else if (scrollController.position.userScrollDirection ==
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
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavbarBloc(),
      child: SafeArea(
        child: Scaffold(
          key: _key,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: AnimatedContainer(
              height: _showAppBar
                  ? kToolbarHeight + MediaQuery.of(context).padding.top
                  : 0,
              duration: const Duration(milliseconds: 200),
              child: const CustomAppBar(logo: 'assets/disney_hotstar_logo.svg'),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Login'),
                  subtitle: const Text('For a better experience'),
                  minLeadingWidth: 8,
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.account_circle,
                        size: 40,
                      ),
                    ],
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Downloads'),
                  subtitle: const Text('Watch videos offline'),
                  minLeadingWidth: 8,
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.file_download_outlined),
                    ],
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 0,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Watchlist'),
                  subtitle: const Text('Save to watch later'),
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.list),
                    ],
                  ),
                  minLeadingWidth: 8,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Genres'),
                  leading: const Icon(Icons.face),
                  minLeadingWidth: 8,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                  onTap: () {
                    setState(() {
                      _key.currentState!.closeDrawer();
                    });
                    Future.delayed(const Duration(milliseconds: 200), () {
                      Navigator.of(context).pushNamed('/genre');
                    });
                  },
                ),
                const Divider(
                  color: Colors.white12,
                  thickness: 1,
                  height: 0,
                ),
                ListTile(
                  title: const Text('Preferences'),
                  leading: const Icon(Icons.settings),
                  minLeadingWidth: 8,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Help'),
                  leading: const Icon(Icons.help),
                  minLeadingWidth: 8,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                  onTap: () {},
                ),
              ],
            ),
          ),
          body: BlocBuilder<BottomNavbarBloc, BottomNavbarState>(
            builder: (context, state) {
              if (state is BottomNavbarSeries) {
                return SeriesScreen(scrollController: scrollController);
              } else if (state is BottomNavbarDisney) {
                return DisneyScreen(scrollController: scrollController);
              } else if (state is BottomNavbarMovie) {
                return MovieScreen(scrollController: scrollController);
              } else if (state is BottomNavbarLocal) {
                return LocalScreen(scrollController: scrollController);
              }
              return HomeScreen(scrollController: scrollController);
            },
          ),
          bottomNavigationBar: BlocBuilder<BottomNavbarBloc, BottomNavbarState>(
            builder: (context, state) {
              return BottomNavigationBar(
                currentIndex:
                    BlocProvider.of<BottomNavbarBloc>(context).currentIndex,
                onTap: (value) {
                  BlocProvider.of<BottomNavbarBloc>(context)
                      .add(ChangeBottomNavbarEvent(value));
                  setState(() {
                    _showAppBar = true;
                  });
                },
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                elevation: 0,
                items: [
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: 'Home',
                    tooltip: '',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.tv_outlined),
                    activeIcon: Icon(Icons.tv),
                    label: 'Series',
                    tooltip: '',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/disney_plus_outlined.svg'),
                    activeIcon: SvgPicture.asset('assets/disney_plus.svg'),
                    label: '',
                    tooltip: '',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.movie_creation_outlined),
                    activeIcon: Icon(Icons.movie_creation),
                    label: 'Movies',
                    tooltip: '',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.pin_drop_outlined),
                    activeIcon: Icon(Icons.pin_drop),
                    label: 'Local',
                    tooltip: '',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
