import 'package:flutter/material.dart';
import "package:flutter_application_1/car/cart_model.dart"; // Importa el modelo del carrito
import 'package:provider/provider.dart';
import '../utils/donut_tile.dart'; // Asegúrate de importar el widget correcto

class PancakeTab extends StatelessWidget {
  // list of donuts
  final List pancakeOnSale = [
    //[ donutFlavor, donutPrice, donutColor, imageName ]
    ["Honey", "45", Colors.blue, "lib/pancakes/pancakes1.png"],
    ["Butter", "45", Colors.red, "lib/pancakes/pancakes2.png"],
    ["Simple", "35", Colors.purple, "lib/pancakes/pancakes3.png"],
    ["Minis", "60", Colors.brown, "lib/pancakes/pancakes4.png"],
    ["Strawberry", "55", Colors.blue, "lib/pancakes/pancakes5.png"],
    ["Chocolate", "60", Colors.red, "lib/pancakes/pancakes6.png"],
    ["Chocolate Chips", "65", Colors.purple, "lib/pancakes/pancakes7.png"],
    ["Full breakfast", "", Colors.brown, "lib/pancakes/pancakes8.png"],
  ];

  PancakeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: pancakeOnSale.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                return DonutTile(
                  donutFlavor: pancakeOnSale[index][0],
                  donutPrice: pancakeOnSale[index][1],
                  donutColor: pancakeOnSale[index][2],
                  imageName: pancakeOnSale[index][3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': pancakeOnSale[index][0],
                      'price': pancakeOnSale[index][1],
                      'color': pancakeOnSale[index][2],
                      'image': pancakeOnSale[index][3],
                    });
                  },
                  onFavoriteToggle: () {
                    ('Favorite for ${pancakeOnSale[index][0]} toggled');
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
                        // Acción para ver el carrito
                        ('View Cart pressed');
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
