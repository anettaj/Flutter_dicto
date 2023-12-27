import 'package:flutter_dicto/Section/Api_view.dart';
import 'package:flutter_dicto/Section/Form_view.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import 'package:flutter_dicto/Section/Pdf/Pdf_viewer.dart';
import 'package:flutter_dicto/Section/Image_view.dart';
import 'package:flutter_dicto/Section/Menu_view.dart';
import 'package:flutter_dicto/Widgets/Size.dart';
import 'package:flutter/material.dart';
import 'Section/WebView/WebView.dart';
import 'Section/Widget_view.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dictionary',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Color(0xFF2C3333),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);


  final List<Widget> fancyCards = <Widget>[
    FancyCard(
      title: "Image View",
      link: Image_view(),
    ),
    FancyCard(
      title: "Menu view",
      link:Menu_view(),
    ),
    FancyCard(
      title: "Widget view",
      link: Widget_card(),
    ),
    FancyCard(
      title: "API view",
      link:  Api_view(),
    ),
    FancyCard(
      title: "Contact view",
      link: Form_view(),
    ),
    FancyCard(
      title: "Web view",
      link: WebViewExample(),
    ),
    FancyCard(
      title: "PDF Viewer",
      link: Pdf_viewer(),
    ),
    // FancyCard(
    //   title: "ExpansionTile",
    //   link: Expansion_card(),
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    double H= ScreenSize.Height(context);
    double W= ScreenSize.Height(context);    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC69749),
        title: Text(
          'Flutter Dicto'
        ),
      ),
      body: StackedCardCarousel(
        items: fancyCards,
      ),
    );
  }
}

class FancyCard extends StatelessWidget {
  const FancyCard({
    Key? key,
    required this.title,
    required this.link,
  }) : super(key: key);

  final String title;
  final Widget  link;


  @override
  Widget build(BuildContext context) {
    double H = MediaQuery.of(context).size.height;
    double W = MediaQuery.of(context).size.width;
    return Container(

      margin: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => link,
          ));
        },
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/Folder.png',
              fit: BoxFit.fill,
              height: H * 0.4,
            ),
            Positioned(
              top: H / 8,
              left: H / 7,
              right: H / 8,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
