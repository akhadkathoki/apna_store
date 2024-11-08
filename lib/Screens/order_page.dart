import 'package:apna_store/img_file.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Order'),
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
                return cartItemCard(screenWidth);
              },
            ),
          ),
        ],
      ),
    );
  }

  Container cartItemCard(double screenWidth) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: const BoxDecoration(
        color: Color.fromARGB(200, 255, 220, 164),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: const EdgeInsets.all(15),
      height: 200,
      child: Row(
        children: [
          SizedBox(
            height: 170,
            width: screenWidth * 0.35, // Image size adapts to screen width
            child: Image.network(
              productImg,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product['name'],
                  style: TextStyle(
                    fontSize: screenWidth * 0.05, // Adapt font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product['subtitle'],
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: const Color.fromARGB(212, 104, 104, 104),
                  ),
                  softWrap: true,
                ),
                const SizedBox(height: 5),
                Text(
                  'Seller: ${product['shopOwner']}',
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold),
                  softWrap: true,
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: Text(
                    "${product["name"]} of price \$${product["discountPrice"]} is arriving on 17th Oct, 2024",
                    style: TextStyle(fontSize: screenWidth * 0.037),
                    softWrap: true,
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
