import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/repositories.dart';
import 'route/route.dart';
import 'screens/screens.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarBrightness: Brightness.dark, // for iOS
  ));
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
          scaffoldBackgroundColor: const Color(0xFF0c111b),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF0c111b),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xFF0c111b),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white54,
          ),
          drawerTheme: const DrawerThemeData(
            backgroundColor: Color(0xFF0c111b),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
