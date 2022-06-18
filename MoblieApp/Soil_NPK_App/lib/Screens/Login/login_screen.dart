import 'package:flutter/material.dart';
import 'package:soil_npk_app/Screens/Login/components/body.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class LoginScreen extends StatelessWidget {
  static String? loggedcontat;
  static TwilioFlutter twilioFlutter = new TwilioFlutter(
      accountSid: "",
      authToken: "",
      twilioNumber: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Body()),
    );
  }
}
