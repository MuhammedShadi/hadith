import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadith/screens/hadithAudioScreen.dart';
import 'package:hadith/screens/hadith_screen.dart';
import 'package:hadith/utils/colorsApp.dart';
import 'package:hadith/utils/stringsApp.dart';

class HomeScreen extends StatelessWidget {
  Widget myCard(Color color1, Color color2, String path1, path2, Text text) {
    return Padding(
      padding: const EdgeInsets.only(top: 48, left: 20, right: 20),
      child: Container(
        height: 117,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(10, 10), blurRadius: 40)
          ],
          gradient: LinearGradient(colors: [color1, color2],begin: AlignmentDirectional.topEnd,end: AlignmentDirectional.bottomStart),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(path2),
            text,
            SvgPicture.asset(path1),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset("assets/svg/background.svg",width: double.infinity,fit: BoxFit.cover,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SvgPicture.asset("assets/svg/logo.svg"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: TextApp.primarySmallText,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: TextApp.headerScreenTwoText,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HadithScreen()));
                    },
                    child: myCard(
                        ColorApp.darkPrimary2Color,
                        ColorApp.primaryColor,
                        "assets/svg/one.svg",
                        "assets/quran.png",
                        TextApp.cardOne),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HadithAudioScreen()));
                    },
                    child: myCard(
                        ColorApp.redDarkColor,
                        ColorApp.yellowColor,
                        "assets/svg/twoo.svg",
                        "assets/play.png",
                        TextApp.cardThree),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HadithScreen()));
                    },
                    child: myCard(
                        ColorApp.redDarkColor,
                        ColorApp.redDark2Color,
                        "assets/svg/three.svg",
                        "assets/save-instagram.png",
                        TextApp.cardTwo),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
