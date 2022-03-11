import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocerystore/Page/grocety_store_details.dart';
import 'package:grocerystore/Widget/staggered_dual_view.dart';

import '../grocery_provider.dart';
import 'grocery_store_home.dart';

class GroceryStoreList extends StatelessWidget {
  const GroceryStoreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context)!.bloc;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: StaggeredDualView(
        aspectRatio: 0.6,
        itemCount: bloc.catalog.length,
        offsetPercent: 0.5,
        spacing: 10,
        itemBuider: (context, index) {
          final product = bloc.catalog[index];
          return InkWell(
            onTap: (){
              Navigator.of(context).push(PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 600),
                  pageBuilder: (context, animation, secondaryAnimation) {
                return FadeTransition(
                  opacity: animation,
                    child: GroceryStoreDetails(
                      product: product,
                      onProductAdded: (){
                        bloc.addProduct(product);
                      }
                    ));
              }));
            },
            child: Card(
              elevation: 8,
              shadowColor: Colors.black,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: "list_${product.name}_",
                        child: Image.network(
                          product.image!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text(
                      "\$${product.price}",
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "${product.name}",
                      style:
                          const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Text(
                      "\$${product.weight}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );

    // ListView.builder(
    // padding: const EdgeInsets.only(top: cartBarHeight),
    //   itemCount: bloc.catalog.length,
    //   itemBuilder: (context, index) {
    //     return Container(
    //       height: 100,
    //       color: Colors.primaries[index % Colors.primaries.length],
    //     );
    //   });
  }
}
