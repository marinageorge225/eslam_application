import 'package:eslam_application/app_colors.dart';
import 'package:eslam_application/model/sura_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SouraListWidget extends StatelessWidget { //ely btrsm l sura list ly fl quran
  SuraModel suraModel;
  int index;
  SouraListWidget({required this.suraModel,required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/Vector.png'),
            Text('${index+1}',
            style: TextStyle(
              color: AppColours.whiteColour,
              fontSize: 15
            ),
            ),

          ],
        ),
        SizedBox(width: 24,),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(suraModel.suraEnglishName,
                  style: TextStyle(
                      color: AppColours.whiteColour,
                      fontSize: 15
                  ),),
                  Text('${suraModel.numOfVerses} Verses',
                    style: TextStyle(
                        color: AppColours.whiteColour,
                        fontSize: 15
                    ),),
                ],
              ),
              Text(suraModel.suraArabicName,
                style: TextStyle(
                    color: AppColours.whiteColour,
                    fontSize: 15
                ),),
            ],
          ),
        ),

      ],
    );
  }
}
