import 'package:flutter/material.dart';
import 'package:sneakerv1/models/shoe.dart';

class Cart extends ChangeNotifier {
  // lista de tênis à venda
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom FREAK', 
      price: '236', 
      imagePath: 'assets/images/ZoomFreak.png', 
      description: 'Se destaque em jogadas rápidas e agressivas.'
      ),

    Shoe(
      name: 'Air Jordan 1',
      price: '220',
      description: 'Tênis marca registrada da estreia de Michael Jordan.',
      imagePath: 'assets/images/Air Jordan 1.png',
      ),

    Shoe(
      name: 'KD Treys', 
      price: '240', 
      imagePath: 'assets/images/KDTrey.png', 
      description: 'Um equilíbrio entre agilidade, estabilidade e capacidade de resposta.',
      ),

    Shoe(
      name: 'Kyrie 6', 
      price: '190', 
      imagePath: 'assets/images/Kyrie6.png',   
      description: 'Controle, cortes rápidos e agilidade geral.'),
  ];

  // lista de itens no carrinho do usuário
  List<Shoe> userCart = [];

  // obter lista de tênis à venda
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // obter carrinho
  List<Shoe> getUserCart() {
    return userCart;
  }

  // adicionar itens ao carrinho
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remover item do carrinho
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
