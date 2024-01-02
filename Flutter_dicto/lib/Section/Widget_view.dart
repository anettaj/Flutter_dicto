import 'package:flutter/material.dart';
import 'package:flutter_dicto/Section/Image/Image1.dart';
import 'package:flutter_dicto/Section/Image/Image2.dart';
import 'package:flutter_dicto/Section/Widget/Color/Color.dart';
import 'package:flutter_dicto/Section/Widget/ExpansionText/Expansion_card.dart';
import 'package:flutter_dicto/Section/Widget/Grid/Grid_count.dart';
import 'package:flutter_dicto/Section/Widget/ListTile/List_view_listtile.dart';
import 'package:flutter_dicto/Section/Package/Scartcher.dart';
import 'package:flutter_dicto/Section/Widget/Tab/Tab.dart';
import 'package:flutter_dicto/Widgets/Size.dart';
import 'package:flutter_dicto/main.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class Widget_card extends StatelessWidget {
  Widget_card({Key? key}) : super(key: key);

  final List<Widget> WidgetCard = <Widget>[
    WidgetCards(
      color: Color(0xFFffd22b),
      title: "Colour",
      link: Color_view(),
      image: 'assets/Widget_img/Colorhex.jpeg',
    ),
    WidgetCards(
      color: Color(0xFFfeb204),
      title: "Gird",
      link: Grid_count(),
      image: 'assets/Widget_img/Grid.jpeg',
    ),
    WidgetCards(
      color: Color(0xFFff8503),
      title: "Expansion Text",
      link: Expansion_card(),
      image: 'assets/Widget_img/Expan1.jpeg',
    ),
    WidgetCards(
      color: Color(0xFFd53600),
      title: "Tab",
      link: Tab_view1(),
      image: 'assets/Widget_img/Tab.jpeg',
    ),
    WidgetCards(
      color: Color(0xFFd53600),
      title: "ListTile",
      link: List1(),
      image: 'assets/Widget_img/ListTile.jpeg',
    ),
    // WidgetCards(
    //   color: Color(0xFF7e261a),
    //   title: "Scratcher",
    //   link: ScratcherCard(),
    //   image: 'assets/images/image1.gif',
    // ),
    // ImageCards(
    //   color: Color(0xFF7e261a),
    //   title: "Play with your cat!",
    //   link: () => Image2(),
    //   image: 'assets/images/image1.gif',
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    double H = ScreenSize.Height(context);
    double W = ScreenSize.Height(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC69749),
        title: Text(
          'Widget viwer',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
                (route) => false);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        children: WidgetCard,
      ),
    );
  }
}

class WidgetCards extends StatelessWidget {
  const WidgetCards({
    Key? key,
    required this.color,
    required this.title,
    required this.link,
    required this.image,
  }) : super(key: key);

  final String title;
  final Widget link;
  final Color color;
  final String image;

  @override
  Widget build(BuildContext context) {
    double H = ScreenSize.Height(context);
    double W = ScreenSize.Height(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => link,
            ),
            (route) => false /* No Back option */,
          );
        },
        child: Stack(
          children: <Widget>[
            Container(
              alignment: AlignmentDirectional.center,
              color: color,
              height: H / 3,
              width: W,
              child: Image.asset(
                '$image',
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
                child: Container(
              color: Colors.black45,
              child: Center(
                child: Text(
                  '$title',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
