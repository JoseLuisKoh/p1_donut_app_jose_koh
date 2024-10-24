import 'package:flutter/material.dart';
import 'package:flutter_application_1/car/cart_model.dart';
import 'package:flutter_application_1/utils/smoothie_tile.dart';
import 'package:provider/provider.dart'; // Asegúrate de importar Provider si no lo tienes ya.

class SmoothieTab extends StatelessWidget {
  final List smoothieOnSale = [
    // [burgerFlavor, burgerPrice, burgerColor, imageName]
    ["Strawberry", "59", Colors.blue, "lib/smoothie/Smoothie1.png"],
    ["Combined", "69", Colors.red, "lib/smoothie/Smoothie2.png"],
    ["Pinnate", "40", Colors.purple, "lib/smoothie/Smoothie3.png"],
    ["Mango", "65", Colors.brown, "lib/smoothie/Smoothie4.png"],
    ["Watermelon", "59", Colors.blue, "lib/smoothie/Smoothie5.png"],
    ["Strawberry and chia", "45", Colors.red, "lib/smoothie/Smoothie6.png"],
    ["Strawberry milkshake", "84", Colors.green, "lib/smoothie/Smoothie7.png"],
    ["Banana", "45", Colors.brown, "lib/smoothie/Smoothie8.png"],
  ];

  SmoothieTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: smoothieOnSale.length,
              padding: const EdgeInsets.all(11),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2.5,
              ),
              itemBuilder: (context, index) {
                return SmoothieTile(
                  smoothieFlavorr: smoothieOnSale[index][0],
                  smoothiePrice: smoothieOnSale[index][1],
                  smoothieColor: smoothieOnSale[index][2],
                  imageName: smoothieOnSale[index][3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': smoothieOnSale[index][0],
                      'price': smoothieOnSale[index][1],
                      'color': smoothieOnSale[index][2],
                      'image': smoothieOnSale[index][3],
                    });
                  },
                  onFavoriteToggle: () {
                    print('Favorite for ${smoothieOnSale[index][0]} toggled');
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
