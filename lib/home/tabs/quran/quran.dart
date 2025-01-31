import 'package:eslam_application/app_colors.dart';
import 'package:eslam_application/home/tabs/quran/soura_list_widget.dart';
import 'package:eslam_application/home/tabs/quran/sura_details_screen.dart';
import 'package:eslam_application/model/sura_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  void addSuraList() { //bamli beha al list ly hatt3rd
    for (int i = 0; i < 114; i++) {
      SuraModel.suraList.add(
        SuraModel(
          suraArabicName: SuraModel.suraArabicNameList[i],
          suraEnglishName: SuraModel.suraEnglishNameList[i],
          numOfVerses: SuraModel.numOfVersesList[i],
          fileName: '${i + 1}.txt',
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    addSuraList();

  }

  List<SuraModel> filterList = SuraModel.suraList;
  String searchText = ''; //search
  Map<String , String > lastSura={};//most recently

  @override
  Widget build(BuildContext context) {
    loadLastSura();
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/Logo.png'),
          TextField(
            style: const TextStyle(color: AppColours.whiteColour),
            onChanged: (text) {
              setState(() {
                searchText = text.toLowerCase();
                filterList = SuraModel.suraList.where((sura) {
                  return sura.suraArabicName.contains(searchText) ||
                      sura.suraEnglishName.toLowerCase().contains(searchText);
                }).toList();
              });
            },
            cursorColor: AppColours.whiteColour,
            decoration: InputDecoration(
              hintText: 'Sura Name',
              hintStyle: const TextStyle(color: AppColours.whiteColour),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: AppColours.primaryDark,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: AppColours.primaryDark,
                  width: 2,
                ),
              ),
              prefixIcon: const ImageIcon(
                color: AppColours.primaryDark,
                AssetImage('assets/images/search.png'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Most Recently',
            style: TextStyle(color: AppColours.whiteColour),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                SuraDetailsScreen.routename,
                  arguments: SuraModel(
                  suraArabicName: lastSura['suraArName'] ?? '',
                  suraEnglishName: lastSura['suraEnName'] ?? '',
                  numOfVerses: lastSura['numOfVerses'] ?? '',
                  fileName: '${SuraModel.suraList.indexWhere((sura) => sura.suraEnglishName == lastSura['suraEnName']) + 1}.txt',
                  ) );
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColours.primaryDark,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(lastSura['suraEnName']??'',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        lastSura['suraArName']??'',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${lastSura['numOfVerses']??''} Verses',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Image.asset('assets/images/most_recenty.png'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Suras List',
            style: TextStyle(color: AppColours.whiteColour),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColours.whiteColour,
                  thickness: 2,
                  indent: 30.5,
                  endIndent: 30.5,
                );
              },
              itemCount: filterList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    //save data to be used in most recently
                    saveLastSura(suraEnName: filterList[index].suraEnglishName,
                        suraArName: filterList[index].suraArabicName,
                        numOfVerses: filterList[index].numOfVerses);
                    Navigator.of(context).pushNamed(
                      SuraDetailsScreen.routename,
                      arguments: filterList[index],
                    );
                    //Future.delayed(Duration(seconds: 2),(){
                      //loadLastSura();
                    //});
                  },
                  child: SouraListWidget(
                    index: index,
                    suraModel: filterList[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //save data , write data
  Future<void>saveLastSura ({required String suraEnName,required String suraArName
    ,required String numOfVerses})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('suraEnName', suraEnName);
    await prefs.setString('suraArName', suraArName);
    await prefs.setString('numOfVerses', numOfVerses);
    //await loadLastSura();

  }
  //get data , read data
  Future <Map<String,String>> getLastSura()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String suraEnName = prefs.getString('suraEnName') ?? '';
    String suraArName = prefs.getString('suraArName') ?? '';
    String numOfVerses = prefs.getString('numOfVerses') ?? '';
    return {
      'suraEnName' : suraEnName,
      'suraArName' : suraArName,
      'numOfVerses' : numOfVerses

    };
  }
  loadLastSura() async {
    lastSura = await getLastSura();
    setState(() {

    });
  }
}
