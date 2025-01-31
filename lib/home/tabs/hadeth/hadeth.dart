
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eslam_application/app_colors.dart';
import 'package:eslam_application/home/tabs/hadeth/hadeth_details_screen.dart';
import 'package:eslam_application/home/tabs/hadeth/hadeth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> hadethList=[];

  @override
  Widget build(BuildContext context) {
    if(hadethList.isEmpty){
      loadHadethFiles();
    }
    return Container(
      child: Column(
        children:[
          Image.asset('assets/images/Logo.png'),
          CarouselSlider.builder(
          options: CarouselOptions(
            height: 550,
            viewportFraction: 0.75,
            enlargeCenterPage: true,
            enableInfiniteScroll: false
          ),
          itemCount: hadethList.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => //itemIndex dh rakm l item aly byt3arad gowa al list
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(HadethDetailsScreen.routename,
                  arguments: hadethList[itemIndex]);
                },
                child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: AppColours.primaryDark,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                        image: AssetImage('assets/images/hadethbgcontainer.png')),
                  ),
                  child:hadethList.isEmpty ?
                      Center(
                        child: CircularProgressIndicator(
                          color: AppColours.primaryDark,

                        ),
                      )
                      :
                  Column(
                    children: [
                      Text(hadethList[itemIndex].title,style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),),
                      Expanded(child: Text(hadethList[itemIndex].content.join('')  //join dy btrag3 string bt3ml concatenation lel list of tring w btrg3hom string wahed bs
                        ,style: TextStyle(
                          fontSize: 18

                      ),))
                    ],
                  ),

                ),
              ),

        ),
    ]
      )

    );
  }

  void loadHadethFiles()async{
    for(int i =1;i<=50;i++){
      String hadethContent =await rootBundle.loadString('assets/files/h$i.txt');
      List<String> hadethLines= hadethContent.split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethModel hadethModel=HadethModel(title: title,
          content: hadethLines);
      hadethList.add(hadethModel);
      setState(() {

      });

    }
  }
}
