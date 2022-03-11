import 'package:flutter/material.dart';
import 'package:grocerystore/grocery_product.dart';

class GroceryStoreDetails extends StatefulWidget {
  final GroceryProduct product;
  final VoidCallback onProductAdded;

  const GroceryStoreDetails({Key? key, required this.product, required this.onProductAdded})
      : super(key: key);

  @override
  State<GroceryStoreDetails> createState() => _GroceryStoreDetailsState();
}

class _GroceryStoreDetailsState extends State<GroceryStoreDetails> {

  String heroTag = "";

  void _addToCart(BuildContext context){
    setState(() {
      heroTag = "details";
    });
    widget.onProductAdded();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                      child: Hero(
                    tag: "list_${widget.product.name}_$heroTag",
                        child: Image.network(
                          widget.product.image!,
                          height: MediaQuery.of(context).size.height * 0.4,
                          fit: BoxFit.contain,
                        ),
                  )),

                  Text("${widget.product.name}",
                    style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(height: 15),
                  Text("\$${widget.product.weight}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.grey),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text("\$${widget.product.price}",
                        style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "About the roduct",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "${widget.product.decription}",
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
                        _addToCart(context);
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
    );
  }
}
