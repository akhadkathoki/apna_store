import 'package:apna_store/Screens/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:apna_store/Screens/model/user.dart';

Future<Users?> fetchCurrentUser() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final currentUser = auth.currentUser;
  if (currentUser == null) {
    print('No user is logged in');
    return null;
  }

  final userEmail = currentUser.email;
  try {
    final querySnapshot = await firestore
        .collection('users') // Replace with your collection name
        .where('user_email', isEqualTo: userEmail)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final userData = querySnapshot.docs.first.data();
      return Users.fromMap(userData);
    } else {
      print('No user data found.');
      return null;
    }
  } catch (e) {
    print('Error fetching user data: $e');
    return null;
  }
}



class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch all products
  Future<List<Product>> fetchProducts() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('product').get();
      return snapshot.docs
          .map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }
}

