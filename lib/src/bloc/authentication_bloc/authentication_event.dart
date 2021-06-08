import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable{
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

//Tres eventos:
//AppStarted
//LoggedIn
//LoggedOut

class AppStarted extends AuthenticationEvent{}

class LoggedIn extends AuthenticationEvent{}

class LoggedOut extends AuthenticationEvent{}

class FutbolIn extends AuthenticationEvent{}