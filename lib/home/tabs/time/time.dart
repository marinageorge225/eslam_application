import 'package:eslam_application/app_colors.dart';
import 'package:flutter/material.dart';

class TimeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/images/Logo.png',
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xFFE7CFA1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "16 Jul, 2024",
                      style: TextStyle(
                        color: AppColours.blackColour,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "09 Muh., 1446",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pray Time",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Tuesday",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PrayerTimeCard(time: "04:04 AM", name: "Fajr"),
                        PrayerTimeCard(time: "01:01 PM", name: "Dhuhr"),
                        PrayerTimeCard(time: "04:38 PM", name: "Asr"),
                        PrayerTimeCard(time: "07:57 PM", name: "Maghrib"),
                        PrayerTimeCard(time: "09:04 PM", name: "Isha"),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Next Pray: 02:32",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Azkar',style: TextStyle(
                color: AppColours.whiteColour,
                fontSize: 20
              ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.symmetric(horizontal:5),
            child: Row(
              children: [
                Image.asset('assets/images/azkar_evening.png'),
                SizedBox(width: 10,),
                Image.asset('assets/images/azkar_morning.png'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PrayerTimeCard extends StatelessWidget {
  final String time;
  final String name;

  PrayerTimeCard({required this.time, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          time,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
