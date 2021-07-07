import 'package:feater_flutter_app/Users/model/user.dart';
import 'package:feater_flutter_app/utils/config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class BaseGQL{

  late final HttpLink _httpLink;

  late final HiveStore _hiveStore;
  
  late final GraphQLClient graphQLClient;
  late final GraphQLClient graphQLClientAuth;

  BaseGQL(){
    _hiveStore= HiveStore();
    _httpLink = HttpLink(
        config['url']!
    );

    graphQLClient = GraphQLClient(
        link: _httpLink,
        cache: GraphQLCache(store: _hiveStore)
    );

    AuthLink authLink = AuthLink(getToken: () => 'Bearer ${this.getToken()}');

    Link link = authLink.concat(_httpLink);

    graphQLClientAuth = GraphQLClient(
        link: link,
        cache: GraphQLCache(store: _hiveStore)
    );
  }

  final _login = """
    mutation Login(\$identifier: String!, \$password: String!){
    
      login(
        input: {
          identifier: \$identifier,
          password: \$password
        }
      ){
        jwt,
        user{
          id,
          username,
          email,
          confirmed,
          blocked,
          role{
            name,
            description,
            type
          }
        }
      
      }
    
    }
  """;

  MutationOptions mutationLoginOptions(OnMutationCompleted? onCompleted, OnError? onError){
    return MutationOptions(
        document: gql(_login),
        fetchPolicy: FetchPolicy.cacheAndNetwork,
        update: (cache,result) {
          return cache;
        },
        onError: onError,
        onCompleted: onCompleted
    );
  }

  saveUser(User user){
    this.graphQLClient.cache.store.put('user', {
      'data': user.toJSON()
    });
  }

  getUser(){
    return User.fromJson(this.graphQLClient.cache.store.get('user')?['data']);
  }

  saveToken(String token){
    this.graphQLClient.cache.store.put('token', {
      'data': token
    });
  }

  getToken(){
    return this.graphQLClient.cache.store.get('token')?['data'];
  }

}