import 'package:apna_store/Screens/product_details_page.dart';
import 'package:apna_store/controller/product_controller.dart';
import 'package:apna_store/img_file.dart';
import 'package:apna_store/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchHome extends StatefulWidget {
  const SearchHome({super.key});

  @override
  State<SearchHome> createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  TextEditingController searchTxt = TextEditingController();
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: const Color.fromARGB(135, 124, 112, 97),
      child: Obx(() {
        var items = productController.productApi;
        var isLoading = productController.isLoading.value;
        var errorMessage = productController.errorMessage.value;

        return Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAE3C6),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(158, 79, 45, 25),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, 5))
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchTxt,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          hintText: "Search...",
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                searchTxt.clear();
                              });
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ),
                        onChanged: (query) {
                          setState(() {
                            // No filter logic, just keep showing matching results
                          });
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Close the popup
                        Navigator.of(context).pop();
                      },
                      icon: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(246, 79, 45, 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Show loading indicator when isLoading is true
              if (isLoading) const Center(child: CircularProgressIndicator()),
              // Show error message if there's an error
              if (errorMessage.isNotEmpty)
                Center(
                  child: Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              // Display the filtered list directly based on search query
              if (!isLoading && errorMessage.isEmpty)
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final product = items[index];
                      // Match against search query
                      if (searchTxt.text.isEmpty ||
                          product.name!
                              .toLowerCase()
                              .contains(searchTxt.text.toLowerCase()) ||
                          product.category!
                              .toLowerCase()
                              .contains(searchTxt.text.toLowerCase())) {
                        return InkWell(
                          child: Column(
                            children: [
                              ListTile(
                                tileColor:
                                    const Color.fromARGB(227, 255, 214, 187),
                                leading: Image.network(
                                  productImg,
                                  fit: BoxFit.cover,
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 5),
                                title: Text(product.name!),
                                subtitle: Text(product.category!),
                                onTap: () {
                                  Get.to(() => ProductDetails(),
                                      arguments: index);
                                },
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        );
                      }
                      return Container(); // Return empty if no match
                    },
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
