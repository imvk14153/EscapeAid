import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FireTipsScreen extends StatelessWidget {
  final Uri creditUrl = Uri.parse("https://www.ready.gov/home-fires");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fire - Quick Tips'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            _buildTipCard('Check smoke alarms regularly.'),
            _buildTipCard('Have an evacuation plan and practice it.'),
            _buildTipCard('Stay low to the ground when escaping a fire.'),
            _buildTipCard('Feel the doorknob and door before opening a door.'),
            _buildTipCard('Use the back of your hand to check for heat.'),
            _buildTipCard('If your clothes catch fire, stop, drop, and roll.'),
            _buildTipCard('Never hide during a fire, always try to get out of the house.'),
            _buildTipCard('If you can’t get out, close the door and cover vents and cracks to keep smoke out.'),
            _buildTipCard('Call 911 once you are safely outside.'),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: Text('Click here for more information', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            onTap: () => launchURL(creditUrl),
          ),
        ),
      ),
    );
  }

  Widget _buildTipCard(String tip) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          tip,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  void launchURL(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
