import 'package:apna_store/models/product.dart';
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
  bool _isLoading = true; // Initial loading state set to true

  @override
  void initState() {
    super.initState();

    // Simulate a delay for loading data
    Future.delayed(const Duration(seconds: 3), () {
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
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Display product image
                    widget.product.imageUrl.isNotEmpty
                        ? Center(
                            child: Image.network(
                              widget.product.imageUrl,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Center(
                            child: Text(
                              "No Image Available",
                              style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color: Colors.grey,
                              ),
                            ),
                          ),

                    const SizedBox(height: 16),

                    // Display product name
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Display category
                    Text(
                      'Category: ${widget.product.category}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Display subtitle
                    Text(
                      widget.product.subtitle,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Product description
                    Text(
                      widget.product.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),

                    // Display rating
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.product.rating} Rating',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Display price details
                    Row(
                      children: [
                        Text(
                          '\$${widget.product.actualPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '\$${widget.product.discountPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '(-${widget.product.discountPercentage.toStringAsFixed(0)}%)',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Shop owner details
                    Text(
                      'Shop Owner: ${widget.product.shopOwner}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Location: ${widget.product.location}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
