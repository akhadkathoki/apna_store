import 'package:apna_store/models/product_model.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController {
  var productApi = <ProductApi>[].obs; // Correctly initializing the list
  var isLoading = true.obs;
  var errorMessage = ''.obs; // Store error message if any

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  // Fetch product data from local JSON file
  void fetchProduct() async {
    try {
      isLoading(true); // Set loading to true before starting the fetch
      errorMessage(''); // Clear any previous errors

      // Load JSON string from local assets
      String jsonString =
          await rootBundle.loadString("lib/api_connect/dummy_api.json");

      // Parse the JSON string to product list
      List<ProductApi> products = productFromJson(jsonString);
      productApi.value = products; // Update the product list with fetched data
    } catch (e) {
      // Handle any errors and set the error message
      errorMessage("Failed to load products: $e");
    } finally {
      isLoading(
          false); // Set loading to false after the fetch (whether successful or not)
    }
  }

  // Method to get a product by index
  ProductApi getProductByIndex(int index) {
    return productApi[index];
  }
}
