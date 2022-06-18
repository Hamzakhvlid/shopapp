import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/carts.dart';
import 'package:shopapp/providers/product.dart';
import 'package:shopapp/screens/product_detail_screen.dart';

// ignore: use_key_in_widget_constructors
class Gridtile extends StatefulWidget {
  @override
  State<Gridtile> createState() => _GridtileState();
}

class _GridtileState extends State<Gridtile> {
  bool undo = true;
  void doNavigation(BuildContext ctx, var data) {
    Navigator.of(ctx)
        .pushNamed(ProductDetailScreen.DetailScreen, arguments: data);
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);

    return Container(
      padding: const EdgeInsets.all(5),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            onTap: () => doNavigation(context, product.title),
            splashColor: const Color.fromARGB(255, 193, 27, 27),
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
                  trailing: IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Your item is aded succesfully'),
                            duration: Duration(seconds: 2),
                            action: SnackBarAction(
                                label: 'udno',
                                onPressed: () {
                                  undo = false;
                                })));

                        Future.delayed(Duration(seconds: 3), () {
                          if (undo)
                            cart.addItem(
                                product.id, product.price, product.title);
                        });
                      }),
                )),
          )),
    );
  }
}
