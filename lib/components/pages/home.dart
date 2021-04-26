import 'package:flutter/material.dart';
import 'package:flutter_stripe_web/main.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tokyo app'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => isLoggedInNormal()),
                );
              },
              child: Text('Normal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => isLoggedInPrime()),
                );
              },
              child: Text('Prime'),
            ),
          ],
        ),
      ),
    );
  }
}
