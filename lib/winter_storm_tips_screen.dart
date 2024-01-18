import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WinterStormTipsScreen extends StatelessWidget {
  final Uri creditUrl = Uri.parse("https://www.ready.gov/winter-weather");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Winter Storm - Quick Tips'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            _buildTipCard('Stay indoors and dress warmly.'),
            _buildTipCard('Prepare for possible power outages.'),
            _buildTipCard('Use generators outside only and away from windows.'),
            _buildTipCard('Listen for emergency information and alerts.'),
            _buildTipCard('Look for signs of hypothermia and frostbite.'),
            _buildTipCard('Check on neighbors, especially the elderly.'),
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
