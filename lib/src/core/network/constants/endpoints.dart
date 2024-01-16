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

  static getUserUrl() {
    return '$baseUrl/api/v4/account/user';
  }

  //---------------------------- Accounts ---------------------------------------
  static getProfileUrl() {
    return '$baseUrl/api/v4/account';
  }

  static accountTagsUrl() {
    return '$baseUrl/api/v4/account/tags';
  }

  static hideProjectsUrl() {
    return '$baseUrl/api/v4/account/projects/hide';
  }

  static changePasswordAccountUrl() {
    return '$baseUrl/api/v4/account/password';
  }

  static getOrganisationUrl() {
    return '$baseUrl/api/v4/account/organisation';
  }

  static domainRequestUrl() {
    return '$baseUrl/api/v4/account/client-domain-requests';
  }

  static primaryColorUrl() {
    return '$baseUrl/api/v4/account/preferences/primary-color';
  }

  static uploadImageProfileUrl() {
    return '$baseUrl/api/v4/account/dp';
  }

  static uploadOrganisationLogoUrl() {
    return '$baseUrl/api/v4/account/organisation/logo';
  }

  //---------------------------- Projects ---------------------------------------

  static projectListUrl({searchText = ''}) {
    if (searchText == '') {
      return '$baseUrl/api/v4/projects?q=$searchText';
    } else {
      return '$baseUrl/api/v4/search/projects?q=$searchText';
    }
  }

  static projectLeanListUrl() {
    return '$baseUrl/api/v4/projects/lean';
  }

  static projectByIdUrl(id, includeChildren) {
    return '$baseUrl/api/v4/projects/$id/?includeChildren=$includeChildren';
  }

  static projectInviteUrl(id) {
    return '$baseUrl/api/v4/projects/$id/invite';
  }

  static cameraListUrl(id) {
    return '$baseUrl/api/v4/projects/$id/cameras';
  }

  static cctvCameraListUrl(id) {
    return '$baseUrl/api/v4/projects/$id/camera-cctvs';
  }

  //---------------------------- Drone Footage ---------------------------------------

  static droneFootageListUrl(id) {
    return '$baseUrl/api/v4/projects/$id/drone-footages';
  }

  static addFileVideoUrl(id) {
    return '$baseUrl/api/v4/projects/$id/drone-footages/progress-center';
  }

  static siteGalleryListUrl(id) {
    return '$baseUrl/api/v4/projects/$id/site-gallery';
  }

  static siteGalleryByIdUrl(projectId, siteGalleryId) {
    return '$baseUrl/api/v4/projects/$projectId/site-gallery/$siteGalleryId';
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

  static userListUrl({searchText = ''}) {
    if (searchText == '') {
      return '$baseUrl/api/v4/search/users/?q=$searchText';
    } else {
      return '$baseUrl/api/v4/search/users/?q=$searchText';
    }
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

  static deleteFileUrl(folderId, fileId) {
    return '$baseUrl/api/v4/documents/$folderId/files/$fileId';
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

  //---------------------------- Notifications ---------------------------------------

  static notificationsListUrl() {
    return '$baseUrl/api/v4/notifications/?offset=0&limit=20';
  }

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;
}
