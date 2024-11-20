import 'dart:io';
import 'package:apna_store/Screens/authentication/login_page.dart';
import 'package:apna_store/Utils/utils.dart';
import 'package:apna_store/admin/product_list.dart';
import 'package:apna_store/img_file.dart';
import 'package:apna_store/services/database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class ProductRegistrationPage extends StatefulWidget {
  @override
  _ProductRegistrationPageState createState() =>
      _ProductRegistrationPageState();
}

class _ProductRegistrationPageState extends State<ProductRegistrationPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController actualPriceController = TextEditingController();
  final TextEditingController discountPriceController = TextEditingController();
  final TextEditingController discountPercentageController =
      TextEditingController();
  final TextEditingController paymentOptionsController =
      TextEditingController();
  final TextEditingController shopOwnerController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController highlightsController = TextEditingController();

  File? _productImage;

  // Function to pick an image from the gallery
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _productImage = File(pickedFile.path);
      });
    }
  }

  // Function to add product data to Firebase
  Future<void> addProduct() async {
    if (nameController.text.isEmpty ||
        _categoryController.text.isEmpty ||
        subtitleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        ratingController.text.isEmpty ||
        actualPriceController.text.isEmpty ||
        discountPriceController.text.isEmpty ||
        discountPercentageController.text.isEmpty ||
        shopOwnerController.text.isEmpty ||
        locationController.text.isEmpty) {
      Utils().toasMessage("Please fill all the fields");
    }
    String product_id = randomNumeric(5);
    Map<String, dynamic> productData = {
      'product_id': product_id,
      'name': nameController.text.trim(),
      'category': _categoryController.text.trim(),
      'subtitle': subtitleController.text.trim(),
      'description': descriptionController.text.trim(),
      'rating': double.parse(ratingController.text.trim()).toString(),
      'actual_price':
          double.parse(actualPriceController.text.trim()).toString(),
      'discount_price':
          double.parse(discountPriceController.text.trim()).toString(),
      'discount_percentage':
          double.parse(discountPercentageController.text.trim()).toString(),
      'payment_options': paymentOptionsController.text.trim(),
      'shop_owner': shopOwnerController.text.trim(),
      'location': locationController.text.trim(),
      'highlights': highlightsController.text.trim(),
      'image_url': profile,
      // Replace with actual image upload logic
    };
    DatabaseMethods().addProductDetails(productData, product_id);
    Utils().toasMessage("Product Added Successfully");

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ProductList()));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product Added Successfully!')),
    );

    // Clear input fields
    nameController.clear();
    _categoryController.clear();
    subtitleController.clear();
    descriptionController.clear();
    ratingController.clear();
    actualPriceController.clear();
    discountPriceController.clear();
    discountPercentageController.clear();
    paymentOptionsController.clear();
    shopOwnerController.clear();
    locationController.clear();
    highlightsController.clear();
    setState(() {
      _productImage = null;
    });
  }

  // UI for Product Registration
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 10,
          title: const Text(
            'Add Product',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFF4F2D19),
          toolbarHeight: 60,
          foregroundColor: const Color.fromARGB(255, 255, 224, 187),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          elevation: 10,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const SizedBox(height: 25),
              Center(
                child: GestureDetector(
                  onTap: pickImage,
                  child: _productImage == null
                      ? Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 102, 53, 22)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.add_a_photo,
                            size: 50,
                            color: Color.fromARGB(255, 100, 48, 20),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            _productImage!,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter Product Name',
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  hintText: 'Enter Product Category',
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: subtitleController,
                decoration: const InputDecoration(
                  hintText: 'Enter Product Subtitle',
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Enter Product Description',
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              TextField(
                controller: ratingController,
                decoration: const InputDecoration(
                  hintText: 'Enter Product Rating',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              TextField(
                controller: actualPriceController,
                decoration: const InputDecoration(
                  hintText: 'Enter Product Actual Price',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              TextField(
                controller: discountPriceController,
                decoration: const InputDecoration(
                  hintText: 'Enter Product Discount Price',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              TextField(
                controller: discountPercentageController,
                decoration: const InputDecoration(
                  hintText: 'Enter Product Discount Percentage',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              TextField(
                controller: shopOwnerController,
                decoration: const InputDecoration(
                  hintText: 'Enter Shop Owner Name',
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              TextField(
                controller: locationController,
                decoration: const InputDecoration(
                  hintText: 'Enter Shop Location',
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: addProduct,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Add Product',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
