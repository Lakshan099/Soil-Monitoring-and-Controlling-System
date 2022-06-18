import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:soil_npk_app/NewsFeed/RSSDemo.dart';
import 'package:soil_npk_app/NewsList/newslist.dart';
import 'package:soil_npk_app/NewsRSS/UI/screenArticleList/screen_article_list.dart';
import 'package:soil_npk_app/Screens/FAQ/FAQ_screen.dart';
import 'package:soil_npk_app/Screens/HTemp/HT_screen.dart';
import 'package:soil_npk_app/Screens/Home/Home_Screen.dart';
import 'package:soil_npk_app/Screens/Q&A/Q&A_screen.dart';
import 'package:soil_npk_app/Screens/Setting/setting_screen.dart';
import 'package:soil_npk_app/Screens/SoilM/soilM_screen.dart';
import 'package:soil_npk_app/Screens/SoilNPK/soilNPK_screen.dart';
import 'package:soil_npk_app/Screens/Welcome/welcome_screen.dart';
import 'package:soil_npk_app/components/language_picker.dart';
import 'package:soil_npk_app/main_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:soil_npk_app/provider/google_sign_in.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Soil NPK APP',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
            accountEmail: const Text(
              'Welcome',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/images/Soil-Systems-Logo.png",
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: const NetworkImage(
                    'https://www.dahu.bio/images/photos/agriculture/agriculture-conventionnelle-traitement.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(
              AppLocalizations.of(context)!.home,
            ),
            onTap: () {
              HomeScreenSignUp(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_answer),
            title: Text(
              AppLocalizations.of(context)!.qA,
            ),
            onTap: () {
              QandAScreenIn(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: Text(
              AppLocalizations.of(context)!.fq,
            ),
            onTap: () {
              FAQScreenIn(context);
            },
          ),
          ListTile(
              leading: const Icon(Icons.language),
              title: LanguagePickerWidget(),
              ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              AppLocalizations.of(context)!.setting,
            ),
            onTap: () {
              SettingScreenTap(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(
              AppLocalizations.of(context)!.sout,
            ),
            onTap: () {
              SingOutScreen(context);
            },
          ),
        ],
      ),
    );
  }
}

void HomeScreenSignUp(BuildContext context) {
  MainScreen.pageIndex = 0;
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MainScreen(),
    ),
  );
}

void QandAScreenIn(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => QandAScreen(),
    ),
  );
}

void FAQScreenIn(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => FAQScreen(),
    ),
  );
}

void soilM(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => soilMScreen(),
    ),
  );
}

void SingOutScreen(BuildContext context) {
 GoogleSignInProvider google = new GoogleSignInProvider();
 GoogleSignIn().disconnect();
 FirebaseAuth.instance.signOut();
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => const WelcomeScreen(),
    ),(Route<dynamic> route)=>false,
  );
}

void SettingScreenTap(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SettingScreen(),
    ),
  );
}

void lang(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LanguagePickerWidget(),
    ),
  );
}

void RSS(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ListViewPage(),
    ),
  );
}
