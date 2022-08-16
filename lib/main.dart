import 'package:flutter/material.dart';
import 'package:whats_up/presentation/screens/splash_screen.dart';
import 'presentation/screens/registration_screen.dart';
import 'presentation/screens/welcome_screen.dart';

void main() async {
  runApp(const MainApplication());
}

class MainApplication extends StatelessWidget {
  const MainApplication({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter What\'s Up ',
      home: SplashScreen(),
    );
  }
}
