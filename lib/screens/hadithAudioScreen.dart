import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadith/screens/home_screen.dart';

import '../db/newDatabase.dart';
import '../models/Hadith.dart';
import '../utils/colorsApp.dart';
import '../utils/stringsApp.dart';
import 'localAudio.dart';

class HadithAudioScreen extends StatefulWidget {
  const HadithAudioScreen({Key? key}) : super(key: key);

  @override
  State<HadithAudioScreen> createState() => _HadithAudioScreenState();
}

class _HadithAudioScreenState extends State<HadithAudioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/svg/background.svg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    const SizedBox(height: 45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(""),
                        SvgPicture.asset("assets/svg/logo.svg"),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => HomeScreen()));
                            },
                            child:
                                SvgPicture.asset("assets/svg/arrow-right.svg")),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextApp.cardThree2,
                      ],
                    ),
                  ],
                ),
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/svg/background.svg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                FutureBuilder(
                  builder: (ctx, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 300,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20),
                        itemBuilder: (ctx, int index) {
                          Hadith hadithItem = snapshot.data[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => LocalAudio(
                                          hadith: hadithItem,
                                          localAudioPath: 'audio/' +
                                              hadithItem.audioHadith!,
                                        )));
                              },
                              child:
                                  ayah(hadithItem.key, hadithItem.nameHadith));
                        },
                        itemCount: snapshot.data.length,
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                  future: Mydata.getAlldata(),
                ),
              ],
            ),
            flex: 3,
          )
        ],
      ),
    );
  }

  Widget ayah(String? key, name) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/img.png"),
        SvgPicture.asset("assets/svg/grey.svg"),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 80,
              child: Text(
                key!,
                textAlign: TextAlign.center,
                style: GoogleFonts.tajawal(
                    textStyle: const TextStyle(
                        fontSize: 12, color: ColorApp.yellowColor)),
              ),
            ),
            SizedBox(
              width: 80,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: GoogleFonts.tajawal(
                    textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: ColorApp.yellowColor)),
                textScaleFactor: .5,
              ),
            ),
          ],
        )
      ],
    );
  }
}
