import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:week04/ColorTheme/color.dart';
import 'package:week04/components/button.dart';
import 'package:week04/pages/food.dart';
import 'package:week04/pages/shop.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  const FoodDetailsPage({Key? key, required this.food}) : super(key: key);

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantityCount = 0;

  void decrementQuantity() {
    setState(() {
      quantityCount = quantityCount > 0 ? quantityCount - 1 : 0;
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  // add to cart
  void addToCart() {
    // Only add to cart if there is sth in cart
    if (quantityCount > 0) {
      // get access to shop
      final shop = context.read<Shop>();
      // add to cart
      shop.addToCart(widget.food, quantityCount);
      // let the user know  it was successful
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            "Add to cart Successfully",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // pop once to remove dialog box
                  Navigator.pop(context);
                  // php again to go previous page
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.done, color: Colors.white))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          //list view of detail
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  //image
                  Image.asset(widget.food.imagePath, height: 200),
                  const SizedBox(height: 25),

                  // // rating
                  // Row(
                  //   children: [
                  //     // Star icon
                  //     Icon(
                  //       Icons.star,
                  //       color: Colors.yellow[800],
                  //     ),
                  //     const SizedBox(width: 5),
                  //     Text(
                  //       widget.food.rating,
                  //       style: TextStyle(
                  //         color: Colors.grey[600],
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 10),

                  // foodname
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.food.name,
                        style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.pink,
                        size: 24.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),
                  // description
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    "ซูชิทูน่าเป็นเมนูอาหารญี่ปุ่นที่ได้รับความนิยมเป็นอย่างมาก ด้วยความอร่อยของเนื้อปลาทูน่าที่สดใหม่ บวกกับรสชาติข้าวญี่ปุ่นที่เหนียวนุ่มและน้ำส้มสายชูข้าวที่หอมหวาน ทำให้ซูชิทูน่าเป็นเมนูที่ใครได้ลองก็ต้องติดใจ นอกจากความอร่อยแล้ว ซูชิทูน่ายังมีคุณค่าทางโภชนาการสูงอีกด้วย เนื้อปลาทูน่าอุดมไปด้วยโปรตีน วิตามิน และเกลือแร่ต่างๆ หลายชนิด เช่น วิตามินบี 12 ธาตุเหล็ก และโอเมก้า-3 ซึ่งมีประโยชน์ต่อร่างกายมากมาย เช่น ช่วยบำรุงสมอง บำรุงระบบประสาท ช่วยลดความเสี่ยงในการเกิดโรคหัวใจและหลอดเลือด เป็นต้น",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  )
                ],
              ),
            ),
          ),
          // //price + quantity + add to cart button
          // Container(
          //   color: primaryColor,
          //   padding: EdgeInsets.all(20),
          //   child: Column(
          //     children: [
          //       //price + quantity
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           // price
          //           Text(
          //             "\$${widget.food.price}",
          //             style: const TextStyle(
          //               color: Colors.white,
          //               fontWeight: FontWeight.bold,
          //               fontSize: 18,
          //             ),
          //           ),
          //           Row(
          //             children: [
          //               //minus button
          //               Container(
          //                 decoration: BoxDecoration(
          //                   color: secondColor,
          //                   shape: BoxShape.circle,
          //                 ),
          //                 child: IconButton(
          //                   icon: Icon(Icons.remove),
          //                   onPressed: decrementQuantity,
          //                 ),
          //               ),
          //               SizedBox(
          //                 width: 40,
          //                 child: Center(
          //                   child: Text(
          //                     quantityCount.toString(),
          //                     style: const TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                       color: Colors.white,
          //                       fontSize: 18,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               Container(
          //                 decoration: BoxDecoration(
          //                   color: secondColor,
          //                   shape: BoxShape.circle,
          //                 ),
          //                 child: IconButton(
          //                   icon: Icon(Icons.add),
          //                   onPressed: incrementQuantity,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //       const SizedBox(height: 25),

          //       //add to cart button
          //       MyButton(onTap: addToCart, text: "Add To Cart"),
          //       const SizedBox(height: 15),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
