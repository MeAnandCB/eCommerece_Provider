import 'package:flutter/material.dart';
import 'package:mechine_test_sample/Hive/Product_adaptor.dart';
import 'package:mechine_test_sample/ModelClass/Product_model.dart';
import 'package:mechine_test_sample/Screens/HomeScreen.dart';
import 'package:mechine_test_sample/cart/cart.dart';

import 'package:mechine_test_sample/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  // Register Hive adapter
  Hive.registerAdapter(ProductAdapter());

  // Open 'cart' box
  await Hive.openBox<Product>('cart');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Cart()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Store API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        CartScreen.routeName: (context) => CartScreen(),
      },
    );
  }
}
