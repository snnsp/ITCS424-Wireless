import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'page/map.dart';
import 'page/FindLocation.dart';
import 'page/FindDistance.dart';
import 'page/aboutus.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Homepage',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  Widget _GoMap(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        child: const Text('Go to Google Map function'),
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(type: PageTransitionType.leftToRight, child: map()),
          );
        },
      ),
    );
  }

  Widget _GoFindMe(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        child: const Text('Go to Find me function'),
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.bottomToTop, child: FindMe()));
        },
      ),
    );
  }

  Widget _GoFindDistance(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        child: const Text('Go Find Distance function'),
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft, child: FindDistance()));
        },
      ),
    );
  }

  Widget _GoAboutUs(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        child: const Text('About Us'),
        onPressed: () {
          Navigator.push(context,
              PageTransition(type: PageTransitionType.fade, child: AboutUs()));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final logoImage = Image.asset(
      'images/where.png',
      fit: BoxFit.cover,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              logoImage,
              const Text('WHERE Application'),
              _GoMap(context),
              _GoFindMe(context),
              _GoFindDistance(context),
              _GoAboutUs(context),
            ]),
      ),
    );
  }
}
