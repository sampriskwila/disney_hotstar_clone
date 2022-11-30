import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/repositories.dart';
import 'route/route.dart';
import 'screens/screens.dart';
import 'styles/styles.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: AppColors.backgroundColor, // for Android
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
        theme: AppThemes.darkTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
