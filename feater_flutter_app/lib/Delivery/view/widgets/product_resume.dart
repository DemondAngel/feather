import 'package:feater_flutter_app/Product/model/product.dart';
import 'package:feater_flutter_app/utils/config.dart';
import 'package:flutter/material.dart';

class ProductResume extends StatelessWidget{

  final Product product;
  final Function()? onPressed;

  ProductResume({required this.product, this.onPressed});

  @override
  Widget build(BuildContext context){
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.network('${config['urlImage']}${product?.image?['url']}'),
            ),
            Flexible(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex:6,
                        child: Text('${product.name}'),
                      )
                    ],
                  ),
                  SizedBox(
                      height: 20
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Cantidad: ',
                          children: [
                            TextSpan(
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                                text: '${product.quantity}'
                            )
                          ],
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )
                      )),
                  ElevatedButton(
                      onPressed: this.onPressed,
                      child: Text('Quitar',
                      style: TextStyle(
                        color: Colors.white
                      ),)
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}