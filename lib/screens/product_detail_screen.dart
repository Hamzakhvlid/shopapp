import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/product.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/widgets/app_drawer.dart';

class ProductDetailScreen extends StatelessWidget {
  var title;

  static String DetailScreen = "/ProductDetailScreen";
  @override
  Widget build(BuildContext context) {
    var titleText = ModalRoute.of(context)?.settings.arguments as String;
    var loadeditem = Provider.of<Products>(context,listen: false).findByTitle(titleText);
    return Scaffold(
    
      appBar: AppBar(title: Text(loadeditem.title,),
      ),
      body: Center(
        child: Text("Detail"),
        
      ),
    );
  }
}
