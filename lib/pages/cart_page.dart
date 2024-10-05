import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakerv1/components/cart_item.dart';
import 'package:sneakerv1/models/cart.dart';
import 'package:sneakerv1/models/shoe.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
          // heading
            Text(
              'Meu carrinho',
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              ),
            ),

            SizedBox(height: 10,),

            Expanded(
            child: ListView.builder(
              itemCount: value.getUserCart().length,
              itemBuilder: (context, index) {
              // get individual shoe
              Shoe individualShoe = value.getUserCart()[index];

              // return the cart item
              return CartItem(
                shoe: individualShoe,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}