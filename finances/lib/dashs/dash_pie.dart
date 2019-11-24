/// Simple pie chart with outside labels example.
import 'package:charts_flutter/flutter.dart' as charts;
import 'chart_pair.dart';
import 'package:flutter/material.dart';

class DashPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DashPieChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  static withSampleData() {
    return DashPieChart(
      createSerie(id: 'Vendas', data: [
        ChartPair('0', 10),
        ChartPair('1', 12),
        ChartPair('2', 100),
        ChartPair('3', 50),
        ChartPair('4', 40),
      ]),
      // Disable animations for image tests.
      animate: false,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<ChartPair, String>> createSerie(
      {String id, List<ChartPair> data}) {
    return [
      new charts.Series<ChartPair, String>(
        id: id,
        domainFn: (ChartPair sales, _) => sales.title,
        measureFn: (ChartPair sales, _) => sales.value,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (ChartPair row, _) => '${row.title}',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,
        // Add an [ArcLabelDecorator] configured to render labels outside of the
        // arc with a leader line.
        //
        // Text style for inside / outside can be controlled independently by
        // setting [insideLabelStyleSpec] and [outsideLabelStyleSpec].
        //
        // Example configuring different styles for inside/outside:
        //       new charts.ArcLabelDecorator(
        //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
        //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
        defaultRenderer: new charts.ArcRendererConfig(arcRendererDecorators: [
          new charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.outside)
        ]));
  }
}
