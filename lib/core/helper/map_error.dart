String mapError(String code) {
  switch (code) {
    // Shared
    case 'invalid-email':
      return 'The email address is not valid.';
    case 'network-request-failed':
      return 'No internet connection.';
    case 'too-many-requests':
      return 'Too many attempts. Please try again later.';

    // Sign up
    case 'email-already-in-use':
      return 'The email address is already in use.';
    case 'weak-password':
      return 'The password is too weak.';

    // Login
    case 'invalid-credential':
    case 'user-not-found':
    case 'wrong-password':
      return 'Incorrect email or password.';
    case 'user-disabled':
      return 'This account has been disabled.';

    default:
      return 'Something went wrong. Please try again.';
  }
}
