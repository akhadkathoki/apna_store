import 'package:apna_store/Screens/paymentSplashScreen.dart';
import 'package:apna_store/img_file.dart';
import 'package:flutter/material.dart';

class AddToCartPage extends StatefulWidget {
  const AddToCartPage({super.key});

  @override
  _AddToCartPageState createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  int quantity = 1;

  // Sample product data
  final Map<String, dynamic> product = {
    "name": "Bamboo Shoe Rack",
    "subtitle": "Eco-friendly shoe rack",
    "description": "A sustainable and stylish shoe rack made from bamboo.",
    "rating": 4.3,
    "actualPrice": 100.0,
    "discountPrice": 90.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "Wallet"],
    "shopOwner": "EcoHome",
    "location": "Portland, USA",
    "highlights": ["Eco-friendly bamboo", "Compact design", "Easy to assemble"],
    "image": "https://example.com/images/bamboo_shoe_rack.jpg"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add to Cart'),
        backgroundColor: const Color(0xFF4F2D19),
      ),
      body: Column(
        children: [
          // Wrapping ListView.builder inside Flexible to avoid layout issues
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: 10,
              itemBuilder: (context, index) {
                return cartItemCard(context);
              },
            ),
          ),
          // Add to Cart & Buy Now Buttons
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 221, 181),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for Buy Now
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                PaymentSuccessSplashScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4F2D19),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Card cartItemCard(BuildContext context) {
    return Card(
      color: Color.fromARGB(200, 255, 220, 164),
      elevation: 0,
      child: ListTile(
        leading: SizedBox(
          // height: MediaQuery.of(context).size.width * 0.4,
          // width: MediaQuery.of(context).size.width * 0.3,
          height: 100,
          child: Image.network(
            productImg,
            fit: BoxFit.fitHeight,
          ),
        ),
        title: Text(
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          product['name'],
          style: const TextStyle(
            color: Color.fromARGB(255, 102, 48, 17),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          product['subtitle'],
          style: const TextStyle(
            fontSize: 12,
            color: Color.fromARGB(170, 79, 45, 25),
          ),
        ),
        trailing: Text(
          '\$${product['discountPrice']}',
          style: const TextStyle(
            fontSize: 20,
            backgroundColor: Color.fromARGB(35, 123, 45, 0),
            fontWeight: FontWeight.bold,
          ),
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     // Product image and details section
          //     Row(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         // Use MediaQuery to make image responsive
          //         SizedBox(
          //           height: MediaQuery.of(context).size.width * 0.4,
          //           width: MediaQuery.of(context).size.width * 0.3,
          //           child: Image.network(
          //             productImg,
          //             fit: BoxFit.fitHeight,
          //           ),
          //         ),
          //         const SizedBox(width: 10),
          //         // Product name, subtitle, and price details
          //         Expanded(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             children: [
          //               Text(
          //                 overflow: TextOverflow.ellipsis,
          //                 maxLines: 1,
          //                 product['name'],
          //                 style: const TextStyle(
          //                   color: Color(0xFF4F2D19),
          //                   fontSize: 25,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //               SizedBox(height: 5),
          //               // Seller and price row
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Row(
          //                     children: [
          //                       const Icon(Icons.star, color: Colors.amber),
          //                       const SizedBox(width: 4.0),
          //                       Text(
          //                         '${product['rating']}',
          //                         style: const TextStyle(
          //                             fontSize: 18, fontWeight: FontWeight.bold),
          //                       ),
          //                     ],
          //                   ),
          //                   Text(
          //                     '\$${product['discountPrice']}',
          //                     style: const TextStyle(
          //                       fontSize: 20,
          //                       backgroundColor: Color.fromARGB(35, 123, 45, 0),
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 children: [
          //                   IconButton(
          //                     onPressed: () {
          //                       setState(() {
          //                         if (quantity > 1) quantity--;
          //                       });
          //                     },
          //                     icon: Container(
          //                       padding: const EdgeInsets.symmetric(
          //                           horizontal: 2, vertical: 2),
          //                       decoration: const BoxDecoration(
          //                         color: Color(0xFF4F2D19),
          //                         borderRadius:
          //                             BorderRadius.all(Radius.circular(5)),
          //                       ),
          //                       child: const Icon(
          //                         Icons.remove,
          //                         color: Color.fromARGB(255, 255, 217, 181),
          //                       ),
          //                     ),
          //                   ),
          //                   Text(
          //                     '$quantity',
          //                     style: const TextStyle(
          //                         fontSize: 22, fontWeight: FontWeight.bold),
          //                   ),
          //                   IconButton(
          //                     onPressed: () {
          //                       setState(() {
          //                         quantity++;
          //                       });
          //                     },
          //                     icon: Container(
          //                       padding: const EdgeInsets.symmetric(
          //                           horizontal: 2, vertical: 2),
          //                       decoration: const BoxDecoration(
          //                         color: Color(0xFF4F2D19),
          //                         borderRadius:
          //                             BorderRadius.all(Radius.circular(5)),
          //                       ),
          //                       child: const Icon(
          //                         Icons.add,
          //                         color: Color.fromARGB(255, 255, 217, 181),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   // Remove Button
          //                   OutlinedButton(
          //                     onPressed: () {
          //                       // Action for Remove
          //                     },
          //                     style: OutlinedButton.styleFrom(
          //                       padding: const EdgeInsets.symmetric(
          //                           vertical: 10, horizontal: 20),
          //                       side: const BorderSide(
          //                           color: Color(0xFF4F2D19)), // Outline color
          //                       shape: RoundedRectangleBorder(
          //                         borderRadius: BorderRadius.circular(20.0),
          //                       ),
          //                     ),
          //                     child: const Text(
          //                       'Cancel',
          //                       style: TextStyle(
          //                           fontSize: 16, fontWeight: FontWeight.bold),
          //                     ),
          //                   ),
          //                   const SizedBox(width: 18),
          //                   // Buy Now Button
          //                   SizedBox(
          //                     height: 40,
          //                     child: ElevatedButton(
          //                       onPressed: () {
          //                         // Action for Buy Now
          //                       },
          //                       style: ElevatedButton.styleFrom(
          //                         backgroundColor: const Color(0xFF4F2D19),
          //                         padding:
          //                             const EdgeInsets.symmetric(horizontal: 25),
          //                         shape: RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.circular(22.0),
          //                         ),
          //                       ),
          //                       child: const Text(
          //                         'Buy',
          //                         style: TextStyle(
          //                             fontSize: 16, fontWeight: FontWeight.bold),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
