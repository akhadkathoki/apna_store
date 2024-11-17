
import 'package:apna_store/Screens/item_widget.dart';
import 'package:apna_store/Screens/product_details_page.dart';
import 'package:apna_store/models/categories.dart';
import 'package:flutter/material.dart';
import 'package:apna_store/Screens/profile.dart';
import 'package:apna_store/Screens/search.dart';
import 'package:apna_store/img_file.dart';
import 'package:flutter/services.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome>
    with SingleTickerProviderStateMixin {
  // // List<String> items = categoryList; // List of categories
  // int current = 0;
  // late TabController
  //     _tabController; // TabController for syncing TabBar and PageView
  // late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(
    //     length: 5, //items.length,
    //     vsync: this);
    // _pageController = PageController();
    loadData();
  }

  loadData() async {
    // var dummyJson =
    //     await rootBundle.loadString('assets/files/steelProduct.json');
    // var decodedJson = jsonDecode(dummyJson);
  }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   _pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width; // Screen width
    final screenHeight = MediaQuery.of(context).size.height; // Screen height
    return Scaffold(
        backgroundColor: const Color(0xFFFAE3C6),
        appBar: AppBar(
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
                padding:
                    EdgeInsets.all(screenWidth * 0.02), // Responsive padding
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
                _showSearchPopup(context);
              },
              icon: Icon(
                Icons.search_rounded,
                size: screenWidth * 0.08, // Responsive icon size
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ProductDetails()),
                );
              },
              icon: Icon(
                Icons.more_vert_rounded,
                size: screenWidth * 0.08, // Responsive icon size
              ),
            ),
          ],
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: Categorys
              .productItrem.length, // Ensure the correct length is passed here
          itemBuilder: (context, index) {
            return AnimatedContainer(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              duration: const Duration(milliseconds: 500),
              decoration: const BoxDecoration(
                color: Color.fromARGB(23, 255, 111, 0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("data"),
                      IconButton(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: const Row(
                          children: [
                            Text("View More"),
                            Icon(Icons.arrow_forward_ios_rounded),
                          ],
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const ProductDetails()),
                      );
                    },
                    child: ItemWidget(
                      item:
                          Categorys.productItrem[index], // Fixed the typo here
                    ),
                  ),
                ],
              ),
            );
          },
        )

        // Column(
        //   children: [
        //     /// Custom TabBar
        //     Container(
        //       padding: EdgeInsets.symmetric(horizontal: 10),
        //       decoration: BoxDecoration(
        //         color: Color(0xFFFAE3C6),
        //         borderRadius: BorderRadius.only(
        //           bottomLeft: Radius.circular(40),
        //           bottomRight: Radius.circular(40),
        //         ),
        //       ),
        //       height: 60,
        //       child: ListView.builder(
        //         physics: const BouncingScrollPhysics(),
        //         itemCount: 20, // items.length,
        //         scrollDirection: Axis.horizontal,
        //         itemBuilder: (ctx, index) {
        //           return GestureDetector(
        //             onTap: () {
        //               setState(() {
        //                 current = index;
        //               });
        //               _pageController.animateToPage(
        //                 current,
        //                 duration: const Duration(milliseconds: 300),
        //                 curve: Curves.easeInOut,
        //               );
        //             },
        //             child: AnimatedContainer(
        //               duration: const Duration(milliseconds: 300),
        //               margin: const EdgeInsets.fromLTRB(0, 10, 5, 10),
        //               width: 100,
        //               height: current == index ? 45 : 46,
        //               decoration: BoxDecoration(
        //                 color: current == index
        //                     ? const Color(0xFF4F2D19)
        //                     : Color.fromARGB(255, 250, 204, 148),
        //                 borderRadius: current == index
        //                     ? BorderRadius.circular(12)
        //                     : BorderRadius.circular(20),
        //               ),
        //               child: Center(
        //                 child: Text(
        //                   // items[index],
        //                   "Wooden",
        //                   style: TextStyle(
        //                     color: current == index
        //                         ? Color(0xFFFAE3C6)
        //                         : const Color(0xFF4F2D19),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           );
        //         },
        //       ),
        //     ),

        //     /// Main Page Body linked with TabBar and PageView
        //     Expanded(
        //       child: PageView.builder(
        //           controller: _pageController,
        //           onPageChanged: (index) {
        //             setState(() {
        //               current = index;
        //               _tabController.animateTo(index); // Sync TabBar when swiping
        //             });
        //           },
        //           itemCount: 5, //items.length,
        //           itemBuilder: (context, index) {
        //             return productCardItems();
        //           }),
        //     ),
        //   ],
        // ),

        );
  }

  void _showSearchPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const SearchHome();
      },
    );
  }
}

