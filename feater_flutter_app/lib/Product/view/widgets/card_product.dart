import 'package:feater_flutter_app/Product/model/producto.dart';
import 'package:feater_flutter_app/utils/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget{
  final Function()? onPressed;
  final Function()? addCartPressed;
  final Product product;

  CardProduct({required this.onPressed, required this.product, required this.addCartPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      margin: EdgeInsets.all(10),
      
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                    flex: 6,
                    child: Text(
                        '${this.product.name}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    )
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 100,
              alignment: Alignment.center,
              child: Image.network('${config['urlImage']}${this.product.image?['url']}'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: this.onPressed,
                    child: Text(
                      'Saber mas',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    )
                ),
                SizedBox(
                  width: 10
                ),
                ElevatedButton(
                    onPressed: this.addCartPressed,
                    child: Icon(Icons.add,
                    color: Colors.white,),

                )
              ],
            )
          ],
        )
      ),
   );
  }


}