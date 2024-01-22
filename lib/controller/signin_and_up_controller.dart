import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/controller/auth_page_controller.dart';
import 'package:laundry_mama_rework/controller/dashboard_controller.dart';
import 'package:laundry_mama_rework/models/user_model.dart';
import 'package:laundry_mama_rework/screen/authentication_page.dart';
import 'package:laundry_mama_rework/screen/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignInAndUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController signUppasswordController = TextEditingController();
  TextEditingController signUpConfirmpasswordController =
      TextEditingController();
  TextEditingController signUpemailController = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController address = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;

  final AuthPageController _authPageController = Get.put(AuthPageController());
  final DashboardController _dashboardController =
      Get.put(DashboardController());

  //firebase
  late User? user;
  late UserModel userdata;
  FirebaseAuth? _auth;
  UserCredential? userCredential;
  FirebaseFirestore? _firestore;
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

//email validation
  bool isEmailValid(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  void clearSignUpFields() {
    signUppasswordController.clear();
    signUpConfirmpasswordController.clear();
    signUpemailController.clear();
    firstName.clear();
    lastName.clear();
    address.clear();
  }

  void clearSignInFields() {
    emailController.clear();
    passwordController.clear();
  }

  //auth controller
  authController() {
    _auth = FirebaseAuth.instance;
    _firestore = FirebaseFirestore.instance;
    _initAuthStateListener();
    // checkCurrentUser();
  }

  Future<void> _initAuthStateListener() async {
    _auth!.authStateChanges().listen((User? newUser) {
      user = newUser;
      update(); // Update the UI when user changes
    });
  }

  Future<UserModel> userData(String uid) {
    return getUsersData(uid).first;
  }

  Stream<UserModel> getUsersData(String uid) {
    return _users.doc(uid).snapshots().map(
          (event) => UserModel.fromMap(event.data() as Map<String, dynamic>),
        );
  }

  Future<void> checkCurrentUser() async {
    user = _auth!.currentUser;
    if (user != null) {
      Get.off(() => const Dashboard());
      log((user!.uid).toString());
    }
  }

  void showSnackBar(String message, context) {
    Get.snackbar(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      'Check Again',
      message,
      colorText: Colors.black,
      icon: const Icon(
        Icons.close,
        color: Colors.red,
      ),
      snackPosition: SnackPosition.TOP,
    );
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      isLoading = true;
      update();
      authController();

      UserCredential userCredential = await _auth!.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;

      log((userCredential.user?.uid).toString());
      userdata = await getUsersData(user!.uid).first;
      clearSignInFields();
      update();
      Get.off(
        () => const Dashboard(),
      );
      log(userdata.toString());
    } catch (e) {
      log('Error during sign-in: $e');

      // Handle the error
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> signUpWithEmailAndPassword(String email, String password,
      String firstname, String lastname, String address) async {
    try {
      isLoading = true;
      update();
      if (formKey.currentState?.validate() ?? false) {
        authController();
        UserCredential userCredential =
            await _auth!.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        update();
        UserModel userModel = UserModel(
          name: firstname + lastname,
          email: email,
          address: address,
          orders: [
            {},
          ],
          phoneNum: "",
          profileImgUrl: "",
          uid: user!.uid,
        );

        await _firestore!.collection('users').doc(userModel.uid).set(
              userModel.toMap(),
            );
        _authPageController.isSigninMode = true;
        clearSignUpFields();
        update();
        Get.offAll(
          () => const AuthenticationPage(),
        );
      }
    } catch (e) {
      log('Error during sign-up: $e');
      // Handle the error
    } finally {
      isLoading = false;

      update(); // Notify UI about loading state
    }
  }

  Future<void> logout() async {
    try {
      await _auth!.signOut();
      Get.off(
        () => const AuthenticationPage(),
      );
      _authPageController.isSigninMode = true;
      _dashboardController.currentPageIndex = 0;
      update();
      log('Sign-out successful!');
    } catch (e) {
      log('Error during sign-out: $e');
    }
  }

  @override
  void onClose() {
    // // Dispose of the _auth instance when the controller is closed
    // _auth = null;
    super.onClose();
  }
}
