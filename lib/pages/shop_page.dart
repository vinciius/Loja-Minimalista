import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakerv1/components/shoe_tile.dart';
import 'package:sneakerv1/models/cart.dart';
import 'package:sneakerv1/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert the user, shoe successfully added
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text('Produto adicionado ao carrinho!',),
      content: Text('Veja seu carrinho',),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search bar
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary, 
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pesquisar',
                  style: TextStyle(
                    color: Colors.grey
                    ),
                  ),
                Icon(Icons.search),
              ],
            ),
          ),
          // message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'Modelo de aplicativo de loja virtual 😁',
              style: TextStyle(color: Colors.black),
              ),
          ),
          // hot picks
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Em Destaque 🔥',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                  ),
                Text(
                  'Ver Todos',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
      
          const SizedBox(height: 10),
      
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // get a shoe from shop list
                Shoe shoe = value.getShoeList()[index];

                //return the shoe
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addShoeToCart(shoe),
                );
              },
            ),
          ),
      
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
            child: Divider(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}