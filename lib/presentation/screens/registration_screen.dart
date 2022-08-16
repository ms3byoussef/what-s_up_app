// ignore_for_file: prefer_final_fields, unused_field, unnecessary_import

import 'package:country_pickers/utils/utils.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';

import 'package:whats_up/theme/app_theme.dart';
import 'package:whats_up/theme/style.dart';

import '../pages/phone_verification_page.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  static Country _selectedFilteredDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode("92");
  String _countryCode = _selectedFilteredDialogCountry.phoneCode;
  String _phoneNumber = "";

  TextEditingController _phoneAuthController = TextEditingController();

  @override
  void dispose() {
    _phoneAuthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(""),
                  Text(
                    "Verify your phone number",
                    style: AppTheme.normalGreenHeadline,
                  ),
                  const Icon(Icons.more_vert),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                "WhatsApp Clone will send and SMS message (carrier charges may apply) to verify your phone number. Enter your country code and phone number:",
                style: AppTheme.normalBlackText,
              ),
              const SizedBox(height: 30),
              ListTile(
                onTap: _openFilteredCountryPickerDialog,
                title: _buildDialogItem(_selectedFilteredDialogCountry),
              ),
              Row(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      width: 1.50,
                      color: greenColor,
                    ))),
                    width: 80,
                    height: 42,
                    alignment: Alignment.center,
                    child: Text('+${_selectedFilteredDialogCountry.phoneCode}'),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        controller: _phoneAuthController,
                        decoration:
                            const InputDecoration(hintText: "Phone Number"),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    color: greenColor,
                    onPressed: _submitVerifyPhoneNumber,
                    child: Text("Next", style: AppTheme.buttonText),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _openFilteredCountryPickerDialog() async {
    return await showDialog(
      context: context,
      builder: (_) => Theme(
        data: Theme.of(context).copyWith(
          primaryColor: primaryColor,
        ),
        child: CountryPickerDialog(
          titlePadding: const EdgeInsets.all(8),
          searchCursorColor: Colors.black,
          searchInputDecoration: const InputDecoration(
            hintText: "Search",
          ),
          isSearchable: true,
          title: const Text("Select your phone code"),
          onValuePicked: (Country country) {
            setState(() {
              _selectedFilteredDialogCountry = country;
              _countryCode = country.phoneCode;
            });
          },
          itemBuilder: _buildDialogItem,
        ),
      ),
    );
  }

  void _submitVerifyPhoneNumber() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            PhoneVerificationPage(phoneNumber: _phoneAuthController.text),
      ),
    );
  }
}

Widget _buildDialogItem(Country country) {
  return Container(
    height: 40,
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          width: 2,
          color: greenColor,
        ),
      ),
    ),
    child: Row(
      children: [
        CountryPickerUtils.getDefaultFlagImage(country),
        const SizedBox(width: 8),
        Text('+${country.phoneCode}'),
        const SizedBox(width: 8),
        Text(country.name.split(" ").first),
        const Spacer(),
        const Icon(Icons.arrow_drop_down)
      ],
    ),
  );
}
