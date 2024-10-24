import 'package:flutter/material.dart';
import 'package:flutter_application_1/car/cart_model.dart'; // Asegúrate de importar el modelo del carrito
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
          tabBarTheme: const TabBarTheme(indicatorColor: Colors.pink)),
    );
  }
}
