import 'package:feater_flutter_app/Users/gql/user_grapql.dart';
import 'package:feater_flutter_app/Users/model/user.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UserRepository{

  late final UserGQL _userGQL;
  late final GraphQLClient client;
  late final GraphQLClient authClient;

  UserRepository(){
    _userGQL = UserGQL();
    client = _userGQL.graphQLClient;
    authClient = _userGQL.graphQLClientAuth;
  }

  saveToken(String token){
    return _userGQL.saveToken(token);
  }

  mutationLoginOptions(OnMutationCompleted onCompleted, OnError? onError) => _userGQL.mutationLoginOptions(onCompleted,onError);

  saveUser(User user) => _userGQL.saveUser(user);


}