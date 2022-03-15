import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../grocery_product.dart';

enum GroceryState{
  normal,
  details,
  cart
}

class GroceryStoreBloc with ChangeNotifier{
  GroceryState groceryState = GroceryState.normal;
  List<GroceryProduct> catalog = List.unmodifiable(groceryProducts);
  List<GroceryProductItem> cart = [];
  StreamController<String> streamController = StreamController();
  Stream<String> get streamTag => streamController.stream;

  void changeToNormal(){
    groceryState = GroceryState.normal;
    notifyListeners();
  }

  void changeToCart(){
    groceryState = GroceryState.cart;
    notifyListeners();
  }

  void addProduct(GroceryProduct product){
    for(GroceryProductItem item in cart){
      if(item.product.name == product.name){
          item.increment();
          notifyListeners();
          return;
        }
      }

    cart.add(GroceryProductItem(product: product));
    notifyListeners();
  }

  int totalCartElements(){
    return  cart.fold<int>(0, (previousValue, element) => previousValue+element.quantity);
  }

  double totalPriceCart(){
    return  cart.fold<double>(0.0, (previousValue, element) => previousValue + (element.quantity*element.product.price!));
  }

  void deleteProduct(GroceryProductItem productItem){
    cart.remove(productItem);
    notifyListeners();

  }

  void addToCart(BuildContext context, onProductAdded){
    onProductAdded();
    streamController.add("details");
    Navigator.of(context).pop();
  }
}

class GroceryProductItem {
  int quantity;
  final GroceryProduct product;

  GroceryProductItem({this.quantity = 1 , required this.product});

  void increment(){
    quantity++;
  }

  void decrement(){}



}