import 'package:flutter/material.dart';

class DrawerView extends StatefulWidget {
  DrawerView({Key key}) : super(key: key);

  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Opções')),
      body: Container(),
    );
  }
}
