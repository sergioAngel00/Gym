import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:centrodeportivo/src/bloc/authentication_bloc/bloc.dart';
import 'package:centrodeportivo/src/repository/user_repository.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
  : assert(userRepository != null),
  _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event
    ) async* {
    if(event is AppStarted){
      yield* _mapAppStartedToState();
    }
    if(event is LoggedIn){
      yield* _mapLoggedInState();
    }
    if(event is LoggedOut){
      yield* _mapLoggedOutState();
    }
  }

 
  Stream<AuthenticationState> _mapAppStartedToState() async*{
    try{
      final isSignedIn = await _userRepository.isSignedIn();
      if(isSignedIn){
        final user = await _userRepository.getUser();
        yield Authenticated(user);
      }
      else{
        yield Unauthenticated();
      }
    } catch (_){
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInState() async*{
    yield Authenticated(await _userRepository.getUser());
  }

  Stream<AuthenticationState> _mapLoggedOutState() async*{
    yield Unauthenticated();
    _userRepository.signOut();
  }
}