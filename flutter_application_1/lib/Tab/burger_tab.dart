import 'package:flutter/material.dart';
import 'package:flutter_application_1/car/cart_model.dart';
import 'package:flutter_application_1/utils/burger_tile.dart';
import 'package:provider/provider.dart'; // Asegúrate de importar Provider si no lo tienes ya.

class BurgerTab extends StatelessWidget {
  final List burgerOnSale = [
    // [burgerFlavor, burgerPrice, burgerColor, imageName]
    ["Double meat", "120", Colors.blue, "lib/burger_image/hamburguesa1.png"],
    ["Simple meat", "80", Colors.red, "lib/burger_image/hamburguesa2.png"],
    ["Jalapeño", "84", Colors.purple, "lib/burger_image/hamburguesa3.png"],
    ["Double Cheese", "100", Colors.brown, "lib/burger_image/hamburguesa4.png"],
    ["Double", "110", Colors.blue, "lib/burger_image/hamburguesa5.png"],
    ["Family combo", "269", Colors.red, "lib/burger_image/hamburguesa6.png"],
    [
      "Double meat and cheese",
      "169",
      Colors.purple,
      "lib/burger_image/hamburguesa7.png"
    ],
    ["Simple", "45", Colors.brown, "lib/burger_image/hamburguesa8.png"],
  ];

  BurgerTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: burgerOnSale.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                return BurgerTile(
                  burgerFlavorr: burgerOnSale[index][0],
                  burgerPrice: burgerOnSale[index][1],
                  burgerColor: burgerOnSale[index][2],
                  imageName: burgerOnSale[index][3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': burgerOnSale[index][0],
                      'price': burgerOnSale[index][1],
                      'color': burgerOnSale[index][2],
                      'image': burgerOnSale[index][3],
                    });
                  },
                  onFavoriteToggle: () {
                    print('Favorite for ${burgerOnSale[index][0]} toggled');
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
