import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tab/pizza_tab.dart';
import 'package:flutter_application_1/car/cart_model.dart';
import 'package:flutter_application_1/utils/pizza_tile.dart';
import 'package:provider/provider.dart'; // Asegúrate de importar Provider si no lo tienes ya.

class PizzaTab extends StatelessWidget {
  final List pizzaOnSale = [
    // [burgerFlavor, burgerPrice, burgerColor, imageName]
    ["Olive", "129", Colors.blue, "lib/Pizza/pizza1.png"],
    ["Pizza Big", "250", Colors.red, "lib/Pizza/pizza2.png"],
    ["Peperoni", "130", Colors.purple, "lib/Pizza/pizza3.png"],
    ["Extra Cheese", "120", Colors.brown, "lib/Pizza/pizza4.png"],
    ["Sausage", "145", Colors.blue, "lib/Pizza/pizza5.png"],
    ["Pastor", "165", Colors.red, "lib/Pizza/pizza6.png"],
    ["Italian", "189", Colors.purple, "lib/Pizza/pizza7.png"],
    ["Mixed", "290", Colors.brown, "lib/Pizza/pizza8.png"],
  ];

  PizzaTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: pizzaOnSale.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                return PizzaTile(
                  pizzaFlavor: pizzaOnSale[index][0],
                  pizzaPrice: pizzaOnSale[index][1],
                  pizzaColor: pizzaOnSale[index][2],
                  imageName: pizzaOnSale[index][3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': pizzaOnSale[index][0],
                      'price': pizzaOnSale[index][1],
                      'color': pizzaOnSale[index][2],
                      'image': pizzaOnSale[index][3],
                    });
                  },
                  onFavoriteToggle: () {
                    print('Favorite for ${pizzaOnSale[index][0]} toggled');
                  },
                );
              },
            ),
          ),
          // Barrita inferior para mostrar el total del carrito
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cart.totalItems} Items | \$${cart.totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Delivery Charges Included',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.pink, // Color del botón "View Cart"
                      ),
                      onPressed: () {
                        print('View Cart pressed');
                      },
                      child: const Text('View Cart'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
