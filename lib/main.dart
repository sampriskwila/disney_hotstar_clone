import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/repositories.dart';
import 'route/route.dart';
import 'screens/screens.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TMDBRepository(),
      child: MaterialApp(
        title: 'Disney Hotstar Clone',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF192133),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF192133),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xFF192133),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white54,
          ),
          drawerTheme: const DrawerThemeData(
            backgroundColor: Color(0xFF192133),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
