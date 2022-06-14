import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Navigation over screens'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              // Navigate using declared route name
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/graph'),
                child: Text('Navigate to graph page'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/bowling'),
                child: Text('Navigate to bowling order page'),
              ),
              // Navigate using simple push method
            ],
          ),
        ),
      );
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second screen'),
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Back'),
        ),
      ),
    );
  }
}
