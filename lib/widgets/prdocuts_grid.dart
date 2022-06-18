import 'package:flutter/material.dart';
import 'package:shopapp/providers/products.dart';
import 'grid_tiles.dart';
import 'package:shopapp/providers/product.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatefulWidget {
  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Products>(context);

    var loadedProducts = productData.items;
    
    

    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        child: Gridtile(),
      ),
      itemCount: loadedProducts.length,
    );
  }
}
