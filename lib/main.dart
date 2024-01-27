import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week04/pages/cart_page.dart';
import 'package:week04/pages/shop.dart';
import './pages/intro_pages.dart';
import 'pages/menu_pages.dart';


void main(){
  runApp(ChangeNotifierProvider(create: (context) => Shop(),
  child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MenuPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
        '/cartpage': (context) => const CartPage(),
      }
    );
  }
}