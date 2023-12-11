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

  static projectLeanListUrl() {
    return '$baseUrl/api/v4/projects/lean';
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

  static inviteByMailUrl() {
    return '$baseUrl/api/v4/invitation-requests';
  }

  static userProfileUrl(userId) {
    return '$baseUrl/api/v4/users/$userId';
  }

  static tagsUrl(userId) {
    return '$baseUrl/api/v4/users/$userId/tags';
  }

  static roleUrl(userId) {
    return '$baseUrl/api/v4/users/$userId/role';
  }

  static statusUrl(userId) {
    return '$baseUrl/api/v4/users/$userId/status';
  }

  static projectsUrl(userId) {
    return '$baseUrl/api/v4/users/$userId/projects';
  }

  //---------------------------- Support ---------------------------------------

  static supportListUrl() {
    return '$baseUrl/api/v4/support-tickets';
  }

  static ticketByIdUrl(ticketId) {
    return '$baseUrl/api/v4/support-tickets/$ticketId';
  }

  static ticketRepliesUrl(ticketId) {
    return '$baseUrl/api/v4/support-tickets/$ticketId/replies';
  }

  //---------------------------- Documents ---------------------------------------

  static docListUrl() {
    return '$baseUrl/api/v4/documents';
  }

  static addDocomentUrl(folderId) {
    return '$baseUrl/api/v4/documents/$folderId/files';
  }

  static deleteFileUrl(fileId) {
    return '$baseUrl/api/v4/documents/237932/files/$fileId';
  }

  //---------------------------- ProgressLine ---------------------------------------

  static progressLineProjectsUrl() {
    return '$baseUrl/api/v4/progress-line/projects';
  }

  static progressLineUrl(projectId) {
    return '$baseUrl/api/v4/progress-line/projects/$projectId';
  }

  static postCommentUrl(progressLineId) {
    return '$baseUrl/api/v4/progress-line/$progressLineId/comments';
  }

  static commentsUrl(progressLineId) {
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
