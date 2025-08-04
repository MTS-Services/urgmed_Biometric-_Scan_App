import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class AuthController extends GetxController {
  final LocalAuthentication _localAuth = LocalAuthentication();

  var isAuthenticated = false.obs;

  Future<bool> authenticateUser() async {
    try {
      bool didAuthenticate = await _localAuth.authenticate(
        localizedReason: "Please authenticate to continue",
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: true,
          biometricOnly: true,
          sensitiveTransaction: true
        ),
      );
      isAuthenticated.value = didAuthenticate;
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        Get.snackbar("Error", "No biometrics enrolled.");
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
        Get.snackbar("Error", "Biometric authentication is locked.");
      } else {
        Get.snackbar("Error", "Authentication failed: ${e.message}");
      }
      isAuthenticated.value = false;
    } catch (e) {
      Get.snackbar("Error", "Unknown error: $e");
      isAuthenticated.value = false;
    }
    return isAuthenticated.value;
  }
}
