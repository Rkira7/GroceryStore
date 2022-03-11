import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../grocery_provider.dart';

class GroceryStoreCart extends StatelessWidget {
  const GroceryStoreCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context)!.bloc;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Cart",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25
                    ),),
                  Expanded(
                      child: ListView.builder(
                        itemCount: bloc.cart.length,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                    NetworkImage(bloc.cart[index].product.image!),
                                  ),
                                  Text(bloc.cart[index].product.name!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 15
                                      ),
                                    ),
                                  Text("${bloc.cart[index].quantity}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15
                                    ),
                                  ),

                                  const Text("x",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15
                                    ),
                                  ),

                                  Text("${bloc.cart[index].product.price!}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15
                                    ),
                                  ),
                                  Text((bloc.cart[index].quantity * bloc.cart[index].product.price!).toStringAsFixed(2),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15
                                    )
                                  ),

                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.white,),
                                    onPressed: (){
                                      bloc.deleteProduct(bloc.cart[index]);

                                  }, )
                                ],
                              ),

                            );
                          }))

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                const Text("Total:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20
                  ),
                ),
                const Spacer(),
                Text("${bloc.totalPriceCart()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20
                  ),
                )

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                shape:  MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xfff4c459)),),
              onPressed: () {

              },
              child: const Text("Next",
                style: TextStyle(
                    color: Colors.black),),
            ),
          )
        ],
      ),
    );
  }
}
