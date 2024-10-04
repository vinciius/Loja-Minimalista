import 'package:flutter/material.dart';
import 'package:sneakerv1/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom FREAK', 
      price: '236', 
      imagePath: 'assets/images/ZoomFreak.png', 
      description: 'Excel in fast-paced, aggressive play.'
      ),

    Shoe(
      name: 'Air Jordan 1',
      price: '220',
      description: 'Michael Jordans debut signature shoe.',
      imagePath: 'assets/images/Air Jordan 1.png',
      ),

    Shoe(
      name: 'KD Treys', 
      price: '240', 
      imagePath: 'assets/images/KDTrey.png', 
      description: 'A balance of agility, stability, and responsiveness.',
      ),

    Shoe(
      name: 'Kyrie 6', 
      price: '190', 
      imagePath: 'assets/images/Kyrie6.png',   
      description: 'Control, quick cuts, and all-around agility.'),
  ];

  // list of items in user cart
  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }
  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }
  // add items to cart
  void addItemToCart (Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }
  // remove item from cart
  void removeItemFromCart (Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}