import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocerystore/Bloc/grocery_store_bloc.dart';
import 'package:grocerystore/Page/grocery_store_cart.dart';
import 'package:grocerystore/Page/grocery_store_list.dart';
import 'package:grocerystore/grocery_provider.dart';

const _backgroundColor = Color(0xFFF6F5F2);
const cartBarHeight = 100.0;
const _panelTrasition = Duration(milliseconds: 500);

class GrocerystoreHome extends StatefulWidget {
  const GrocerystoreHome({Key? key}) : super(key: key);

  @override
  State<GrocerystoreHome> createState() => _GrocerystoreHomeState();
}

class _GrocerystoreHomeState extends State<GrocerystoreHome> {
  final bloc = GroceryStoreBloc();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (double.parse(details.delta.dy.toString()) < -7) {
      bloc.changeToCart();
    } else if (double.parse(details.delta.dy.toString()) < 12) {
      bloc.changeToNormal();
    }
  }

  double _getToWhitePanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return -cartBarHeight + kToolbarHeight;
    } else if (state == GroceryState.cart) {
      return -(size.height - kToolbarHeight - cartBarHeight / 2);
    }
    return 0.0;
  }

  double _getToBlackPanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return size.height - cartBarHeight;
    } else if (state == GroceryState.cart) {
      return cartBarHeight / 2;
    }
    return 0.0;
  }

  double _getTopForAppBar(GroceryState state) {
    if (state == GroceryState.normal) {
      return 0.0;
    } else if (state == GroceryState.cart) {
      return -cartBarHeight;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GroceryProvider(
      bloc: bloc,
      child: AnimatedBuilder(
          animation: bloc,
          builder: (context, state) {
            return Scaffold(
              body: Stack(
                children: [
                  AnimatedPositioned(
                      duration: _panelTrasition,
                      curve: Curves.decelerate,
                      left: 0,
                      right: 0,
                      top: _getToWhitePanel(bloc.groceryState, size),
                      height: size.height - kToolbarHeight,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: const GroceryStoreList(),
                        ),
                      )),
                  AnimatedPositioned(
                      duration: _panelTrasition,
                      curve: Curves.decelerate,
                      left: 0,
                      right: 0,
                      top: _getToBlackPanel(bloc.groceryState, size),
                      height: size.height - kToolbarHeight,
                      child: GestureDetector(
                        onVerticalDragUpdate: _onVerticalGesture,
                        child: Container(
                          color: Colors.black,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  height: 50,
                                  child: AnimatedSwitcher(
                                    duration: _panelTrasition,
                                    child: bloc.groceryState == GroceryState.normal ? Row(
                                      children: [
                                        const Text("Cart",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.white)),
                                        Expanded(
                                            child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Row(
                                                children: List.generate(
                                                    bloc.cart.length,
                                                    (index) => Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          8.0),
                                                              child: Hero(
                                                                tag: "list_${bloc.cart[index].product.name!}_details",
                                                                child: CircleAvatar(
                                                                  backgroundImage:
                                                                      NetworkImage(bloc.cart[index].product.image!),
                                                                ),
                                                              ),
                                                            ),
                                                            CircleAvatar(
                                                              radius: 10,
                                                              backgroundColor:
                                                                  Colors.red,
                                                              child: Text(
                                                                "${bloc.cart[index].quantity}",
                                                                style:
                                                                    const TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                              ),
                                                            )
                                                          ],
                                                        ))),
                                          ),
                                        )),
                                        CircleAvatar(
                                          backgroundColor: Colors.amber,
                                          child: Text(
                                            "${bloc.totalCartElements()}",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                  fontWeight: FontWeight.bold
                                                ),
                                          ),
                                        ),
                                      ],
                                    )
                                        :SizedBox.shrink(),
                                  ),
                                ),
                              ),
                             Expanded(child: GroceryStoreCart())
                            ],
                          ),
                        ),
                      )),
                  AnimatedPositioned(
                      duration: _panelTrasition,
                      curve: Curves.decelerate,
                      left: 0,
                      right: 0,
                      top: _getTopForAppBar(bloc.groceryState),
                      child: const AppBarGrocery()),
                ],
              ),
            );
          }),
    );
  }
}

class AppBarGrocery extends StatelessWidget {
  const AppBarGrocery({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: kToolbarHeight,
      color: _backgroundColor,
      child: Row(
        children: [
          const BackButton(
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          const Expanded(
              child: Text(
            "Fruits and vegetables",
            style: TextStyle(color: Colors.black),
          )),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
    );
  }
}
