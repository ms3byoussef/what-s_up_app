import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../theme/app_theme.dart';
import '../../theme/style.dart';
import 'set_initial_profile_page.dart';

class PhoneVerificationPage extends StatefulWidget {
  final String phoneNumber;
  const PhoneVerificationPage({Key key, this.phoneNumber}) : super(key: key);

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  String get _phoneNumber => widget.phoneNumber;

  TextEditingController _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(""),
              Text(
                "Verify your phone number",
                style: AppTheme.normalGreenHeadline,
              ),
              const Icon(Icons.more_vert)
            ],
          ),
          const SizedBox(height: 30),
          Text(
              "WhatsApp Clone will send and SMS message (carrier charges may apply) to verify your phone number. Enter your country code and phone number:",
              style: AppTheme.normalBlackText),
          _pinCodeWidget(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                color: greenColor,
                onPressed: _submitSmsCode,
                child: Text("Next", style: AppTheme.buttonText),
              ),
            ),
          )
        ]),
      )),
    );
  }

  Widget _pinCodeWidget() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            PinCodeTextField(
              appContext: context,
              controller: _pinCodeController,
              length: 6,
              backgroundColor: Colors.transparent,
              obscureText: true,
              autoDisposeControllers: false,
              onChanged: (pinCode) {
                print(pinCode);
              },
            ),
            const Text("Enter your 6 digit code")
          ],
        ));
  }

  void _submitSmsCode() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SetInitialProfileWidget()),
    );
  }
}
