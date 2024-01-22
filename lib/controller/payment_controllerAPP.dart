import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PaymentControllerAPP extends GetxController {
  bool cod = false;
  bool card = false;
  bool paymentSuccess = false;
  void updated() {
    update();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> addOrder(String userId, Map<String, dynamic> orderData) async {
    try {
      // Reference to the user's document
      DocumentReference userRef = _firestore.collection('users').doc(userId);

      // Add the order to the "orders" array using FieldValue.arrayUnion
      await userRef.update({
        'orders': FieldValue.arrayUnion([orderData]),
      });

     
    } catch (error) {
    
      // Handle the error as needed
    }
  }
}
