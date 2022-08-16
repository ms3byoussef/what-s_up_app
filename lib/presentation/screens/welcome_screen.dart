import 'package:flutter/material.dart';
import 'package:whats_up/theme/app_theme.dart';

import '../../theme/style.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Welcome to WhatsApp Clone",
                style: AppTheme.boldGreenHeadline.copyWith(fontSize: 20),
              ),
              SizedBox(
                height: 290,
                width: 290,
                child: Image.asset("assets/brand.png"),
              ),
              Column(
                children: <Widget>[
                  const Text(
                    "Read our Privacy Policy Tap, 'Agree and continue' to accept the Terms of Service",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    color: greenColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegistrationScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "AGREE AND CONTINUE",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
