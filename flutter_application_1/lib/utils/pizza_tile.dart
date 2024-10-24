import 'package:flutter/material.dart';

class PizzaTile extends StatelessWidget {
  final String pizzaFlavor;
  final String pizzaPrice;
  final dynamic pizzaColor;
  final String imageName;
  final VoidCallback onAddToCart; // Callback para agregar al carrito
  final VoidCallback
      onFavoriteToggle; // Callback para cambiar el estado del favorito

  // Constructor para recibir los valores
  const PizzaTile({
    super.key,
    required this.pizzaFlavor,
    required this.pizzaPrice,
    required this.pizzaColor,
    required this.imageName,
    required this.onAddToCart,
    required this.onFavoriteToggle, // Para manejar el icono de favorito
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
            color: pizzaColor[100], borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: pizzaColor[200],
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: Text(
                    "\$$pizzaPrice",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: pizzaColor[800]),
                  ),
                )
              ],
            ),
            //Donut picture
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Image.asset(imageName),
            ),
            //Donut flavor Tex
            Text(
              pizzaFlavor,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text("Dukin's", style: TextStyle(color: Colors.grey[600])),
            ////Love icon + add button
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //love icon
                  Icon(
                    Icons.favorite,
                    color: Colors.pink[400],
                  ),
                  //plus Button
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: onAddToCart,
                    color: Colors.grey[800],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
