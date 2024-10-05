import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakerv1/models/cart.dart';
import 'package:sneakerv1/models/shoe.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8)
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: SizedBox(
          height: 50,
          width: 100,
          child: Image.asset(widget.shoe.imagePath)),
        title: Text(
          widget.shoe.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            ),
          ),
        subtitle: Text('\$${widget.shoe.price}'),
        trailing: IconButton(
          onPressed: removeItemFromCart, 
          icon: Icon(
            Icons.delete,
            ),
        ),
      ),
    );
  }
}