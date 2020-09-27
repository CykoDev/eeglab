import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_animated_linechart/fl_animated_linechart.dart';


void main() {
  runApp(MyApp());
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:new Text('SmartEEG',
        style:TextStyle(
          color: Colors.black,
        )),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children:[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('Welcome',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 100, 20,  8),
            child: Center(child: Text('Please enter your device in pairing mode and connect using the button below.',
                style: TextStyle(
                    fontSize: 25,
                )
            )),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new RaisedButton(
            child:Text('Connect to Device'),
            color:Colors.green,
            onPressed: (){
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new DeviceScreen()),
              );
            }),
          )
        ])
      );
  }
}



class DeviceScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: BackButton(
              color: Colors.black
          ),
          title: new Text('SmartEEG',
              style: TextStyle(
                color: Colors.black,
              )),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new SettingScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.show_chart,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new SignalScreen()),
                );
              },
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: new Text (
              'File Format',
              style: TextStyle(
                  fontSize: 30
              )
          ),
        )
    );
  }

}


class SimpleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SimpleLineChart.withSampleData() {
    return new SimpleLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList, animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}


class SignalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: BackButton(
            color: Colors.black
        ),
        title:new Text('SmartEEG',
            style:TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
      ),
      body:
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: SimpleLineChart.withSampleData(),
        ),
    );
  }
}






class SettingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: BackButton(
            color: Colors.black
        ),
        title: new Text('SmartEEG',
            style:TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
      ),
      body:
      SettingsList(
        sections: [
          SettingsSection(
            // title: 'Section',
            tiles: [
              SettingsTile.switchTile(
                title: 'Impedance',
                leading: Icon(Icons.fingerprint),
                switchValue: true,
                onToggle: (bool value) {},
              ),
              SettingsTile.switchTile(
                title: 'Use fingerprint',
                leading: Icon(Icons.fingerprint),
                switchValue: true,
                onToggle: (bool value) {},
              ),
              SettingsTile.switchTile(
                title: 'Use fingerprint',
                leading: Icon(Icons.fingerprint),
                switchValue: true,
                onToggle: (bool value) {},
              ),
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onTap: () {},
              ),
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onTap: () {},
              ),

            ]
          ),
        ],

      ),

      );
  }
}

class MyApp extends StatelessWidget {
  void connectDevice(){
    print('button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartEEG',
      home: new HomeScreen(),
    );
  }

}
