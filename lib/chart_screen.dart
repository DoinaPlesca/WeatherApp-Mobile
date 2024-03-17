import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';
import 'package:weather/time_series.dart';
import 'data_source.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/time_series.dart';
import 'data_source.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key); // Adaugă parametrul Key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Chart'),
      ),
      body: FutureBuilder<WeatherChartData>(
        future: context.read<DataSource>().getChartData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Afișează indicatorul de încărcare când se încarcă datele
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Tratează cazul de eroare
            return Center(child: Text('Eroare: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            // Tratează cazul în care nu există date
            return const Center(child: Text('Nu există date disponibile'));
          } else {
            // Datele sunt disponibile, construiește graficul
            final variables = snapshot.data!.daily!;
            return charts.TimeSeriesChart(
              [
                // Prima serie - Temperatura maximă
                charts.Series<TimeSeriesDatum, DateTime>(
                  id: 'Temperatura maximă',
                  domainFn: (datum, _) => datum.domain,
                  measureFn: (datum, _) => datum.measure,
                  colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
                  data: variables[0].values, // Primele date sunt pentru temperatura maximă
                ),
                // A doua serie - Temperatura minimă
                charts.Series<TimeSeriesDatum, DateTime>(
                  id: 'Temperatura minimă',
                  domainFn: (datum, _) => datum.domain,
                  measureFn: (datum, _) => datum.measure,
                  colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault, // Schimbă culoarea
                  data: variables[1].values, // A doua serie de date este pentru temperatura minimă
                ),
              ],
              animate: true,
              dateTimeFactory: const charts.LocalDateTimeFactory(),
              behaviors: [charts.SeriesLegend()],
            );
          }
        },
      ),
    );
  }
}
