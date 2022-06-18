import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/carts.dart';

import 'package:shopapp/screens/cart_screen.dart';
import 'package:shopapp/screens/form_screen.dart';
import 'package:shopapp/screens/grid_screen.dart';
import 'package:shopapp/screens/manage_product.dart';
import 'package:shopapp/screens/product_detail_screen.dart';
import 'providers/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:((context) =>  Products())),
        ChangeNotifierProvider(create: ((context) => Cart()))
    
      ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(secondary: Color.fromARGB(255, 169, 93, 183)
        )
        
        ),
        initialRoute: FormScreen.formScreen,
        routes: {
          GridScreen.girdScreen:(context) => GridScreen(),
          ProductDetailScreen.DetailScreen:(context) => ProductDetailScreen(),
         CartScreen.routeName:(context) => CartScreen(),
         ManageProduct.manageProduct:(context) => ManageProduct(),
         FormScreen.formScreen:(context) => FormScreen(),
        },
      ),
    );
  }
}

