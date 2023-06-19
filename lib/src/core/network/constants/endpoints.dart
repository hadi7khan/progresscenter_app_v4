class Endpoints {
  // base url
  static const String baseUrl = "https://admin-api-dev-v4.progresscenter.io";

  //---------------------------- Clients ---------------------------------------
  static clientListUrl(page) {
    return '$baseUrl/api/v4/reseller/61caf1dccb3a8396b119a117/clients';
  }

  static clientDetailsUrl(id) {
    return '$baseUrl/api/v4/reseller/61caf1dccb3a8396b119a117/clients/$id';
  }

  static createClientUrl(data) {
    return '$baseUrl/api/v4/clients';
  }

  static deleteClientUrl(id) {
    return '$baseUrl/api/v4/reseller/61caf1dccb3a8396b119a117/clients';
  }

  //---------------------------- Users ---------------------------------------
  static userListUrl(page) {
    return '$baseUrl/api/v4/reseller/61caf1dccb3a8396b119a117/users?clientId=010018';
  }

  static userDetailsUrl(id) {
    return '$baseUrl/api/v4/users/$id';
  }

  static createUserUrl(data) {
    return '$baseUrl/api/v4/clients';
  }

  static deleteUserUrl(id) {
    return '$baseUrl/api/v4/reseller/61caf1dccb3a8396b119a117/clients';
  }

  //---------------------------- Support ---------------------------------------
  static ticketListUrl(page) {
    return '$baseUrl/api/v4/reseller/61caf1dccb3a8396b119a117/support-tickets';
  }

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;
}
