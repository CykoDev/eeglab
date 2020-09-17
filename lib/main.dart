import 'package:flutter/material.dart';
import 'screens/heatmap_screen.dart';
import 'screens/pairing_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/signal_data_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PairingScreen(),
      routes: {
        PairingScreen.routeName: (ctx) => PairingScreen(),
        HeatmapScreen.routeName: (ctx) => HeatmapScreen(),
        SettingsScreen.routeName: (ctx) => SettingsScreen(),
        SignalDataScreen.routeName: (ctx) => SignalDataScreen(),
      },
    );
  }
}