// ignore_for_file: library_private_types_in_public_api, unused_element, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:whats_up/theme/app_theme.dart';

import '../../theme/style.dart';

class SetInitialProfileWidget extends StatefulWidget {
  final String phoneNumber;

  const SetInitialProfileWidget({Key key, this.phoneNumber}) : super(key: key);

  @override
  _SetInitialProfileWidgetState createState() =>
      _SetInitialProfileWidgetState();
}

class _SetInitialProfileWidgetState extends State<SetInitialProfileWidget> {
  String get _phoneNumber => widget.phoneNumber;
  TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: <Widget>[
            Text("Profile Info", style: AppTheme.boldGreenHeadline),
            const SizedBox(
              height: 20,
            ),
            Text("Please provide your name and an optional Profile photo",
                textAlign: TextAlign.center, style: AppTheme.normalBlackText),
            const SizedBox(
              height: 30,
            ),
            _rowWidget(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: greenColor,
                  onPressed: _submitProfileInfo,
                  child: Text("Next", style: AppTheme.buttonText),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _rowWidget() {
    return Row(
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: textIconColorGray,
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: const Icon(Icons.camera_alt),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              hintText: "Enter your name",
            ),
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: textIconColorGray,
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: const Icon(Icons.insert_emoticon),
        )
      ],
    );
  }

  void _submitProfileInfo() {
    //   if (_nameController.text.isNotEmpty) {
    //     BlocProvider.of<PhoneAuthCubit>(context).submitProfileInfo(
    //         profileUrl: "",
    //         phoneNumber: _phoneNumber,
    //         name: _nameController.text);
    //   }
  }
}
