import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TornadoTipsScreen extends StatelessWidget {
  final Uri creditUrl = Uri.parse("https://www.ready.gov/tornadoes");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tornado - Quick Tips'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            _buildTipCard('Find safe shelter right away.'),
            _buildTipCard('If you can safely get to a sturdy building, then do so immediately.'),
            _buildTipCard('Go to a safe room, basement, or storm cellar.'),
            _buildTipCard('If you are in a building with no basement, then get to a small interior room on the lowest level.'),
            _buildTipCard('Stay away from windows, doors, and outside walls.'),
            _buildTipCard('Do not get under an overpass or bridge. You’re safer in a low, flat location.'),
            _buildTipCard('Watch out for flying debris that can cause injury or death.'),
            _buildTipCard('Use your arms to protect your head and neck.'),
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