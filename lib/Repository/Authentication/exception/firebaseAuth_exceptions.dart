// ignore_for_file: file_names
class TFirebaseAuthException implements Exception {
  // The error code associated with the exception
  final String code;

  // Constructor that takes an expection code
  TFirebaseAuthException(this.code);

  // Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email is already registered, please use another ';
      case 'invalid-email':
        return 'The email address provided is an invalid email, please provide another';
      case 'user-not-found':
        return 'There is no existing user record corresponding to the provided identifier.';
      default:
        return '';
    }
  }
}
