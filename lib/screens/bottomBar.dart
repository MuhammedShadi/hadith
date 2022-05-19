import 'package:flutter/material.dart';
import 'package:hadith/models/Hadith.dart';
import 'package:hadith/networking/networkPage.dart';
import 'package:hadith/screens/localAudio.dart';
import 'package:hadith/utils/colorsApp.dart';
import 'package:share_plus/share_plus.dart';

class HomeHadithContent extends StatefulWidget {
  Hadith hadith;

  HomeHadithContent({required this.hadith});

  @override
  State<HomeHadithContent> createState() => _HomeHadithContentState();
}

class _HomeHadithContentState extends State<HomeHadithContent> {
  bool methodCheck = true;
  bool isClicked = false;
  int selectedIndex = 0;

  String text = "";

  @override
  void initState() {
    text = widget.hadith.textHadith!;
    super.initState();
  }

  updateTabSection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
    });
    text = buttonText + "\n";
  }

  Widget getHadithContentWidget(bool bol) {
    if (bol) {
      return NetworkingPage(data: text, hadith: widget.hadith, hadithName: widget.hadith.nameHadith!,hadithNumber: widget.hadith.key!,);
    } else {
      return LocalAudio(localAudioPath: 'audio/'+widget.hadith.audioHadith!, hadith: widget.hadith);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          getHadithContentWidget(methodCheck),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isClicked = !isClicked;
          });
          Share.share(text, subject: widget.hadith.textHadith);
        },
        child: Icon(Icons.share),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        color: ColorApp.primaryColor,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 60,
          margin: const EdgeInsets.only(
            left: 12.0,
            right: 12.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  isClicked = true;
                  updateTabSection(0, widget.hadith.textHadith!);
                },
                icon: const Icon(Icons.book),
                iconSize: 27.0,
                color: selectedIndex == 0 ? Colors.yellow : Colors.white,
              ),
              IconButton(
                onPressed: () {
                  isClicked = true;
                  updateTabSection(1, widget.hadith.explanationHadith!);
                },
                icon: const Icon(Icons.library_books),
                iconSize: 27.0,
                color: selectedIndex == 1 ? Colors.yellow : Colors.white,
              ),
              const SizedBox(width: 30.0,),
              IconButton(
                onPressed: () {
                  isClicked = true;
                  updateTabSection(2, widget.hadith.translateNarrator!);
                },
                icon: const Icon(Icons.collections_bookmark),
                iconSize: 27.0,
                color: selectedIndex == 2 ? Colors.yellow : Colors.white,
              ),
              IconButton(
                onPressed: () {
                  isClicked = false;
                  updateTabSection(3, widget.hadith.key! + "\n" + widget.hadith.nameHadith!);
                },
                icon: const Icon(Icons.volume_up),
                iconSize: 27.0,
                color: selectedIndex == 3 ? Colors.yellow : Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
