import 'package:controls_web/controls/home_elements.dart';
//import 'package:controls_web/controls/shopping.dart';
import 'package:finances/charts/pie_chart_item.dart';

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
          topBarsHeight: 98,
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
      Container(
        width: 200,
        height: 150,
        child: PieChartItem([
          PieCharItemValue('Entradas', 100),
          PieCharItemValue('Saídas', 100),
        ]),
      ),
    ];
  }

  List<Widget> _createTopBars() {
    return [
      ApplienceTile.panel(
        image: Icon(
          Icons.announcement,
          color: Colors.white,
        ),
        width: 150,
        color: Colors.amber.withAlpha(250),
        title: 'A Pagar',
        value: '10',
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
