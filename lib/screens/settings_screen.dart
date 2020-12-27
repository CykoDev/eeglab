import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

enum SamplingFrequency {
  twofifty,
  fivehundo,
}

class SettingsScreen extends StatefulWidget {
  static String routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SamplingFrequency _freq = SamplingFrequency.twofifty;

  void _showMaterialDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Sampling Frequency"),
              content: Container(
                height: 96,
                child: Column(
                  children: [
                    Row(
                      children: [
                        new Radio(
                          value: SamplingFrequency.twofifty,
                          groupValue: _freq,
                          onChanged: (SamplingFrequency value) {
                            setState(() {
                              _freq = value;
                            });
                          },
                        ),
                        Text("250Hz"),
                      ],
                    ),
                    Row(
                      children: [
                        new Radio(
                          value: SamplingFrequency.fivehundo,
                          groupValue: _freq,
                          onChanged: (SamplingFrequency value) {
                            setState(() {
                              _freq = value;
                            });
                          },
                        ),
                        Text("500Hz"),
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Close Me"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(
          'SmartEEG',
        ),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile.switchTile(
                title: 'Impedance',
                subtitle: 'Display color coded impedance',
                leading: Icon(
                  Icons.fingerprint,
                ),
                switchValue: true,
                onToggle: (bool value) {},
              ),
              SettingsTile.switchTile(
                title: 'Impedance',
                subtitle: 'Display color coded impedance',
                leading: Icon(
                  Icons.fingerprint,
                ),
                switchValue: true,
                onToggle: (bool value) {},
              ),
              SettingsTile.switchTile(
                title: 'Impedance',
                subtitle: 'Display color coded impedance',
                leading: Icon(
                  Icons.fingerprint,
                ),
                switchValue: true,
                onToggle: (bool value) {},
              ),
              SettingsTile(
                title: 'Impedance',
                subtitle: 'Display color coded impedance',
                leading: Icon(
                  Icons.language,
                ),
                onTap: () {
                  _showMaterialDialog(context);
                },
              ),
              SettingsTile(
                title: 'Impedance',
                subtitle: 'Display color coded impedance',
                leading: Icon(
                  Icons.language,
                ),
                onTap: () {},
              ),
              SettingsTile(
                title: 'Impedance',
                subtitle: 'Display color coded impedance',
                leading: Icon(
                  Icons.language,
                ),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
