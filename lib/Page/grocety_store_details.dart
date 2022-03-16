import 'package:flutter/material.dart';
import 'package:grocerystore/grocery_product.dart';
import 'package:grocerystore/grocery_provider.dart';

import '../Bloc/grocery_store_bloc.dart';

class GroceryStoreDetails extends StatelessWidget {
  final GroceryProduct product;
  final VoidCallback onProductAdded;

  const GroceryStoreDetails({Key? key, required this.product, required this.onProductAdded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = GroceryStoreBloc();
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: GroceryProvider(
        bloc: bloc,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    StreamBuilder<String>(
                        stream: bloc.streamTag,
                        initialData: "",
                        builder: (context, heroTag) {
                        return Center(
                            child: Hero(
                              tag: "list_${product.name}_${heroTag.data}",
                              child: Image.network(
                                product.image!,
                                height: MediaQuery.of(context).size.height * 0.3,
                                fit: BoxFit.contain,
                              ),
                            ));
                      }
                    ),


                    Text("${product.name}",
                      style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    const SizedBox(height: 15),
                    Text("\$${product.weight}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.grey),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Text("\$${product.price}",
                          style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "About the product",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "${product.decription}",
                      style:
                      const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: IconButton(
                        onPressed: () => " ",
                        icon: const Icon(Icons.favorite_border)),
                  ),
                  Expanded(
                      flex: 4,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:  MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(const Color(0xfff4c459)),),
                        onPressed: () {
                          bloc.addToCart(context, onProductAdded);
                        },
                        child: const Text("Add to cart",
                          style: TextStyle(
                              color: Colors.black),),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}