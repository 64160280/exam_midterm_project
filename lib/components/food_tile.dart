import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    Key? key,
    required this.food,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            Image.asset(
              food.imagePath,
              height: 60,
            ),
            
            SizedBox(width: 20), // Add spacing between image and text
            
            // Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.name ?? 'No Name',
                  style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                ),
                
                // Price and Rating in the same row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Price
                    Text(
                      '\$' + (food.price != null ? food.price! : '0.0'),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                    
                    // // Rating
                    // Row(
                    //   children: [
                    //     Icon(
                    //       Icons.star,
                    //       color: Colors.yellow[700],
                    //     ),
                    //     Text(
                    //       food.rating ?? '0.0',
                    //       style: TextStyle(color: Colors.grey),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
