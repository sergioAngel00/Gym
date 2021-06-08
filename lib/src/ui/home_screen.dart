import 'package:centrodeportivo/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:centrodeportivo/src/bloc/authentication_bloc/authentication_event.dart';
import 'package:centrodeportivo/src/repository/user_repository.dart';
import 'package:centrodeportivo/src/ui/adminPages/admin_screen.dart';
import 'package:centrodeportivo/src/ui/adminPages/pin_screen.dart';
import 'package:centrodeportivo/src/ui/futbolPages/futbol_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  final UserRepository _userRepository;

  HomeScreen({Key key, @required this.name, @required UserRepository userRepository})
  :assert(userRepository!=null),
    _userRepository = userRepository,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app), 
            onPressed: (){
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            }
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Fútbol', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Image.asset(
                      'assets/futbol.png',
                      height: 100,
                      width: 150,
                    ),
                    FutbolScreenButton(name: this.name, userRepository: _userRepository,),
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
                    Image.asset(
                      'assets/baloncesto.png',
                      height: 100,
                      width: 150,
                    ),
                    RaisedButton(
                      child: Text('Ver horarios'),
                      onPressed: (){
                        print('Baloncesto');
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
                    Image.asset(
                      'assets/natacion.png',
                      height: 100,
                      width: 150,
                    ),
                    RaisedButton(
                      child: Text('Ver horarios'),
                      onPressed: (){
                        print('Natación');
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
                    Text('Tenis', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Image.asset(
                      'assets/tenis.png',
                      height: 100,
                    ),
                    RaisedButton(
                      child: Text('Ver horarios'),
                      onPressed: (){
                        print('Tenis');
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
                    Text('Entrar como admin', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Image.asset(
                      'assets/login.png',
                      height: 100,
                    ),
                    AdminScreenButton(name: this.name, userRepository: _userRepository,),
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

/*class PinScreen extends StatelessWidget {
  final String requiredNumber = '764521';
  final String name;

  PinScreen({Key key, @required this.name, UserRepository userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ingresa el numero clave',
                ),
              ],
            ),
          ),
        ),
    );
  }
}*/

class FutbolScreenButton extends StatelessWidget {
  final String name;
  final UserRepository _userRepository;

  FutbolScreenButton({Key key, @required this.name, @required UserRepository userRepository})
  :assert(userRepository!=null),
    _userRepository = userRepository,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Ver horarios'),
      onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context){
            return FutbolScreen(name: this.name, userRepository: _userRepository,);
          })
        );
      },
    );
  }
}

class AdminScreenButton extends StatelessWidget {
  final String name;
  final UserRepository _userRepository;

  AdminScreenButton({Key key, @required this.name, @required UserRepository userRepository})
  :assert(userRepository!=null),
    _userRepository = userRepository,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Ingresar como admin'),
      onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context){
            return PinScreen(name: this.name, userRepository: _userRepository,);
          })
        );
      },
    );
  }
}