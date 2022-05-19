import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/hadith_screen.dart';
import '../utils/colorsApp.dart';
import '../utils/stringsApp.dart';


class NetworkingPageContent extends StatefulWidget {
  final String data;
  final String hadithName;
  final String hadithKey;
  NetworkingPageContent({required this.data, required this.hadithName, required this.hadithKey});

  @override
  _NetworkingPageContentState createState() => _NetworkingPageContentState();
}

class _NetworkingPageContentState extends State<NetworkingPageContent> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(""),
                  SvgPicture.asset("assets/svg/logo.svg"),
                  GestureDetector( onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HadithScreen()));
                  },child: SvgPicture.asset("assets/svg/arrow-right.svg")),
                ],
              ),
              SizedBox(height: 20,),
              Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(widget.hadithKey,style: GoogleFonts.tajawal(fontSize: 20,color: ColorApp.yellowColor,fontWeight: FontWeight.bold),),
                  Text(widget.hadithName,style: GoogleFonts.tajawal(fontSize: 30,color: ColorApp.primaryColor,fontWeight: FontWeight.bold)),

                ],
              ),
            ],
          ),
          _convertHadith(context, widget.data),
        ],
      ),
    );
  }
}

Padding _convertHadith(BuildContext context, String text) {
  text = text.replaceAll('(', '{');
  text = text.replaceAll(')', '}');

  List<String> split = text.split(RegExp("{"));

  List<String> hadithContent = split.getRange(1, split.length).fold([], (t, e) {
    var texts = e.split("}");

    if (texts.length > 1) {
      return List.from(t)
        ..addAll(
            ["{${texts.first}}", (e.substring(texts.first.length + 1))]);
    }
    return List.from(t)..add("{${texts.first}");
  });

  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: GoogleFonts.tajawal(color: ColorApp.yellowColor,fontSize: 22),
        children: [TextSpan(text: split.first)]..addAll(hadithContent
            .map((text) => text.contains("{")
            ? TextSpan(text: text, style: GoogleFonts.tajawal(color: ColorApp.primaryColor,fontWeight: FontWeight.bold,))
            : TextSpan(text: text))
            .toList()),
      ),
      textDirection: TextDirection.rtl,
    ),
  );
}