import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic> userData, String user_id) async {
    FirebaseFirestore.instance.collection('users').doc(user_id).set(userData);
  }

  Future addProductDetails(
      Map<String, dynamic> productData, String product_id) async {
    FirebaseFirestore.instance
        .collection('product')
        .doc(product_id)
        .set(productData);
  }

  Future<Map<String, dynamic>?> getUserById(String user_Id) async {
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(user_Id).get();
    if (userDoc.exists) {
      return userDoc.data() as Map<String, dynamic>;
    }
    return null;
  }

  Future<Stream<QuerySnapshot>> getUserData() async {
    return await FirebaseFirestore.instance.collection('users').snapshots();
  }

  // fetch product details on the admin side
  Stream<QuerySnapshot> getProductData() {
  return FirebaseFirestore.instance.collection('product').snapshots();
}
}
