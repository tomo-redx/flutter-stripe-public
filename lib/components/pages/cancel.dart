import 'package:flutter/material.dart';

class Cancel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Something went wrong on registering...'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('back to home'),
            ),
          ],
        ),
      ),
    );
  }
}
