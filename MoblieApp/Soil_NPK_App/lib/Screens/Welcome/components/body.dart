import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soil_npk_app/Screens/Home/Home_Screen.dart';
import 'package:soil_npk_app/Screens/SignUp/signup_screen.dart';
import 'package:soil_npk_app/Screens/Welcome/components/background.dart';
import 'package:soil_npk_app/components/rounded_button.dart';
import 'package:soil_npk_app/main_screen.dart';
import 'package:soil_npk_app/provider/google_sign_in.dart';
import '../../Login/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.12),
          const Text(
            "Soil Monitoring and NPK Checking System \n",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          RoundedButton(
            text: AppLocalizations.of(context)!.nL,
            press: () {
              buttonLogin(context);
            },
          ),
          RoundedButton(
            text: AppLocalizations.of(context)!.nS,
            press: () {
              buttonSignUp(context);
            },
          ),
          SizedBox(height: size.height * 0.01),
          const Text(
            "OR \n",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
              icon: FaIcon(FontAwesomeIcons.google),
              label: Text('Sign Up with Google'),
              onPressed: () async{
                final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
               await  provider.googleLogin();
                
                if(GoogleSignInProvider.userFound!=null){
                 MainScreen.pageIndex=0;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void buttonLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  void buttonSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      ),
    );
  }
}
