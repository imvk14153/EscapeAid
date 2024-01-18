import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FloodTipsScreen extends StatelessWidget {
  final Uri creditUrl = Uri.parse("https://www.ready.gov/floods");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flood - Quick Tips'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            _buildTipCard('Move to higher ground immediately.'),
            _buildTipCard('Do not walk, swim, or drive through flood waters.'),
            _buildTipCard('Stay off bridges over fast-moving water.'),
            _buildTipCard('Follow evacuation orders.'),
            _buildTipCard('Keep important documents in a waterproof container.'),
            _buildTipCard('Prepare an emergency kit.'),
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
