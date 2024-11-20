import 'package:apna_store/Screens/model/product.dart';
import 'package:flutter/material.dart';

class ViewProductAtAdmin extends StatefulWidget {
  // Constructor for the ViewProductAtAdmin widget
  const ViewProductAtAdmin({
    super.key,
    required this.product, // Product object that holds all the data
  });

  // Declare a single variable for the passed Product object
  final Product product;

  @override
  State<ViewProductAtAdmin> createState() => _ViewProductAtAdminState();
}

class _ViewProductAtAdminState extends State<ViewProductAtAdmin> {
  bool _isLoading = true;
  // Initial loading state set to true
  void initState() {
    super.initState();
    // Simulate a delay for loading data
    Future.delayed(Duration(seconds: 6), () {
      setState(() {
        _isLoading = false; // After 3 seconds, set loading to false
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display product image
            widget.product.imageUrl.isNotEmpty
                ? Image.asset(widget.product.imageUrl)
                : const SizedBox.shrink(),

            const SizedBox(height: 16),

            // Display product name, category, subtitle, etc.
            Text(
              widget.product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Category: ${widget.product.category}',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),

            Text(
              widget.product.subtitle,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),

            // Product description
            Text(
              widget.product.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Display rating and price details
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  '${widget.product.rating} Rating',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '\$${widget.product.actualPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                ),
                const SizedBox(width: 8),
                Text(
                  '\$${widget.product.discountPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                const SizedBox(width: 8),
                Text(
                  '(-${widget.product.discountPercentage.toStringAsFixed(0)}%)',
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Shop owner and location
            Text(
              'Shop Owner: ${widget.product.shopOwner}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              'Location: ${widget.product.location}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
