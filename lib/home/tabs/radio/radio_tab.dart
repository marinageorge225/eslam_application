import 'package:flutter/material.dart';
import '../../../app_colors.dart';

class RadiooTab extends StatelessWidget {
  List<String> names;
  RadiooTab({required this.names});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 25),
            height: 141,
            width: 390,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColours.primaryDark,
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/radio_container_bg.png',
                    fit: BoxFit.fitWidth,
                    height: 80,
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 90,
                  child: Text(names[index]
                  ,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:18
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/radio_heart.png'),
                      Image.asset('assets/images/radio_play.png'),
                      Image.asset('assets/images/radio_sound.png'),
                    ],
                  ),
                ),

              ],
            ),
          );
        },
        itemCount: 4,
      ),
    );
  }
}
