import 'package:flutter/material.dart';
import 'fire_tips_screen.dart';
import 'tornado_tips_screen.dart';
import 'thunderstorm_tips_screen.dart';
import 'earthquake_tips_screen.dart';
import 'flood_tips_screen.dart';
import 'winter_storm_tips_screen.dart';

class QuickTipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Tips for Emergencies'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: <Widget>[
          _buildTile(context, 'Tornado', TornadoTipsScreen(), Icons.cloud_queue),
          _buildTile(context, 'Fire', FireTipsScreen(), Icons.local_fire_department),
          _buildTile(context, 'Thunderstorm', ThunderstormTipsScreen(), Icons.flash_on),
          _buildTile(context, 'Earthquake', EarthquakeTipsScreen(), Icons.landscape),
          _buildTile(context, 'Flood', FloodTipsScreen(), Icons.invert_colors),
          _buildTile(context, 'Winter Storm', WinterStormTipsScreen(), Icons.ac_unit),
        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context, String title, Widget screen, IconData icon) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueGrey),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }
}