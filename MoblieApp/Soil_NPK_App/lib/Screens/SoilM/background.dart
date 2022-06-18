import 'package:flutter/material.dart';

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
        alignment: Alignment.topCenter,
        children: <Widget>[
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Container(
                width: 300,
                height: 120,
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
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 80),
              child: Image.asset(
                "assets/images/meter.png",
                height: size.height * 0.2,
                width: size.width * 0.2,
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 300),
              child: Container(
                width: 200,
                height: 200,
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
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 330),
              child: Text(
                "Moisturizing",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ]),
          child,
        ],
      ),
    );
  }
}
