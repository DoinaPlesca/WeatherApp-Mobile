import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/weekly_forecast_screen.dart';
import 'chart_screen.dart';
import 'data_source.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<DataSource>(
          create: (context) => FakeDataSource(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          // Detect swipe to the right
          if (details.primaryVelocity! > 0) {
            navigateToChartScreen();
          }
          // Detect swipe to the left
          else if (details.primaryVelocity! < 0) {
            navigateBack();
          }
        },
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          children: [
            WeeklyForecastScreen(),
            ChartScreen(),
          ],
        ),
      ),
    );
  }

  void navigateToChartScreen() {
    if (_currentPageIndex == 0) {
      _pageController.animateToPage(
        1,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void navigateBack() {
    if (_currentPageIndex == 1) {
      _pageController.animateToPage(
        0,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }
}




/*https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=Europe%2FBerlin*/




