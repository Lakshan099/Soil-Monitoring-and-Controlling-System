import 'package:flutter/material.dart';
import 'package:soil_npk_app/Screens/Home/Home_Screen.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: Image.asset(
                "assets/images/h1.png",
                width: size.width * 0.9,
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 370),
              child: Container(
                width: 330,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black54,
                      width: 5.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black87,
                ),
              ),
            ),
          ]),
          child,
        ],
      ),
    );
  }
}
