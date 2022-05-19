import 'package:flutter/material.dart';
import '../models/Hadith.dart';
import 'networkingPageContent.dart';


class NetworkingPage extends StatelessWidget {

  final Hadith hadith;
  final String data;
  final String hadithName;
  final String hadithNumber;
  NetworkingPage( {required this.hadith,required this.data, required this.hadithName, required this.hadithNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          NetworkingPageContent(data: data, hadithKey: hadithNumber, hadithName: hadithName,),
        ],
      ),

    );
  }
}