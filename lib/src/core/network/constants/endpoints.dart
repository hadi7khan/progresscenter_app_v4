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

  //---------------------------- Projects ---------------------------------------

  static projectListUrl() {
    return '$baseUrl/api/v4/projects';
  }

  static projectByIdUrl(id) {
    return '$baseUrl/api/v4/projects/$id/';
  }

  static cameraListUrl(id) {
    return '$baseUrl/api/v4/projects/$id/cameras';
  }

  static cctvCameraListUrl(id) {
    return '$baseUrl/api/v4/projects/$id/camera-cctvs';
  }

  static droneFootageListUrl(id) {
    return '$baseUrl/api/v4/projects/$id/drone-footages';
  }

  static siteGalleryListUrl(id) {
    return '$baseUrl/api/v4/projects/$id/site-gallery';
  }

  static userleanListUrl() {
    return '$baseUrl/api/v4/users/lean';
  }

  static inviteMemberUrl(id) {
    return '$baseUrl/api/v4/projects/$id/invite';
  }

  static revokeMemberUrl(projectId, userId) {
    return '$baseUrl/api/v4/projects/$projectId/revoke/$userId';
  }

  static uploadImageUrl(projectId) {
    return '$baseUrl/api/v4/projects/$projectId/images';
  }

  static deleteImageUrl(projectId, imageId) {
    return '$baseUrl/api/v4/projects/$projectId/images/$imageId';
  }

  //---------------------------- Camera Details ---------------------------------------

  static CameraByIdUrl(projectId, cameraId) {
    return '$baseUrl/api/v4/projects/$projectId/cameras/$cameraId';
  }

  static imagesByCameraIdUrl(projectId, cameraId, {searchDate = ''}) {
    return '$baseUrl/api/v4/projects/$projectId/cameras/$cameraId/images?date=$searchDate';
  }
  //---------------------------- Teams ---------------------------------------

  static teamListUrl() {
    return '$baseUrl/api/v4/teams';
  }

  static userListUrl() {
    return '$baseUrl/api/v4/users/';
  }

  //---------------------------- Documents ---------------------------------------

  static docListUrl() {
    return '$baseUrl/api/v4/documents';
  }

  //---------------------------- ProgressLine ---------------------------------------

  static progressLineUrl() {
    return '$baseUrl/api/v4/progress-line';
  }

  static postCommentUrl(progressLineId) {
    return '$baseUrl/api/v4/progress-line/$progressLineId/comments';
  }

  //---------------------------- Livelapse ---------------------------------------

  static livelapseListUrl(projectId, cameraId) {
    return '$baseUrl/api/v4/projects/$projectId/cameras/$cameraId/live-lapses';
  }

  static createBasicLivelapseUrl(projectId, cameraId) {
    return '$baseUrl/api/v4/projects/$projectId/cameras/$cameraId/live-lapses/basic';
  }

  static createAdvancedLivelapseUrl(projectId, cameraId) {
    return '$baseUrl/api/v4/projects/$projectId/cameras/$cameraId/live-lapses/advanced';
  }

  //---------------------------- Progress Slider ---------------------------------------

  static progressSliderUrl(projectId, cameraId) {
    return '$baseUrl/api/v4/projects/$projectId/cameras/$cameraId/progress-slider';
  }

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;
}
