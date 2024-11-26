import 'package:apna_store/Screens/item_widget.dart';
import 'package:apna_store/Screens/product_details_page.dart';
import 'package:apna_store/Screens/welcome_user_splash_screen.dart';
import 'package:apna_store/controller/product_controller.dart';
import 'package:apna_store/models/categories.dart';
import 'package:apna_store/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:apna_store/Screens/profile.dart';
import 'package:apna_store/Screens/search.dart';
import 'package:apna_store/img_file.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class MainHome extends StatefulWidget {
  final user_email;

  const MainHome({Key? key, this.user_email}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome>
    with SingleTickerProviderStateMixin {
  final ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width; // Screen width
    final screenHeight = MediaQuery.of(context).size.height; // Screen height
    return Scaffold(
      backgroundColor: const Color(0xFFFAE3C6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 255, 214, 165),
        foregroundColor: theme.appBarTheme.backgroundColor,
        toolbarHeight: screenHeight * 0.1, // Dynamic height based on screen
        titleSpacing: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02), // Responsive padding
              child: ClipOval(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: screenHeight * 0.07, // Responsive height
                    child: Image.asset(
                      profile,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Anshu Raj',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF4F2D19),
                    ),
                  ),
                  Text(
                    'Plus Member',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03, // Responsive font size
                      color: const Color.fromARGB(199, 79, 45, 25),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const SearchHome();
                },
              );
            },
            icon: Icon(
              Icons.search_rounded,
              size: screenWidth * 0.08, // Responsive icon size
            ),
          ),
        ],
      ),
      body: Obx(
        () {
          if (productController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisExtent: 270,
                mainAxisSpacing: 15,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              itemCount: productController.productApi.length,
              itemBuilder: (context, index) {
                var items = productController.productApi[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        // Get.to(() => ProductDetails(), arguments: index);

                        Get.to(() => ProductDetails(), arguments: index);
                      },

                      child: Container(
                        height: 270,
                        width: 210,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  10), // Set your desired radius here
                              child: Image.asset(
                                // items.imageUrl,
                                items.imageUrl,
                                height: 270,
                                width: 210,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color.fromARGB(204, 43, 19, 0)
                                          .withOpacity(0.9),
                                      Colors.transparent,
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(107, 81, 60, 34),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        items.name,
                                        maxLines: 1,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        items.description,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(
                                              190, 255, 255, 255),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '\$${items.actualPrice}',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      color: Color.fromARGB(
                                                          255, 181, 181, 181),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    '${items.discountPercentage}% Off',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 253, 209, 174),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '\$${items.discountPrice}',
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Color.fromARGB(
                                                      255, 253, 209, 174),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ), // Fixed the typo here
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
