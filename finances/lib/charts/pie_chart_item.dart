/// Simple pie chart with outside labels example.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class PieChartItem extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  PieChartItem(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory PieChartItem.withSampleData() {
    return PieChartItem(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
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

  /// Create one series with sample hard coded data.
  static List<charts.Series<PieCharItemValue, String>> _createSampleData() {
    final data = [
      new PieCharItemValue('Entradas', 100),
      new PieCharItemValue('Saídas', 75),
      //new LinearSales('2', 25),
      //new LinearSales('3', 5),
    ];

    return [
      new charts.Series<PieCharItemValue, String>(
        id: 'Sales',
        domainFn: (PieCharItemValue sales, _) => sales.title,
        measureFn: (PieCharItemValue sales, _) => sales.value,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (PieCharItemValue row, _) =>
            '${row.title}: ${row.value}',
      )
    ];
  }
}

/// Sample linear data type.
class PieCharItemValue {
  final String title;
  final double value;

  PieCharItemValue(this.title, this.value);
}
