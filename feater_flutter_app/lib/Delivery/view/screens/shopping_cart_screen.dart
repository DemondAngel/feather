import 'package:feater_flutter_app/Delivery/bloc/delivery_bloc.dart';
import 'package:feater_flutter_app/Delivery/view/widgets/product_resume.dart';
import 'package:feater_flutter_app/Product/model/product.dart';
import 'package:feater_flutter_app/widgets/custom_appbar.dart';
import 'package:feater_flutter_app/widgets/custom_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ShoppingCartScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen>{

  DeliveryBloc? deliveryBloc;

  @override
  Widget build(BuildContext context) {

    deliveryBloc = BlocProvider.of(context);

    return CustomLayout(
      showReturnButton: true,
      appBarType: AppBarType.MODULE,
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Icon(
                      Icons.shopping_cart,
                    color: Colors.black,
                    size: 100,
                  ),
                ),

                StreamBuilder(
                  stream: deliveryBloc?.streamProducts,
                  builder: (context, AsyncSnapshot<List<Product>> snapshot){

                    if(!snapshot.hasData || snapshot.hasError){
                      return Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator()
                      );
                    }
                    else{
                      return Column(
                        children: List.generate(snapshot.data!.length, (index)=> ProductResume(
                            product: snapshot.data![index],
                          onPressed: () => this.deliveryBloc?.removeProductFromCar(index),
                        )),
                      );
                    }
                  },
                ),

                Container(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => print('El pedido esta en proceso'),
                    child: Text(
                        'Pagar',
                      style: TextStyle(
                        color: Colors.white
                      )
                    ),
                  ),
                )
              ],
            )
        ),
      )
    );

  }

}