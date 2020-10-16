import 'package:flutter/material.dart';

import '../widgets/simple_line_chart.dart';

class SignalDataScreen extends StatelessWidget {
  static String routeName = '/signal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: new Text(
          'SmartEEG',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SimpleLineChart.withSampleData(),
      ),
    );
  }
}
