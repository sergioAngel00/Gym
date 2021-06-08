import 'package:flutter/material.dart';

class PinScreenS extends StatelessWidget {
  final String requiredNumber = '764521';
  //final String name;

  //PinScreen({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ingresa el sñxl,dcfvjuigrijf clave',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}