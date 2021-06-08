import 'package:centrodeportivo/src/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AdminScreen extends StatelessWidget {
  final String name;
  final UserRepository _userRepository;
  final anioFech = TextEditingController(text: "");
  final mesFech = TextEditingController(text: "");
  final diaFech = TextEditingController(text: "");
  final aforo = TextEditingController(text: "");

  final anioFechBas = TextEditingController(text: "");
  final mesFechBas = TextEditingController(text: "");
  final diaFechBas = TextEditingController(text: "");
  final aforoBas = TextEditingController(text: "");

  final anioFechNat = TextEditingController(text: "");
  final mesFechNat = TextEditingController(text: "");
  final diaFechNat = TextEditingController(text: "");
  final aforoNat = TextEditingController(text: "");

  final anioFechTen = TextEditingController(text: "");
  final mesFechTen = TextEditingController(text: "");
  final diaFechTen = TextEditingController(text: "");
  final aforoTen = TextEditingController(text: "");
  final databaseReference = FirebaseFirestore.instance;

  void createRecord(int aforo, int anio, int mes, int dia, String coleccionName) async {
    /*await databaseReference.collection("aforoFutbol")
      .document("1")
      .setData({
      'title': 'Mastering flutter',
      'description': 'Porgraming guide for dart',
      'miAtributo': 'Mi valor',
      'miAtributo2': 2000,
    });*/

    DocumentReference ref = await databaseReference.collection(coleccionName)
      .add({
      'aforoMax': aforo,
      'anio': anio,
      'dia': dia,
      'mes': mes,
      'personas': 0,
    });
    print(ref);
  }

  AdminScreen({Key key, @required this.name, @required UserRepository userRepository})
  :assert(userRepository!=null),
    _userRepository = userRepository,
    super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),

      body: 
        GridView.count(
        crossAxisCount: 1,
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Fútbol', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    TextFormField(
                      controller: anioFech,
                      keyboardType: TextInputType.number,
                    ),
                    Text('Inserta el año', style: TextStyle(fontSize: 14,),),
                    TextFormField(
                      controller: mesFech,
                      keyboardType: TextInputType.number,
                    ),
                    Text('Inserta el mes', style: TextStyle(fontSize: 14,),),
                    TextFormField(
                      controller: diaFech,
                      keyboardType: TextInputType.number,
                    ),
                    Text('Inserta el dia', style: TextStyle(fontSize: 14,),),
                    TextFormField(
                      controller: aforo,
                      keyboardType: TextInputType.number,
                    ),
                    Text('Aforo', style: TextStyle(fontSize: 14,),),

                    RaisedButton(
                      child: Text('Enviar datos'),
                      onPressed: (){
                        if(anioFech.text != "" && mesFech.text != "" && diaFech.text != "" && aforo.text != ""){
                          print(int.parse(aforo.text));
                          createRecord(int.parse(aforo.text), int.parse(anioFech.text), int.parse(mesFech.text), int.parse(diaFech.text), "aforoFutbol");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Baloncesto', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    TextFormField(
                      controller: anioFech,
                      keyboardType: TextInputType.number,
                    ),
                    Text('Inserta el año', style: TextStyle(fontSize: 14,),),
                    TextFormField(
                      controller: mesFechBas,
                      keyboardType: TextInputType.number,
                    ),
                    Text('Inserta el mes', style: TextStyle(fontSize: 14,),),
                    TextFormField(
                      controller: diaFechBas,
                      keyboardType: TextInputType.number,
                    ),
                    Text('Inserta el dia', style: TextStyle(fontSize: 14,),),
                    TextFormField(
                      controller: aforoBas,
                      keyboardType: TextInputType.number,
                    ),
                    Text('Aforo', style: TextStyle(fontSize: 14,),),

                    RaisedButton(
                      child: Text('Enviar datos'),
                      onPressed: (){
                        if(anioFechBas.text != "" && mesFechBas.text != "" && diaFechBas.text != "" && aforoBas.text != ""){
                          print(int.parse(aforo.text));
                          createRecord(int.parse(aforoBas.text), int.parse(anioFechBas.text), int.parse(mesFechBas.text), int.parse(diaFechBas.text), "aforoBaloncesto");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Natación', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    TextFormField(
                      controller: anioFech,
                      keyboardType: TextInputType.number,
                    ),
                    Text('Inserta el año', style: TextStyle(fontSize: 14,),),
                    TextFormField(
                      controller: mesFechNat,
                      keyboardType: TextInputType.number,
                    ),
                    Text('Inserta el mes', style: TextStyle(fontSize: 14,),),
                    TextFormField(
                      controller: diaFechNat,
                      keyboardType: TextInputType.number,
                    ),
                    Text('Inserta el dia', style: TextStyle(fontSize: 14,),),
                    TextFormField(
                      controller: aforoNat,
                      keyboardType: TextInputType.number,
                    ),
                    Text('Aforo', style: TextStyle(fontSize: 14,),),

                    RaisedButton(
                      child: Text('Enviar datos'),
                      onPressed: (){
                        if(anioFechNat.text != "" && mesFechNat.text != "" && diaFechNat.text != "" && aforoNat.text != ""){
                          print(int.parse(aforo.text));
                          createRecord(int.parse(aforoNat.text), int.parse(anioFechNat.text), int.parse(mesFechNat.text), int.parse(diaFechNat.text), "aforoNatacion");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Tennis', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    TextFormField(
                      controller: anioFechTen,
                      keyboardType: TextInputType.number,
                    ),
                    Text('Inserta el año', style: TextStyle(fontSize: 14,),),
                    TextFormField(
                      controller: mesFechTen,
                      keyboardType: TextInputType.number,
                    ),
                    Text('Inserta el mes', style: TextStyle(fontSize: 14,),),
                    TextFormField(
                      controller: diaFechTen,
                      keyboardType: TextInputType.number,
                    ),
                    Text('Inserta el dia', style: TextStyle(fontSize: 14,),),
                    TextFormField(
                      controller: aforoTen,
                      keyboardType: TextInputType.number,
                    ),
                    Text('Aforo', style: TextStyle(fontSize: 14,),),

                    RaisedButton(
                      child: Text('Enviar datos'),
                      onPressed: (){
                        if(anioFechTen.text != "" && mesFechTen.text != "" && diaFechTen.text != "" && aforoTen.text != ""){
                          print(int.parse(aforo.text));
                          createRecord(int.parse(aforoTen.text), int.parse(anioFechTen.text), int.parse(mesFechTen.text), int.parse(diaFechTen.text), "aforoTenis");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
