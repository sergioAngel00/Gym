import 'package:centrodeportivo/src/repository/user_repository.dart';
import 'package:centrodeportivo/src/ui/fechas/ver_fechas.dart';
import 'package:centrodeportivo/src/ui/futbolPages/futbol_screen_complements.dart';
import 'package:flutter/material.dart';


class FutbolScreen extends StatelessWidget {
  final String name;
  final UserRepository _userRepository;

  FutbolScreen({Key key, @required this.name, @required UserRepository userRepository})
  :assert(userRepository!=null),
    _userRepository = userRepository,
    super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horarios futbol'),
      ),

      body: 
        Center(
            child: Column(
              children: <Widget>[
                Text('Horraios disponibles', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ImgFutbol(),
                AnalizarFechas(name: this.name, userRepository: _userRepository,),
                //AnalizarFechas(),
              ],
            ),
        ),
    );
  }
}
