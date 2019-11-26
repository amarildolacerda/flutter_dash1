import 'package:controls_web/controls/home_elements.dart';
import '../dashs/chart_pair.dart';
import '../dashs/dash_bar.dart';
import '../dashs/dash_container.dart';
import '../dashs/dash_danut.dart';
import '../dashs/dash_gauge.dart';
import '../dashs/dash_hbar.dart';
import '../dashs/dash_timeseries.dart';
import '../dashs/dash_pie.dart';

import 'package:flutter/material.dart';

import 'drawer_view.dart';

class MainView extends StatefulWidget {
  MainView({Key key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('xr')),
      drawer: Drawer(child: DrawerView()),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SliverContents(
          body: Container(),
          topBarsHeight: 70,
          toolBar: Container(
            height: 98,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var item in _createTopBars())
                  Container(padding: EdgeInsets.all(2), child: item),
              ],
            ),
          ),
          children: _createChildren(context),
        ),
      ),
    );
  }

  List<Widget> _createChildren(context) {
    return [
      DashContainer(child: DashTimeSeriesBar.withSampleData()),
      DashContainer(child: DashBarChart.withSampleData()),
      DashContainer(
        child: DashHorizontalBarChart.withSampleData(),
      ),
      DashContainer(
        width: 300,
        height: 300,
        child: DashDanutChart.withSampleData(),
      ),
      DashContainer(
        width: double.infinity,
        height: 500,
        subTitle: 'Contas',
        child: DashPieChart(DashPieChart.createSerie(id: 'Vendas', data: [
          ChartPair('Entradas', 100),
          ChartPair('Saídas', 120),
        ])),
      ),
      DashContainer(
        //width: 400,
        //height: 400,
        title: 'Gauge',
        child: DashGaugeChart.withSampleData(),
      )
    ];
  }

  List<Widget> _createTopBars() {
    return [
      ApplienceTile(
        image: Icon(
          Icons.announcement,
          color: Colors.white,
        ),
        width: 150,
        color: Colors.amber.withAlpha(250),
        title: 'A Pagar',
        value: '10',
        valueFontSize: 28,
        titleFontSize: 14,
      ),
      ApplienceTile.panel(
        width: 150,
        image: Icon(Icons.recent_actors, color: Colors.white),
        color: Colors.amber,
        title: 'A Pagar Hoje',
        value: '12',
      ),
      ApplienceTile.panel(
        width: 150,
        image: Icon(Icons.recent_actors, color: Colors.white),
        color: Colors.amber,
        title: 'A Receber',
        value: '12',
      ),
      ApplienceTile.panel(
        width: 150,
        image: Icon(Icons.recent_actors, color: Colors.white),
        color: Colors.amber,
        title: 'A Receber Hoje',
        value: '12',
      ),
    ];
  }
}
