// ignore_for_file: prefer_const_constructors

class SignupEmailPasswordFailure {
  final String message;

  const SignupEmailPasswordFailure(
      [this.message = "An unknown error occurred"]);

  factory SignupEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignupEmailPasswordFailure(
            'Please enter a stronger password');
      case 'invalid-email':
        return const SignupEmailPasswordFailure(
            'Email is not valid or badly formatted');
      case 'email-already-in-use':
        return const SignupEmailPasswordFailure(
            'An account already exists for that email');
      case 'operation-not-allowed':
        return const SignupEmailPasswordFailure(
            'Operation is not allowed, Please contact admin');
      case 'user-disabled':
        return const SignupEmailPasswordFailure(
            'This user has been disabled, Please contact admin');
      default:
        return const SignupEmailPasswordFailure();
    }
  }
}
