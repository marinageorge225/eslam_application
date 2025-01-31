import 'package:eslam_application/app_colors.dart';
import 'package:eslam_application/home/tabs/radio/radio_tab.dart';
import 'package:flutter/material.dart';

class RadioTab extends StatefulWidget {
  @override
  _RadioTabState createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/Logo.png'),
        Row(
          children: [
            _buildTab('Radio', 0),
            _buildTab('Reciters', 1),
          ],
        ),
        // Content Based on Selected Tab
        Expanded(
          child: selectedIndex == 0
              ? RadiooTab(names: [
            'Radio Ibrahim Al-Akdar',
            'Radio Akram Alalaqmi',
            'Radio Majed Al-Enezi',
            'Radio Malik shaibat Alhamed'
          ],)
              :
          RadiooTab(names: [
            'Ibrahim Al-Akdar',
            'Akram Alalaqmi',
            'Majed Al-Enezi',
            'Malik shaibat Alhamed'
    ],)
    ),
      ],
    );
  }

  Widget _buildTab(String title, int index) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: selectedIndex == index
                ? AppColours.primaryDark
                : Colors.transparent,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: AppColours.whiteColour,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
