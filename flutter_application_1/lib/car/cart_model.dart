import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // Lista de items en el carrito
  final List<Map<String, dynamic>> _cartItems = [];
  double _totalPrice = 0.0;

  // Obtener la lista de artículos en el carrito
  List<Map<String, dynamic>> get cartItems => _cartItems;

  // Obtener el precio total
  double get totalPrice => _totalPrice;

  // Añadir un donut al carrito
  void addToCart(Map<String, dynamic> donut) {
    _cartItems.add(donut);
    _totalPrice += double.parse(donut['price']);
    notifyListeners(); // Notifica a los widgets dependientes que el carrito ha cambiado
  }

  // Obtener el número total de artículos en el carrito
  int get totalItems => _cartItems.length;

  // Vaciar el carrito (si es necesario)
  void clearCart() {
    _cartItems.clear();
    _totalPrice = 0.0;
    notifyListeners();
  }
}
