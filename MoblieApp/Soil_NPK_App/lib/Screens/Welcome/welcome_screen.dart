import 'package:flutter/material.dart';
import 'package:soil_npk_app/Screens/Welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      body: Body(),
    );
  }
}