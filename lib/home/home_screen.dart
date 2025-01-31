import 'package:eslam_application/app_colors.dart';
import 'package:eslam_application/home/tabs/hadeth/hadeth.dart';
import 'package:eslam_application/home/tabs/quran/quran.dart';
import 'package:eslam_application/home/tabs/radio/radio.dart';
import 'package:eslam_application/home/tabs/sebha/sebha.dart';
import 'package:eslam_application/home/tabs/time/time.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0 ;
  List<String> backgroundImages = [
    'assets/images/quran_bg.png',
    'assets/images/hadeth_bg.png',
    'assets/images/sebha_bg.png',
    'assets/images/radio_bg.png',
    'assets/images/time_bg.png',
  ];
  List<Widget>tabs=[
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(backgroundImages[selectedIndex],width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,),
        Scaffold(
         bottomNavigationBar: Theme(
           data: Theme.of(context).copyWith(
             canvasColor: AppColours.primaryDark
           ), // bygeb l theme bta3 al application lek
           child: BottomNavigationBar(
             currentIndex:selectedIndex ,
               onTap: (index){
               selectedIndex=index;
               setState(() {
               });
             },
               items: [
                 BottomNavigationBarItem(icon: builtItemInButtonNavBar(index: 0, imageName: 'icon_quran'), label:'Quran'),
                 BottomNavigationBarItem(icon: builtItemInButtonNavBar(index: 1, imageName: 'icon_hadeth'), label:'Hadeth'),
                 BottomNavigationBarItem(icon: builtItemInButtonNavBar(index: 2, imageName: 'icon_sebha'), label:'Sebha'),
                 BottomNavigationBarItem(icon: builtItemInButtonNavBar(index: 3, imageName: 'icon_radio'), label:'Radio'),
                 BottomNavigationBarItem(icon: builtItemInButtonNavBar(index: 4, imageName: 'icon_time'), label:'Time'),


           ]),
         ),
          body: tabs[selectedIndex],
        ),

      ],
    );
  }
  Widget builtItemInButtonNavBar({required int index,required String imageName}){
    return selectedIndex == index ?
    Container(
        padding: EdgeInsets.symmetric(vertical: 6,horizontal: 20),
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color:AppColours.blackBgColor,
        ),
        child: ImageIcon(AssetImage('assets/images/$imageName.png'))
    )
        :
    ImageIcon(AssetImage('assets/images/$imageName.png'),);



  }
}
