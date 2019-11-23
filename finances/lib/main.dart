import 'package:controls_web/themes/themes.dart';
import 'package:flutter/material.dart';
import 'setup/config_app.dart';
import 'views/main_view.dart';

void main() {
  ConfigApp.beforeInit();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ConfigApp.afterInit();
    return DynamicTheme(
        initial: Brightness.light,
        onData: (b) {
          if (b == Brightness.light) return ThemeData.light();
          return ThemeData.dark();
        },
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Finances Dashboard',
            theme: theme,
            home: MainView(),
          );
        });
  }
}
