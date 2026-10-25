String mapError(String code) {
  switch (code) {
    case 'invalid-email':
      return 'The email address is not valid.';
    case 'email-already-in-use':
      return 'The email address is already in use.';
    case 'weak-password':
      return 'The password is too weak.';
    case 'network-request-failed':
      return 'No internet connection.';
    default:
      return 'Sign up failed. Please try again.';
  }
}
