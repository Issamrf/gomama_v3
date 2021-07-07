import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gomama_v2/services/ServiceRoot.dart';
import 'states/CurrentUser.dart';
import 'package:provider/provider.dart';


Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomePage());
}

//TODO Profile bild
//TODO Geburtstag fertig machen für weitere jahre in Firebase speicher ??
//TODO Chat bereich erstellen -.-
//TODO Firebase mit IOS verbinden Issam
//TODO Design optimieren (zusammen)

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('de', 'DE'), // English, no country code
        ],
        locale: Locale('de'),
        debugShowCheckedModeBanner: false,
        home: ServiceRoot(),
        //PageStartScreen(),
      ),
    );
  }
}
