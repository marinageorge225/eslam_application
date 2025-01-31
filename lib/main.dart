import 'package:eslam_application/home/home_screen.dart';
import 'package:eslam_application/home/tabs/quran/sura_details_screen.dart';
import 'package:eslam_application/splash_screen.dart';
import 'package:flutter/material.dart';
import 'home/tabs/hadeth/hadeth_details_screen.dart';
import 'my_theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute:SplashScreen.routename ,
      routes:{
        SplashScreen.routename:(context)=>SplashScreen(),
        HomeScreen.routename:(context)=>HomeScreen(),
        SuraDetailsScreen.routename:(context)=>SuraDetailsScreen(),
        HadethDetailsScreen.routename:(context)=>HadethDetailsScreen(),

      } ,
    );
  }
}

