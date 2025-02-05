import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class BatteryScreen extends StatefulWidget {
  @override
  _BatteryScreenState createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<BatteryScreen> {
  final Battery _battery = Battery();
  int _batteryLevel = 75;
  BatteryState _batteryState = BatteryState.unknown;

  @override
  void initState() {
    super.initState();
    _initBattery();
    _battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() {
        _batteryState = state;
      });
    });
  }

  Future<void> _initBattery() async {
    int level = await _battery.batteryLevel;
    BatteryState state = await _battery.batteryState;

    setState(() {
      _batteryLevel = level;
      _batteryState = state;
    });
  }

  Color _getBatteryColor() {
    if (_batteryLevel >= 50) return Colors.green;
    if (_batteryLevel >= 20) return Colors.orange;
    return Colors.red;
  }

  IconData _getBatteryIcon() {
    if (_batteryState == BatteryState.charging) return Icons.battery_charging_full;
    if (_batteryLevel >= 80) return Icons.battery_full;
    if (_batteryLevel >= 50) return Icons.battery_3_bar;
    if (_batteryLevel >= 20) return Icons.battery_2_bar;
    return Icons.battery_alert;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Battery Status")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_getBatteryIcon(), size: 80, color: _getBatteryColor()),
            SizedBox(height: 20),
            Text(
              "Battery Level: $_batteryLevel%",
              style: TextStyle(fontSize: 24, color: _getBatteryColor()),
            ),
            SizedBox(height: 10),
            Text(
              "Status: ${_batteryState == BatteryState.charging ? "Charging ⚡" : "Not Charging"}",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
