/// Custom exception class to handle various Firebase authentication-related errors.
class TFirebaseAuthException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  TFirebaseAuthException(this.code);

  /// Get the corresponding error message based on the error code.
  // String get message {
  //   switch (code) {
  //     case 'email-already-in-use':
  //       return 'The email address is already registered. Please use a different email.';
  //     case 'invalid-email':
  //       return 'The email address provided is invalid. Please enter a valid email.';
  //     case 'weak-password':
  //       return 'The password is too weak. Please choose a stronger password.';
  //     case 'user-disabled':
  //       return 'This user account has been disabled. Please contact support for assistance.';
  //     case 'user-not-found':
  //       return 'Invalid login details. User not found.';
  //     case 'wrong-password':
  //       return 'Incorrect password. Please check your password and try again.';
  //     case 'invalid-verification-code':
  //       return 'Invalid verification code. Please enter a valid code.';
  //     case 'invalid-verification-id':
  //       return 'Invalid verification ID. Please request a new verification code.';
  //     case 'quota-exceeded':
  //       return 'Quota exceeded. Please try again later.';
  //     case 'email-already-exists':
  //       return 'The email address already exists. Please use a different email.';
  //     case 'provider-already-linked':
  //       return 'The account is already linked with another provider.';
  //     case 'requires-recent-login':
  //       return 'This operation is sensitive and requires recent authentication. Please log in again.';
  //     case 'credential-already-in-use':
  //       return 'This credential is already associated with a different user account.';
  //     case 'user-mismatch':
  //       return 'The supplied credentials do not correspond to the previously signed in user.';
  //     case 'account-exists-with-different-credential':
  //       return 'An account already exists with the same email but different sign-in credentials.';
  //     case 'operation-not-allowed':
  //       return 'This operation is not allowed. Contact support for assistance.';
  //     case 'expired-action-code':
  //       return 'The action code has expired. Please request a new action code.';
  //     case 'invalid-action-code':
  //       return 'The action code is invalid. Please check the code and try again.';
  //     case 'missing-action-code':
  //       return 'The action code is missing. Please provide a valid action code.';
  //     case 'user-token-expired':
  //       return 'The user\'s token has expired, and authentication is required. Please sign in again.';
  //     case 'invalid-credential':
  //       return 'The supplied credential is malformed or has expired.';
  //     case 'user-token-revoked':
  //       return 'The user\'s token has been revoked. Please sign in again.';
  //     case 'invalid-message-payload':
  //       return 'The email template verification message payload is invalid.';
  //     case 'invalid-sender':
  //       return 'The email template sender is invalid. Please verify the sender\'s email.';
  //     case 'invalid-recipient-email':
  //       return 'The recipient email address is invalid. Please provide a valid recipient email.';
  //     case 'missing-iframe-start':
  //       return 'The email template is missing the iframe start tag.';
  //     case 'missing-iframe-end':
  //       return 'The email template is missing the iframe end tag.';
  //     case 'missing-iframe-src':
  //       return 'The email template is missing the iframe src attribute.';
  //     case 'auth-domain-config-required':
  //       return 'The authDomain configuration is required for the action code verification link.';
  //     case 'missing-app-credential':
  //       return 'The app credential is missing. Please provide valid app credentials.';
  //     case 'invalid-app-credential':
  //       return 'The app credential is invalid. Please provide a valid app credential.';
  //     case 'session-cookie-expired':
  //       return 'The Firebase session cookie has expired. Please sign in again.';
  //     case 'uid-already-exists':
  //       return 'The provided user ID is already in use by another user.';
  //     case 'invalid-cordova-configuration':
  //       return 'The provided Cordova configuration is invalid.';
  //     case 'app-deleted':
  //       return 'This instance of FirebaseApp has been deleted.';
  //     case 'user-token-mismatch':
  //       return 'The provided user\'s token has a mismatch with the authenticated user\'s user ID.';
  //     case 'web-storage-unsupported':
  //       return 'Web storage is not supported or is disabled.';
  //     case 'app-not-authorized':
  //       return 'The app is not authorized to use Firebase Authentication with the provided API key.';
  //     case 'keychain-error':
  //       return 'A keychain error occurred. Please check the keychain and try again.';
  //     case 'internal-error':
  //       return 'An internal authentication error occurred. Please try again later.';
  //     case 'INVALID_LOGIN_CREDENTIALS':
  //       return 'Invalid login credentials.';
  //     default:
  //       return 'An unexpected authentication error occurred. Please try again.';
  //   }
  // }
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'Alamat email sudah terdaftar. Silakan gunakan email lain.';
      case 'invalid-email':
        return 'Alamat email yang diberikan tidak valid. Silakan masukkan email yang valid.';
      case 'weak-password':
        return 'Kata sandi terlalu lemah. Silakan pilih kata sandi yang lebih kuat.';
      case 'user-disabled':
        return 'Akun pengguna ini telah dinonaktifkan. Silakan hubungi dukungan untuk bantuan.';
      case 'user-not-found':
        return 'Detail login tidak valid. Pengguna tidak ditemukan.';
      case 'wrong-password':
        return 'Kata sandi salah. Silakan periksa kata sandi Anda dan coba lagi.';
      case 'invalid-verification-code':
        return 'Kode verifikasi tidak valid. Silakan masukkan kode yang valid.';
      case 'invalid-verification-id':
        return 'ID verifikasi tidak valid. Silakan minta kode verifikasi baru.';
      case 'quota-exceeded':
        return 'Kuota terlampaui. Silakan coba lagi nanti.';
      case 'email-already-exists':
        return 'Alamat email sudah ada. Silakan gunakan email lain.';
      case 'provider-already-linked':
        return 'Akun ini sudah terhubung dengan penyedia lain.';
      case 'requires-recent-login':
        return 'Operasi ini sensitif dan memerlukan autentikasi terbaru. Silakan masuk lagi.';
      case 'credential-already-in-use':
        return 'Kredensial ini sudah terhubung dengan akun pengguna lain.';
      case 'user-mismatch':
        return 'Kredensial yang diberikan tidak sesuai dengan pengguna yang sudah masuk sebelumnya.';
      case 'account-exists-with-different-credential':
        return 'Akun sudah ada dengan email yang sama tetapi kredensial masuk yang berbeda.';
      case 'operation-not-allowed':
        return 'Operasi ini tidak diizinkan. Hubungi dukungan untuk bantuan.';
      case 'expired-action-code':
        return 'Kode aksi sudah kedaluwarsa. Silakan minta kode aksi baru.';
      case 'invalid-action-code':
        return 'Kode aksi tidak valid. Silakan periksa kode dan coba lagi.';
      case 'missing-action-code':
        return 'Kode aksi hilang. Silakan berikan kode aksi yang valid.';
      case 'user-token-expired':
        return 'Token pengguna telah kedaluwarsa, dan autentikasi diperlukan. Silakan masuk lagi.';
      case 'invalid-credential':
        return 'Kredensial yang diberikan rusak atau sudah kedaluwarsa.';
      case 'user-token-revoked':
        return 'Token pengguna telah dicabut. Silakan masuk lagi.';
      case 'invalid-message-payload':
        return 'Payload pesan template email verifikasi tidak valid.';
      case 'invalid-sender':
        return 'Pengirim template email tidak valid. Silakan verifikasi email pengirim.';
      case 'invalid-recipient-email':
        return 'Alamat email penerima tidak valid. Silakan berikan alamat email penerima yang valid.';
      case 'missing-iframe-start':
        return 'Template email hilang tag iframe start.';
      case 'missing-iframe-end':
        return 'Template email hilang tag iframe end.';
      case 'missing-iframe-src':
        return 'Template email hilang atribut iframe src.';
      case 'auth-domain-config-required':
        return 'Konfigurasi authDomain diperlukan untuk tautan verifikasi kode aksi.';
      case 'missing-app-credential':
        return 'Kredensial aplikasi hilang. Silakan berikan kredensial aplikasi yang valid.';
      case 'invalid-app-credential':
        return 'Kredensial aplikasi tidak valid. Silakan berikan kredensial aplikasi yang valid.';
      case 'session-cookie-expired':
        return 'Cookie sesi Firebase telah kedaluwarsa. Silakan masuk lagi.';
      case 'uid-already-exists':
        return 'ID pengguna yang diberikan sudah digunakan oleh pengguna lain.';
      case 'invalid-cordova-configuration':
        return 'Konfigurasi Cordova yang diberikan tidak valid.';
      case 'app-deleted':
        return 'Instansi FirebaseApp ini telah dihapus.';
      case 'user-token-mismatch':
        return 'Token pengguna yang diberikan tidak cocok dengan ID pengguna yang terautentikasi.';
      case 'web-storage-unsupported':
        return 'Penyimpanan web tidak didukung atau dinonaktifkan.';
      case 'app-not-authorized':
        return 'Aplikasi tidak diizinkan untuk menggunakan Firebase Authentication dengan kunci API yang diberikan.';
      case 'keychain-error':
        return 'Terjadi kesalahan pada keychain. Silakan periksa keychain dan coba lagi.';
      case 'internal-error':
        return 'Terjadi kesalahan autentikasi internal. Silakan coba lagi nanti.';
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Kredensial login tidak valid.';
      default:
        return 'Terjadi kesalahan autentikasi yang tidak terduga. Silakan coba lagi.';
    }
  }
}
