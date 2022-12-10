// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// import '../../data/restaurant/models/restaurant.dart';

// class RestaurantController extends GetxController {
//   StreamSubscription<RestaurantDocumentSnapshot>? currentUserDocListener;

//   Rx<RestaurantDocumentSnapshot>? userDocumentSnapshot;

//   String? get currentCustomerId => FirebaseAuth.instance.currentUser?.uid;

//   RestaurantDocumentReference get currentRiderReference => userRef.doc(currentCustomerId);

//   Restaurant? get currentRider => userDocumentSnapshot?.value.data;

//   Stream<RestaurantDocumentSnapshot> get onRiderDataChange {
//     return currentRiderReference.snapshots();
//   }

//   @override
//   onInit() {
//     super.onInit();
//     listenToCustomerDoc();
//   }

//   Future<bool> get hasRiderDocCreated async => (await currentRiderReference.get()).exists;

//   Future createCustomerDoc(Restaurant user) async {
//     await currentRiderReference.set(user);
//     listenToCustomerDoc();
//   }

//   listenToCustomerDoc() {
//     if (FirebaseAuth.instance.currentUser == null || currentUserDocListener != null) return;
//     hasRiderDocCreated.then((value) {
//       if (value) {
//         currentUserDocListener = onRiderDataChange.listen((snapshot) {
//           if (userDocumentSnapshot == null) {
//             userDocumentSnapshot = snapshot.obs;
//           } else {
//             userDocumentSnapshot!.value = snapshot;
//           }
//         });
//       }
//     });
//   }

//   stopCustomerDocListener() {
//     currentUserDocListener?.cancel();
//     userDocumentSnapshot = null;
//   }

//   @override
//   void onClose() {
//     super.onClose();
//     if (currentUserDocListener != null) currentUserDocListener!.cancel();
//     userDocumentSnapshot = null;
//   }

//   Future<bool> isRiderExist(String phoneNumber) async {
//     final customer = await userRef.wherePhone(isEqualTo: phoneNumber).limit(1).get();
//     return customer.docs.isNotEmpty;
//   }
// }
