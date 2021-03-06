import 'package:feater_flutter_app/Delivery/bloc/delivery_bloc.dart';
import 'package:feater_flutter_app/Product/bloc/producto_bloc.dart';
import 'package:feater_flutter_app/Product/model/product.dart';
import 'package:feater_flutter_app/Product/view/widgets/card_product.dart';
import 'package:feater_flutter_app/Users/bloc/user_bloc.dart';
import 'package:feater_flutter_app/utils/regex.dart';
import 'package:feater_flutter_app/widgets/custom_appbar.dart';
import 'package:feater_flutter_app/widgets/custom_layout.dart';
import 'package:feater_flutter_app/widgets/custom_textfields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ProductsScreenState();

}

class _ProductsScreenState extends State<ProductsScreen> with SingleTickerProviderStateMixin{

  late UserBloc _userBloc;
  late TextEditingController? _txtSearch;
  late TabController _tabController;
  late ProductBloc _productBloc;
  late DeliveryBloc _deliveryBloc;

  @override
  void initState() {
    _productBloc = ProductBloc();
    _txtSearch = TextEditingController();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _productBloc.dispose();
    _txtSearch?.dispose();
    _tabController.dispose();
    super.dispose();
  }

  onCompleted(data){

  }

  onError(error){

  }

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);
    _deliveryBloc = BlocProvider.of(context);
    return CustomLayout(
        appBarType: AppBarType.SHOP,
        textTitle: 'Obio',
        showReturnButton: true,
        body: Container(
          padding: EdgeInsets.all(20),
          child: LayoutBuilder(
            builder: (context, constraints){
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: constraints.maxHeight,
                  child: Column(
                    children: [
                      Flexible(
                          flex: 2,
                          child: Row(
                            children: [
                              Flexible(
                                flex: 6,
                                child: CustomTextField(
                                  labelText: 'Buscar',
                                  regex: Regex.todo,
                                  errorMessage: 'Colocar bien la b??squeda',
                                  maxLength: 1000,
                                  isDatePicker: false,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  controller: _txtSearch,
                                  textInputType: TextInputType.text,
                                ),
                              )
                            ],
                          )
                      ),
                      Flexible(
                          flex: 2,
                          child: TabBar(
                            controller: _tabController,
                            tabs: [
                              Tab(
                                icon: Icon(Icons.shopping_bag),
                                text: 'Productos',
                              ),
                              Tab(
                                icon: Icon(Icons.star),
                                text: 'Favoritos',
                              )
                            ],
                          )
                      ),
                      Flexible(
                          flex:7,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              GraphQLProvider(
                                client: _productBloc.authClient,
                                child: Query(
                                  options: _productBloc.queryProductsOptions(),
                                  builder: (result, {refetch, fetchMore}){
                                    if(result.hasException){
                                      print('Hubo un error');
                                    }

                                    if(result.isLoading || result.data == null){
                                      return Container(
                                        height: 10,
                                        width: 10,
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    else{
                                      List<Product> products = List.generate(result.data?['products'].length,
                                              (index) => Product.fromJson(result.data?['products'][index]));

                                      return ListView.builder(
                                        itemCount: products.length,
                                        itemBuilder: (context, index) => CardProduct(
                                          product: products[index],
                                          onPressed: () => Navigator.of(context).pushNamed('/product', arguments: {'product': products[index]}),
                                          addCartPressed: () => _deliveryBloc.addProductFromCar(products[index]),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                              GraphQLProvider(
                                client: _productBloc.authClient,
                                child: Query(
                                  options: _productBloc.queryFavoriteOptions(),
                                  builder: (result, {refetch, fetchMore}){
                                    if(result.hasException){
                                      print('Hubo un error');
                                    }

                                    if(result.isLoading || result.data == null){
                                      return Container(
                                        height: 10,
                                        width: 10,
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    else{
                                      List<Product> products = List.generate(result.data?['user']['favoriteProducts'].length,
                                              (index) => Product.fromJson(result.data?['user']['favoriteProducts'][index]));

                                      return ListView.builder(
                                        itemCount: products.length,
                                        itemBuilder: (context, index) => CardProduct(
                                          product: products[index],
                                          onPressed: () => Navigator.of(context).pushNamed('/product', arguments: {'product': products[index]}),
                                          addCartPressed: () => _deliveryBloc.addProductFromCar(products[index]),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                ),
              );
            },
          )
        )
    );
  }


}