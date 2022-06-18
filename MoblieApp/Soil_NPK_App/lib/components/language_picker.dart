import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soil_npk_app/components/locale_provider.dart';
import 'package:soil_npk_app/l10n/l10n.dart';
import 'package:provider/provider.dart';

class LanguageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final flag = L10n.getFlag(locale.languageCode);

    return Center(
      child: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 134, 166, 93),
        radius: 72,
        child: Text(
          flag,
          style:
              TextStyle(fontSize: 80, color: Color.fromARGB(255, 134, 166, 93)),
        ),
      ),
    );
  }
}

class LanguagePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale ?? Locale('en');

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: locale,
        icon: Container(width: 12),
        items: L10n.all.map(
          (locale) {
            final flag = L10n.getFlag(locale.languageCode);

            return DropdownMenuItem(
              child: Center(
                child: Text(
                  flag,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              value: locale,
              onTap: () {
                print(locale);
                
                  final provider = Provider.of<LocaleProvider>(context,listen: false);
                
                provider.setLocale(locale);
              
               
             print( Localizations.localeOf(context));
              },
            );
          },
        ).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
