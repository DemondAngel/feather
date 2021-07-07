import 'dart:async';

import 'package:feater_flutter_app/Product/model/product.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class DeliveryBloc extends Bloc{

  StreamController<List<Product>> _scProducts = BehaviorSubject();
  Stream<List<Product>> get streamProducts => _scProducts.stream;
  StreamSink<List<Product>> get sinkProducts => _scProducts.sink;

  List<Product> _products = [];

  addProductFromCar(Product product){
    _products.add(product);
    sinkProducts.add(_products);
  }

  removeProductFromCar(int index){
    _products.removeAt(index);
    sinkProducts.add(_products);
  }


  @override
  void dispose() {
    _scProducts.close();
  }

}