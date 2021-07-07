import 'package:feater_flutter_app/Product/repository/product_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductBloc extends Bloc{

  final ProductRepository _productRepository = ProductRepository();
  late final ValueNotifier<GraphQLClient> authClient;

  ProductBloc(){
    authClient = ValueNotifier(_productRepository.authClient);
  }


  queryProductsOptions(){
    return _productRepository.queryProductOption();
  }

  queryFavoriteOptions(){
    return _productRepository.queryFavoriteProducts();
  }

  @override
  void dispose() {
    authClient.dispose();
  }

}