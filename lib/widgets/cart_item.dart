import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/providers/carts.dart';

class cartItem extends StatefulWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  Key newkey;

  cartItem(
    this.newkey,
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
  );

  @override
  State<cartItem> createState() => _cartItemState();
}

class _cartItemState extends State<cartItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm"),
              content: const Text("Are you sure you wish to delete this item?"),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text("DELETE")),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("CANCEL"),
                ),
              ],
            );
          },
        );
      },
      key: ValueKey(widget.newkey),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          Provider.of<Cart>(context, listen: false).removeItem(widget.newkey);
        });
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                  child: Text('\$${widget.price}'),
                ),
              ),
            ),
            title: Text(widget.title),
            subtitle: Text('Total: \$${(widget.price * widget.quantity)}'),
            trailing: Text('${widget.quantity} x'),
          ),
        ),
      ),
    );
  }
}
