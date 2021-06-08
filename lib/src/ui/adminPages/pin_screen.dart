import 'package:centrodeportivo/src/repository/user_repository.dart';
import 'package:centrodeportivo/src/ui/adminPages/admin_screen.dart';
//import 'package:centrodeportivo/src/ui/adminPages/admin_screen.dart';
import 'package:flutter/material.dart';

class PinScreen extends StatelessWidget {
  final String name;
  final UserRepository _userRepository;
  final String contrasena = "123456789";
  final contra = TextEditingController(text: "");

  PinScreen({Key key, @required this.name, @required UserRepository userRepository})
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
                    Text("Ingresa el pin"),
                    TextFormField(
                      controller: contra,
                      keyboardType: TextInputType.number,
                    ),
                    RaisedButton(
                      child: Text('Ingresar'),
                      onPressed: (){
                        if(contrasena == contra.text){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context){
                              return AdminScreen(name: this.name, userRepository: _userRepository,);
                            })
                          );
                        }
                        else{
                          contra.text = "";
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]
      )
    );
  }
}