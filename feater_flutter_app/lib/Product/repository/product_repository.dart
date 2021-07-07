import 'package:feater_flutter_app/Product/gql/product_gql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductRepository{

  final ProductGQl _productGQl = ProductGQl();
  late final GraphQLClient authClient;

  ProductRepository(){
    authClient = _productGQl.graphQLClientAuth;
  }

  queryProductOption(){
    return _productGQl.queryProductOptions();
  }

  queryFavoriteProducts(){
    return _productGQl.queryFavoriteProducts();
  }

}