import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class FirebaseAuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? _verificationId;

  // Send OTP to phone number
  Future<void> sendOTP(String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw Exception(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Verify OTP
  Future<UserModel> verifyOTP(String otp) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );
      
      final userCredential = await _firebaseAuth.signInWithCredential(credential);
      final user = userCredential.user;
      
      if (user != null) {
        return UserModel(
          phoneNumber: user.phoneNumber ?? '',
          uid: user.uid,
        );
      } else {
        throw Exception('User is null');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Check if user is authenticated
  bool isAuthenticated() {
    return _firebaseAuth.currentUser != null;
  }
}