import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/carts.dart';
import 'package:shopapp/providers/product.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/screens/product_detail_screen.dart';

class Gridtile extends StatefulWidget {
  @override
  State<Gridtile> createState() => _GridtileState();
}

class _GridtileState extends State<Gridtile> {
  void doNavigation(BuildContext ctx, var data) {
    Navigator.of(ctx)
        .pushNamed(ProductDetailScreen.DetailScreen, arguments: data);
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context,listen: false);
    print(product.isFavorite);
    print("-----------------------");
    return Container(
      padding: EdgeInsets.all(5),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            onTap: () => doNavigation(context, product.title),
            splashColor: Color.fromARGB(255, 193, 27, 27),
            child: GridTile(
                child: Image.network(product.imageUrl, fit: BoxFit.cover),
                footer: GridTileBar(
                  title: Text(
                    product.title,
                    textAlign: TextAlign.center,
                  ),
                  // ignore: prefer_const_constructors
                  leading: IconButton(
                      icon: Icon(product.isFavorite == true
                          ? Icons.favorite
                          : Icons.favorite_border),
                      onPressed: () => product.toggleButton()),
                  backgroundColor: Colors.black87,
                  trailing: IconButton(icon: Icon(Icons.shopping_cart),onPressed: ()=>
                  cart.addItem(product.id, product.price, product.title)
                  ),
                )),
          )),
    );
  }
}
