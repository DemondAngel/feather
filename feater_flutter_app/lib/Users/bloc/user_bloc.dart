import 'dart:async';

import 'package:feater_flutter_app/Users/model/user.dart';
import 'package:feater_flutter_app/Users/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc extends Bloc{

  late final UserRepository _userRepository;

  StreamController<User> _scUser = BehaviorSubject();
  Stream<User> get streamUser  => _scUser.stream;
  StreamSink<User> get sinkUser => _scUser.sink;

  late ValueNotifier<GraphQLClient> client;
  late ValueNotifier<GraphQLClient> clientAuth;

  UserBloc(){
    _userRepository = UserRepository();
    client = ValueNotifier(_userRepository.client);
    clientAuth = ValueNotifier(_userRepository.authClient);
  }

  mutationOptionsLogin(onCompleted, onError){
    return _userRepository.mutationLoginOptions(onCompleted, onError);
  }

  saveToken(String token){
    return _userRepository.saveToken(token);
  }

  saveUser(User user) => _userRepository.saveUser(user);

  @override
  void dispose() {
    clientAuth.dispose();
    client.dispose();
    _scUser.close();
  }

}