// Container productCardItems() {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 10),
//     color: const Color(0xFFFAE3C6),
//     child: SingleChildScrollView(
//       child: Column(
//         children: [
//           categoryLists(), // Display category items
//         ],
//       ),
//     ),
//   );
// }

// Widget categoryLists() {
//   // final products = productCategory[category];
//   return GridView.builder(
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       mainAxisSpacing: 15,
//       crossAxisSpacing: 15,
//       childAspectRatio: 0.85, // Custom aspect ratio for product card size
//     ),
//     shrinkWrap: true,
//     physics: const NeverScrollableScrollPhysics(),
//     itemCount: 10,
//     itemBuilder: (context, index) {
//       // final product = woodenProducts[0];
//       // return productCard(product); // Display product card
//     },
//   );
// }

// Widget productCard(Map<String, dynamic> product) {
//   return InkWell(
//     onTap: () {
//       // Navigator.of(context).push(
//       //   MaterialPageRoute(
//       //     builder: (context) => ProductDetailsPage(
//       //       product: product,
//       //     ),
//       //   ),
//       // );
//     },
//     child: Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             spreadRadius: 3,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: const BorderRadius.all(Radius.circular(16)),
//         child: Stack(
//           children: [
//             Image.network(
//               productImg,
//               height: 300, // Customize image height
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 padding: const EdgeInsets.all(8.0),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       const Color.fromARGB(204, 43, 19, 0).withOpacity(0.9),
//                       Colors.transparent,
//                     ],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                   ),
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(12),
//                     bottomRight: Radius.circular(12),
//                   ),
//                 ),
//                 child: Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: const BoxDecoration(
//                     color: Color.fromARGB(107, 81, 60, 34),
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         product["name"],
//                         maxLines: 1,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         "alsdk asldkfjaskd flasdjf kdfj ;la dfalkdf alksdjfl ;k dfl;askdjf la;sk df;l",
//                         // product["subtitle"],
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         softWrap: false,
//                         style: const TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: Color.fromARGB(190, 255, 255, 255),
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '${product["discountPercentage"]}% Off',
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 253, 209, 174),
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     '\$${product["actualPrice"]}',
//                                     style: const TextStyle(
//                                       fontSize: 14,
//                                       decoration: TextDecoration.lineThrough,
//                                       color: Color.fromARGB(255, 180, 180, 179),
//                                     ),
//                                   ),
//                                   const SizedBox(width: 5),
//                                   Text(
//                                     '\$${product["discountPrice"]}',
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       color: Color.fromARGB(255, 253, 209, 174),
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           // IconButton(
//                           //   onPressed: () {},
//                           //   icon: Container(
//                           //     padding: const EdgeInsets.all(7),
//                           //     decoration: const BoxDecoration(
//                           //       color: Color(0xFFFAE3C6),
//                           //       borderRadius:
//                           //           BorderRadius.all(Radius.circular(100)),
//                           //     ),
//                           //     child: const Icon(
//                           //       Icons.shopping_cart,
//                           //       size: 20,
//                           //       color: Color(0xFF4F2D19),
//                           //     ),
//                           //   ),
//                           // )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );

// }
