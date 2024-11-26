import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var orders = <Map<String, dynamic>>[].obs; // List to store orders
  var isLoading = false.obs; // To indicate loading state
  var errorMessage = ''.obs; // To store error messages

  // Fetch orders from Firebase
  void fetchOrders() async {
    isLoading.value = true; // Start loading
    errorMessage.value = ''; // Reset error message

    try {
      var snapshot = await FirebaseFirestore.instance.collection('orders').get();
      var orderList = snapshot.docs.map((doc) => doc.data()).toList();
      orders.assignAll(orderList); // Update the orders list
    } catch (e) {
      errorMessage.value = "Failed to fetch orders. Please try again later."; // Set error message
      print("Error fetching orders: $e");
    } finally {
      isLoading.value = false; // Stop loading
    }
  }
}
