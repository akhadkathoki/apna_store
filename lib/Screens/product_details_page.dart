import 'package:apna_store/Screens/add_to_cart_page.dart';
import 'package:apna_store/img_file.dart'; // Assuming you have this for your image file
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
    "highlights": [
      "Eco-friendly bamboo",
      "Eco-friendly bamboo",
      "Eco-friendly bamboo",
      "Eco-friendly bamboo",
      "Eco-friendly bamboo",
      "Compact design",
      "Easy to assemble"
    ],
    "image": "https://example.com/images/bamboo_shoe_rack.jpg"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        children: [
          // Product image
          Image.network(
            productImg,
            height: 350,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16.0),

          // Product name and subtitle
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 221, 181),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['name'],
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4F2D19), // Custom theme color
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            product['subtitle'],
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 104, 104, 104)),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Spacer(),
                      const Spacer(),
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_outline,
                            size: 30,
                            color: Color(0xFF4F2D19),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),

                // Price and discount information
                Row(
                  children: [
                    Text(
                      '\$${product['actualPrice']}',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 95, 94, 94),
                          decoration: TextDecoration.lineThrough),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      '-${product['discountPercentage']}% Off',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      '\$${product['discountPrice']}',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4F2D19), // Custom theme color
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          // Rating and Shop info
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 221, 181),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        const SizedBox(width: 4.0),
                        Text(
                          '${product['rating']}  Rating',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      'Seller: ${product['shopOwner']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),

                // Description
                Text(
                  product['description'],
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16.0),

                // Quantity increment/decrement section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Quantity',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) quantity--;
                            });
                          },
                          icon: const Icon(
                            Icons.remove_circle_outline,
                            color: Color(0xFF4F2D19),
                          ),
                        ),
                        Text(
                          '$quantity',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: const Icon(Icons.add_circle_outline),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),

          // Highlights
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 221, 181),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Highlights',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 3,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: product['highlights']
                      .map<Widget>((highlight) => Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF4F2D19),
                                ),
                                const SizedBox(width: 8.0),
                                Text(highlight),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),

          // Payment options

          // Add to Cart & Buy Now Buttons
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 221, 181),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50.0,
                    child: OutlinedButton(
                      onPressed: () {
                        // Action for Add to Cart
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddToCartPage()));
                      },
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for Buy Now
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
}
