import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherSliverAppBar extends StatelessWidget {
  final String headerImage = 'https://t3.ftcdn.net/jpg/05/79/86/10/360_F_579861052_KjeAAbyaXOBY6JjxMEPBVJypp2KSb59v.jpg';
  final Future<void> Function() onRefresh;

  const WeatherSliverAppBar({
    Key? key,
    required String headerImage,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      onStretchTrigger: onRefresh,
      backgroundColor: Colors.teal[800],
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
        ],
        title: Container(
          alignment: Alignment.center,
          child: const Text(
            'Weather',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),

          ),
        ),
        background: DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: <Color>[Colors.teal[800]!, Colors.transparent],
            ),
          ),
          child: Image.network(
            headerImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

