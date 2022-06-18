import 'package:flutter/material.dart';
import 'package:shopapp/screens/form_screen.dart';

class ManageProduct extends StatefulWidget {
  @override
  State<ManageProduct> createState() => _ManageProductState();
  static String manageProduct = '/ManagePRoduct';
}

class _ManageProductState extends State<ManageProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Product'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(FormScreen.formScreen);
              },
              icon: Icon(Icons.add)),
        ],
      ),
    );
  }
}
