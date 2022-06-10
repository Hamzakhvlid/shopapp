import 'package:provider/provider.dart';
import 'package:shopapp/providers/carts.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/screens/cart_screen.dart';
import 'package:shopapp/widgets/app_drawer.dart';
import 'package:shopapp/widgets/badge.dart';
import 'package:shopapp/widgets/prdocuts_grid.dart';

import 'package:flutter/material.dart';



enum FilterOptions {
  Favorites,
  All,
}

class GridScreen extends StatefulWidget {
  static String girdScreen = "/gridScreen";

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  void moveScreen() {}
  @override
  Widget build(BuildContext context) {
    var productContainer = Provider.of<Products>(context, listen: true);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("Shop app"), actions: [
        //Here we add icon button i.e with icon more vert
        PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (_) => [
            PopupMenuItem(
              child: Text("only fav"),
              value: FilterOptions.Favorites,
            ),
            PopupMenuItem(
              child: Text('All items'),
              value: FilterOptions.All,
            )
          ],
          onSelected: (FilterOptions selectedValue) {
            print("selected value is " + selectedValue.toString());
            if (selectedValue == FilterOptions.Favorites) {
              productContainer.showfavortie();
            } else {
              productContainer.showAll();
            }
          },
        ),
        Consumer<Cart>(
            builder: (_, cartData, ch) => Badge(
                value: cartData.itemCount.toString(),
                color: Colors.red,
                child:  IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: ()=>Navigator.of(context).pushNamed(CartScreen.routeName)
                  
                )
                
                
                ))
      ]),
      body: ProductsGrid(),
    );
  }
}
