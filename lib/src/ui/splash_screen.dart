import 'package:flutter/material.dart';

/*class SplashScreen extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Splash Screen'),),
    );
  }
}*/


class SplashScreen extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 20,),
            Text('Bienvenido', style: TextStyle(color: Colors.white),),
            SizedBox(height: 10,),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}