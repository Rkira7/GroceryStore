import 'package:flutter/material.dart';
import 'package:grocerystore/Page/grocery_store_home.dart';
import 'package:provider/provider.dart';

import 'Bloc/grocery_store_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GroceryStoreBloc()),
      ],
      child: const MaterialApp(
        home: GrocerystoreHome(),
      ),
    );
  }
}
