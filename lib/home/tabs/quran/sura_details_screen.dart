import 'package:eslam_application/app_colors.dart';
import 'package:eslam_application/home/tabs/quran/sura_content_item.dart';
import 'package:eslam_application/model/sura_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routename='SuraDetails';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String>verses=[];

  @override
  Widget build(BuildContext context) {
    var args =ModalRoute.of(context)?.settings.arguments as SuraModel;
    if(verses.isEmpty){
      LoadSuraFile(args.fileName);
    };
    return Scaffold(

      appBar: AppBar(
        title: Text(args.suraEnglishName,style: TextStyle(
          color: AppColours.primaryDark
        ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/images/Soura Details Screen.png',
            width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
          Column(
            children: [
              SizedBox(height: 30,),
              Text(args.suraArabicName,style: TextStyle(color: AppColours.primaryDark,fontSize: 25),),
              SizedBox(height: 50,),
              Expanded(
                child: verses.isEmpty ?
                    Center(child: CircularProgressIndicator(color: AppColours.primaryDark,),)
                :
                ListView.builder(
                    itemBuilder: (context, index) { //index dh rakm l item ly gowa al list
                      return SuraContentItem(content: verses[index],index: index,);
                    },
                  itemCount: verses.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void LoadSuraFile(String fileName)async{
   String suraContent= await rootBundle.loadString('assets/files/$fileName');
   List <String> suraLines = suraContent.split('\n');
   for(int i =0 ; i<suraLines.length;i++){
     if(suraLines[i]!=""){
       verses.add(suraLines[i]);
     }
   }
   setState(() {

   });

  }
}
