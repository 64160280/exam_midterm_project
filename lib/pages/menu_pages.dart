import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:week04/ColorTheme/color.dart';
import 'package:week04/components/button.dart';
import 'package:week04/components/food_tile.dart';
import 'package:week04/pages/food_details_page.dart';
import 'package:week04/pages/shop.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    super.initState();
    // Fetch menu data when the page is loaded
    fetchMenuData();
  }

  // Function to fetch menu data
  void fetchMenuData() async {
    try {
      final shop = context.read<Shop>();
      await shop.fetchMenu();
    } catch (e) {
      // Handle errors, e.g., show an error message
      print('Error fetching menu data: $e');
    }
  }

  void navigateFoodItemDetailPage(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: Icon(
        //   Icons.menu,
        //   color: Colors.grey[900],
        // ),
        centerTitle: true,
        title: Text(
          'Menu Food List',
          style: TextStyle(color: Colors.grey[900]),
        ),
        actions: [
          // cart button
          // IconButton(
          //   onPressed: () => Navigator.pushNamed(context, '/cartpage'),
          //   icon: const Icon(Icons.shopping_cart),
          // ),
        ],
      ),
      body: Consumer<Shop>(
        builder: (context, shop, child) {
          final foodMenu = shop.foodMenu;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: foodMenu.length,
                  itemBuilder: (context, index) => FoodTile(
                    food: foodMenu[index],
                    onTap: () => navigateFoodItemDetailPage(index),
              
                  ),
                  
                ),
              ),
              const SizedBox(height: 25.0),
            ],
          );
        },
      ),
    );
  }
}
