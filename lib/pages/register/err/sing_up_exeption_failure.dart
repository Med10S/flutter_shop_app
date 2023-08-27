class SignUpWithEmailAndPasswordFailure {
  final String message;
  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occurred"]);
  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a Strong password.');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'An account already exists for that email');
      case 'too-many-requests':
        return const SignUpWithEmailAndPasswordFailure(
            'Too many sign-up requests. Please try again later.');
      case 'network-request-failed':
        return const SignUpWithEmailAndPasswordFailure(
            'A network error occurred. Please check your connection.');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help.');
      case 'user-not-found':
        return const SignUpWithEmailAndPasswordFailure(
            'No user found with this email');
      case 'invalid-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Invalid password. Please enter a valid password.');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure('');

      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
