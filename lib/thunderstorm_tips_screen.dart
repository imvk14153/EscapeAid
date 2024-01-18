import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ThunderstormTipsScreen extends StatelessWidget {
  final Uri creditUrl = Uri.parse("https://www.ready.gov/thunderstorms-lightning");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thunderstorm - Quick Tips'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            _buildTipCard('Listen to NOAA Weather Radio for updates.'),
            _buildTipCard('Seek shelter immediately, preferably indoors.'),
            _buildTipCard('Avoid electrical equipment and plumbing.'),
            _buildTipCard('Stay away from windows and doors.'),
            _buildTipCard('Do not bathe or shower during a thunderstorm.'),
            _buildTipCard('If outdoors, avoid high ground and open spaces.'),
            _buildTipCard('Never shelter under an isolated tree.'),
            _buildTipCard('Avoid lying flat on the ground.'),
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
