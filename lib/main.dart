import 'package:centrodeportivo/src/ui/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:centrodeportivo/src/bloc/authentication_bloc/bloc.dart';
import 'package:centrodeportivo/src/bloc/simple_bloc_delegate.dart';
import 'package:centrodeportivo/src/repository/user_repository.dart';
import 'package:centrodeportivo/src/ui/splash_screen.dart';
import 'package:centrodeportivo/src/ui/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final UserRepository userRepository = UserRepository();

  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository)
      ..add(AppStarted()),
      child: App(userRepository: userRepository),
    )
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
    : assert (userRepository != null),
      _userRepository = userRepository,
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if(state is Uninitialized){
            return SplashScreen();
          }
          if(state is Authenticated){
            return HomeScreen(name: state.displayName, userRepository: _userRepository,);
          }
          if(state is Unauthenticated){
            return LoginScreen(userRepository: _userRepository,);
          }
          return Container();
        },
      )
    );
  }
}