import 'package:centrodeportivo/src/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*class AnalizarFechas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('aforoFutbol').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData) {
            return Text('Cargando...');
          }
        print(snapshot.data.docs[0].data());
        print('-------------------------------------------------------------------');
        print(DateTime.now());
        print('-------------------------------------------------------------------');
        print(DateTime.now().difference(DateTime(snapshot.data.docs[0].data()['anio'], snapshot.data.docs[0].data()['mes'], snapshot.data.docs[0].data()['dia'])).inDays);
        print('-------------------------------------------------------------------');
        print(snapshot.data.docs[0].data()['dia']);
        if(DateTime.now().difference(DateTime(snapshot.data.docs[0].data()['anio'], snapshot.data.docs[0].data()['mes'], snapshot.data.docs[0].data()['dia'])).inDays == 0){
          return Container(
            child: Text('Fecha correcta'),
          );
        }
        else{
          return Container(
            child: Text('Fecha incorrecta'),
          );
        }
      },
    );
  }
}*/


class AnalizarFechas extends StatefulWidget {
  final String name;
  final UserRepository _userRepository;

  AnalizarFechas({Key key, @required this.name, @required UserRepository userRepository})
  :assert(userRepository!=null),
    _userRepository = userRepository,
    super(key: key);

  @override
  _AnalizarFechasState createState() => _AnalizarFechasState();
}

class _AnalizarFechasState extends State<AnalizarFechas> {
  int cont=0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('aforoFutbol').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData) {
            return Text('Cargando...');
          }
        print(snapshot.data.docs[cont].data());
        print('-------------------------------------------------------------------');
        print(DateTime.now());  
        print('-------------------------------------------------------------------');
        print(DateTime.now().difference(DateTime(snapshot.data.docs[cont].data()['anio'], snapshot.data.docs[cont].data()['mes'], snapshot.data.docs[cont].data()['dia'])).inDays);
        print('-------------------------------------------------------------------');
        print(snapshot.data.docs[cont].data()['dia']);
        print("HOLAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ");
        print(cont);
        if(DateTime.now().difference(DateTime(snapshot.data.docs[cont].data()['anio'], snapshot.data.docs[cont].data()['mes'], snapshot.data.docs[cont].data()['dia'])).inDays == 0){
          cont = cont + 1;
          return Container(
            child: Text('Fecha correcta'),
          );
          
          /*ListView(
            padding: const EdgeInsets.all(6),
            children: <Widget>[
              Text("sisas"),
            ],
          );*/
        }
        else{
          cont = cont + 1;
          return Container(
            child: Text('Fecha incorrecta'),
          );
        }
      },  
    );
  }
}