// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:soil_npk_app/constants.dart';

class proSqButton extends StatelessWidget {
  final String text;
  final VoidCallback? press;
  final Color color, textColor;
  const proSqButton({
    Key? key,
    required this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: sized_box_for_whitespace
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.40,
      height: size.height * 0.06,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FlatButton(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          color: Color.fromARGB(255, 73, 69, 69).withOpacity(0.85),
          onPressed: press,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromARGB(255, 250, 250, 250),
            ),
          ),
        ),
      ),
    );
  }
}
