import 'package:flutter/material.dart';
import 'package:shopapp/screens/cart_screen.dart';
import 'package:shopapp/screens/grid_screen.dart';
import 'package:shopapp/screens/manage_product.dart';
import 'package:shopapp/screens/product_detail_screen.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Shop App'),
          ),
          ListTile(
            title: const Text('Shop'),
            trailing: Icon(Icons.shop),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.of(context).pushNamed(GridScreen.girdScreen);
            },
          ),
        
          ListTile(
            title: const Text('Manage Product'),
            trailing: Icon(Icons.precision_manufacturing_outlined),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(ManageProduct.manageProduct);
            },
            
          ),
        ],
      ),
    );
  }
}
