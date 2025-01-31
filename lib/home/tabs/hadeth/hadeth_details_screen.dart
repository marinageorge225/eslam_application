import 'package:eslam_application/home/tabs/hadeth/hadeth_model.dart';
import 'package:flutter/material.dart';

import '../../../app_colors.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routename='HadethDetails';

  @override
  Widget build(BuildContext context) {
    var args= ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/images/Soura Details Screen.png',
            width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
          Column(
            children: [
              SizedBox(height: 30,),
              Text(args.title,style: TextStyle(color: AppColours.primaryDark,fontSize: 25),),
              SizedBox(height: 50,),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) { //index dh rakm l item ly gowa al list
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(args.content[index],style: TextStyle(color: AppColours.primaryDark,fontSize: 18),),
                    );
                  },
                  itemCount: args.content.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
