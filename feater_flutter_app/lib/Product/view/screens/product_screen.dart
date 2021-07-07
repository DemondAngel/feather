import 'package:feater_flutter_app/Product/model/product.dart';
import 'package:feater_flutter_app/utils/config.dart';
import 'package:feater_flutter_app/widgets/custom_appbar.dart';
import 'package:feater_flutter_app/widgets/custom_layout.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _ProductScreenState();

}

class _ProductScreenState extends State<ProductScreen>{


  @override
  Widget build(BuildContext context) {

    final params = ModalRoute.of(context)?.settings.arguments as Map;

    Product? product = params['product'];

    return CustomLayout(
        appBarType: AppBarType.MODULE,
        showReturnButton: true,
        body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 6,
                      child: Text(
                        '${product?.name}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  alignment: Alignment.center,
                  child: Image.network('${config['urlImage']}${product?.image?['url']}'),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: RichText(
                        text: TextSpan(
                          text: 'Categoria: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 18
                          ),
                          children: [
                            TextSpan(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18
                                ),
                              text: '${product?.category?[0]['nombre']}'
                            )
                          ]
                        )
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: RichText(
                          text: TextSpan(
                              text: 'Subcategoria: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18
                              ),
                              children: [
                                TextSpan(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18
                                    ),
                                    text: '${product?.subcategory?[0]['name']}'
                                )
                              ]
                          )
                      ),
                    )
                  ],
                ),
                Row(
                  children: [

                    Flexible(
                      flex: 6,
                      child: RichText(
                          text: TextSpan(
                              text: 'Precio: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18
                              ),
                              children: [
                                TextSpan(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18
                                    ),
                                    text: '${product?.priceSell}'
                                )
                              ]
                          )
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'Precio al Mayoreo:  ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 18
                            ),
                            children: [
                              TextSpan(
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18
                                  ),
                                  text: '${product?.priceMajor}'
                              )
                            ]
                        )
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 6,
                      child: Text(
                        '¡CONOCE A LOS PRODUCTORES¡',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                if(product!.productors!.isNotEmpty)
                  Row(
                    children: [
                      Flexible(
                          flex: 6,
                          child: RichText(
                              text: TextSpan(
                                  text: 'Nombre: ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18
                                  ),
                                  children: [
                                    TextSpan(
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18
                                        ),
                                        text: '${product?.productors?[0].username}'
                                    )
                                  ]
                              )
                          ),
                      )
                    ],
                  ),
                SizedBox(
                  height: 20,
                ),
                if(product!.productors!.isNotEmpty)
                  Row(
                    children: [
                      Flexible(
                          flex: 6,
                          child: Text(
                              'Historia de Vida',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18
                            ),
                          )
                      )
                    ],
                  ),
                if(product!.productors!.isNotEmpty)
                  Row(
                    children: [
                      Flexible(
                          flex: 6,
                          child: Text('${product?.productors?[0].storyLife}')
                      )
                    ],
                  )

              ],
            ),
          )
        )
    );
  }

}