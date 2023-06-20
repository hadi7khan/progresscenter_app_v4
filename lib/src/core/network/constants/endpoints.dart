class Endpoints {
  // base url
  static const String baseUrl = "https://api-dev-v4.progresscenter.io";

  //---------------------------- Auth ---------------------------------------
  static signinUrl() {
    return '$baseUrl/api/v4/auth/authenticate';
  }

  static forgotPasswordUrl() {
    return '$baseUrl/api/v4/auth/forgot-password';
  }

  static changePasswordUrl(token) {
    return '$baseUrl/api/v4/auth/forgot-password/$token/reset';
  }

  static resendOtpUrl(token) {
    return '$baseUrl/api/v4/auth/forgot-password/$token/resend';
  }

  static verifyEmailUrl(token) {
    return '$baseUrl/api/v4/auth/forgot-password/$token/validate';
  }

  //---------------------------- Users ---------------------------------------

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;
}
