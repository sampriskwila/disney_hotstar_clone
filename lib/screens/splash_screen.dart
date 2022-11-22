import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isInternetAvailable = false;

  @override
  void initState() {
    isInternetConnected().then((value) {
      setState(() {
        isInternetAvailable = value;
      });
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (isInternetAvailable) {
        Navigator.of(context).pushReplacementNamed('/root');
      } else {
        Navigator.of(context).pushReplacementNamed('/no_connection');
      }
    });
    super.initState();
  }

  Future<bool> isInternetConnected() async {
    var connectivity = await (Connectivity().checkConnectivity());

    if (connectivity == ConnectivityResult.mobile ||
        connectivity == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/disney_plus.svg',
          height: Const.screenWidth(context) / 3,
        ),
      ),
    );
  }
}
