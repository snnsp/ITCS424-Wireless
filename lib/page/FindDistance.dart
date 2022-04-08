import 'dart:math' as math;
import 'package:flutter/material.dart';

class FindDistance extends StatefulWidget {
  const FindDistance({Key? key}) : super(key: key);

  @override
  State<FindDistance> createState() => FindDistanceState();
}

class FindDistanceState extends State<FindDistance> {
  double first_lat = 0;
  double first_long = 0;
  double second_lat = 0;
  double second_long = 0;
  String answer = "";
  final GlobalKey<FormState> formKey = GlobalKey();

  void calculate() {
    // Haversine formula
    double earth_radius = 6371;
    double lat_diff = (second_lat - first_lat) * (math.pi / 180);
    double long_diff = (second_long - first_long) * (math.pi / 180);
    double a = math.sin(lat_diff / 2) * math.sin(lat_diff / 2) +
        math.cos(first_lat * (math.pi / 180)) *
            math.cos(second_lat * (math.pi / 180)) *
            math.sin(long_diff / 2) *
            math.sin(long_diff / 2);
    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    double distance = earth_radius * c;
    setState(() {
      answer = "The distance between two point is ${distance}";
    });
  }

  Widget build_back_button(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('Go back!'),
    );
  }

  Widget build_text_box(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Enter your First Latitude'),
                  onFieldSubmitted: (value) {
                    setState(() {
                      first_lat = double.parse(value);
                    });
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Enter your First Longtitude'),
                  onFieldSubmitted: (value) {
                    setState(() {
                      first_long = double.parse(value);
                    });
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Enter your Second Latitude'),
                  onFieldSubmitted: (value) {
                    setState(() {
                      second_lat = double.parse(value);
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Enter your Second Longtitude'),
                  onFieldSubmitted: (value) {
                    setState(() {
                      second_long = double.parse(value);
                    });
                  },
                ),
                RaisedButton(
                  onPressed: calculate,
                  child: Text("submit"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getDistance(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Text(
        answer,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Me'),
      ),
      body: ListView(physics: const BouncingScrollPhysics(), children: <Widget>[
        build_text_box(context),
        getDistance(context),
        build_back_button(context),
      ]),
    );
  }
}
