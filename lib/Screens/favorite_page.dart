import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:apna_store/img_file.dart';

class FavoriteController extends GetxController {
  var favorites = <Map<String, dynamic>>[].obs; // Observable list of favorites
  var isLoading = false.obs; // Observable loading state
  var errorMessage = ''.obs; // Observable error message

  // Fetch favorites from Firebase
  void fetchFavorites() async {
    try {
      isLoading.value = true; // Start loading
      errorMessage.value = ''; // Clear previous errors

      var snapshot =
          await FirebaseFirestore.instance.collection('favorites').get();
      var favoriteList = snapshot.docs.map((doc) => doc.data()).toList();
      favorites.assignAll(favoriteList); // Update the favorites list
    } catch (e) {
      errorMessage.value = 'Failed to load favorites: $e';
    } finally {
      isLoading.value = false; // Stop loading
    }
  }

  // Remove a favorite
  Future<void> removeFavorite(String favoriteId) async {
    try {
      await FirebaseFirestore.instance
          .collection('favorites')
          .where('favourate_id', isEqualTo: favoriteId)
          .get()
          .then((snapshot) {
        for (var doc in snapshot.docs) {
          doc.reference.delete();
        }
      });

      // Remove locally
      favorites.removeWhere((item) => item['favourate_id'] == favoriteId);
    } catch (e) {
      Get.snackbar('Error', 'Failed to remove favorite: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    // Instantiate the controller
    final FavoriteController favoriteController = Get.put(FavoriteController());

    // Fetch favorites on page load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      favoriteController.fetchFavorites();
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Your Favorites'),
        backgroundColor: const Color(0xFF4F2D19),
      ),
      body: Obx(
        () {
          if (favoriteController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (favoriteController.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                favoriteController.errorMessage.value,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }

          if (favoriteController.favorites.isEmpty) {
            return const Center(
              child: Text(
                'No favorite items found.',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: favoriteController.favorites.length,
            itemBuilder: (context, index) {
              var favorite = favoriteController.favorites[index];
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
                      width: screenWidth * 0.35,
                      child: Image.network(
                        favorite['image_url'] ?? productImg,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image, size: 50);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            favorite['name'] ?? 'Unnamed Product',
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            favorite['category'] ?? 'No category specified',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: const Color.fromARGB(212, 104, 104, 104),
                            ),
                            softWrap: true,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Seller: ${favorite['shop_owner'] ?? 'Unknown Seller'}',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${favorite['actual_price'] ?? 'N/A'}',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  favoriteController
                                      .removeFavorite(favorite['favourate_id']);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
