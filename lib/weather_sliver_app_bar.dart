import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class WeatherSliverAppBar extends StatelessWidget {
  final String headerImage = 'https://t3.ftcdn.net/jpg/05/79/86/10/360_F_579861052_KjeAAbyaXOBY6JjxMEPBVJypp2KSb59v.jpg';

  const WeatherSliverAppBar({
    Key? key, required String headerImage,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      onStretchTrigger: () async {
        print('Load new data!');
        // await Server.requestNewData();
      },
      backgroundColor: Colors.teal[800],
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
        ],
        title: const Center(
          child: Text(
            'Weather',
            textAlign: TextAlign.center,
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
