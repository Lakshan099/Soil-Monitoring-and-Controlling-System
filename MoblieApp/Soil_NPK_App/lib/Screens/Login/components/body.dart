import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soil_npk_app/Screens/Home/Home_Screen.dart';
import 'package:soil_npk_app/Screens/Login/components/background.dart';
import 'package:soil_npk_app/Screens/Notification/body.dart';
import 'package:soil_npk_app/Screens/SignUp/signup_screen.dart';
import 'package:soil_npk_app/components/rounded_button.dart';
import 'package:soil_npk_app/main_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:soil_npk_app/main_screen.dart';

import '../login_screen.dart';

class Body extends StatefulWidget {
  @override
  _StatefulWidgetDemoState createState() => _StatefulWidgetDemoState();
 
}

class _StatefulWidgetDemoState extends State<Body> {
  final fromKey = GlobalKey<FormState>();
  bool isHidePassword = true;

  

  TextEditingController uname = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Form(
        key: fromKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              ),
              Image.asset(
                "assets/images/Soil-Systems-Logo3.png",
                height: size.height * 0.23,
              ),
              TextFieldContainer(
                child: TextFormField(
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null,
                  controller: uname,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: const Color.fromARGB(255, 134, 166, 93),
                    ),
                    hintText: "Your Email",
                    //border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                  validator: (value) {
                    if (value != null && value.length < 7) {
                      return 'Enter min. 7 characters';
                    } else {
                      return null;
                    }
                  },
                  obscureText: isHidePassword,
                  controller: pass,
                  decoration: InputDecoration(
                    hintText: "Password",
                    icon: Icon(
                      Icons.lock,
                      color: const Color.fromARGB(255, 134, 166, 93),
                    ),
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        Icons.visibility,
                        color: const Color.fromARGB(255, 134, 166, 93),
                      ),
                    ),
                    //border: InputBorder.none,
                  ),
                ),
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  final isValidFrom = fromKey.currentState!.validate();
                  print("asd");
                  print(pass);

                  if (isValidFrom) {
                    checkuser(uname.text, pass.text, context);
                  }
                },
              ),
              AccountChk(
                press: () {
                  buttonSignUp(context);
                },
              ),
            ]),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }
}

void checkuser(String uname, String password, BuildContext context) async {
  bool exist = false;
  await FirebaseFirestore.instance
      .collection('User')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      print(doc["Email"]);
      print(doc["Password"]);

      if (uname == doc["Email"] && password == doc["Password"]) {
          LoginScreen.loggedcontat =  doc["Telephone"];
        exist = true;
      }
    });
  });

  if (exist == true) {
  
    MainScreen.pageIndex = 0;
    MainScreenTap(context);
    print("done");
  } else {
    print("error");
    showToast();
  }
}

void showToast() => Fluttertoast.showToast(
      msg: "Invalid Login",
      fontSize: 18,
    );

class AccountChk extends StatelessWidget {
  final bool login;
  final VoidCallback? press;
  const AccountChk({
    Key? key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an Account ? " : "Already have an Account ? ",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

void buttonSignUp(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => SignUpScreen(),
    ),
  );
}

void HomeScreenSignUp(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => HomeScreen(),
    ),
  );
}

void MainScreenTap(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => MainScreen(),
    ),
  );
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0.8),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
