import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hadith/screens/hadithAudioScreen.dart';
import 'package:hadith/screens/hadith_screen.dart';
import 'package:hadith/utils/colorsApp.dart';
import '../models/Hadith.dart';
import '../utils/stringsApp.dart';

class LocalAudio extends StatefulWidget {
  final Hadith hadith;
  final String localAudioPath;
  LocalAudio({required this.localAudioPath, required this.hadith});

  @override
  _LocalAudio createState() =>  _LocalAudio();
}

class _LocalAudio extends State<LocalAudio> {
  Duration _duration = const Duration();
  Duration _position = const Duration();

  static final AudioPlayer  advancedPlayer = AudioPlayer();
  final AudioCache  audioCache = AudioCache(fixedPlayer: advancedPlayer);

  @override
  void initState() {
    super.initState();
     initPlayer();
  }
  void initPlayer() {

    advancedPlayer.onDurationChanged. listen((Duration duration) {
     setState(() {
       _duration = duration;
     });
    });advancedPlayer.onAudioPositionChanged. listen((Duration duration) {
     setState(() {
       _position = duration;
     });
    });
  }

  String? localFilePath;

  Widget _tab(List<Widget> children) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Icon(Icons.add_shopping_cart,color:Colors.cyan,size: 250),

        slider(),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: children
                .map((w) => Container(child: w, padding: const EdgeInsets.all(6.0)))
                .toList(),
          ),
        ),
      ],
    );
  }

  //// test
  VoidCallback? onPressedPlypus(){
    bool bol=true;
    if(bol){
      audioCache.play("path");
      _btn(const Icon(Icons.play_arrow), () => advancedPlayer.pause());
    }
    return null;

  }
  Widget _btn(Icon icon, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 50.0,
      child: SizedBox(
        width: 70,
        height: 50,
        child: MaterialButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: icon,
            color: Colors.black45,
            textColor: ColorApp.yellowColor,
            onPressed: onPressed),
      ),
    );
  }

  Widget slider() {
    return Slider(
        activeColor:ColorApp.yellowColor,
        inactiveColor: ColorApp.primaryColor,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  Widget localAudio( String path) {

    return _tab([
      _btn(const Icon(Icons.play_arrow), () => audioCache.play(path)),
      _btn(const Icon(Icons.pause), () => advancedPlayer.pause()),
      _btn(const Icon(Icons.stop), () => advancedPlayer.stop()),
    ]);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body:Column(
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
                  const SizedBox(height: 85),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(""),
                      SvgPicture.asset("assets/svg/logo.svg"),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) =>HadithAudioScreen ()));
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
              Container(
                decoration: const BoxDecoration(
                  // assets/ryan.jpg
                  image: DecorationImage(image: AssetImage("assets/aa.jpg"), fit: BoxFit.contain,),
                ),
                child: localAudio(widget.localAudioPath),
              )
            ],
          ),
          flex: 3 ,
        )
      ],
    ),) ;
  }

}