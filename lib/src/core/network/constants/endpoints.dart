class Endpoints {
  // base url
  static const String baseUrl = "https://api-dev-v4.progresscenter.io";
  // static const String baseUrl = "https://api-v4.progresscenter.io";

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

  static clientAccountsUrl() {
    return '$baseUrl/api/v4/auth/accounts';
  }

  static accountTokenUrl(clientId) {
    return '$baseUrl/api/v4/auth/accounts/$clientId';
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

  static droneFootageByIdUrl(projectId, droneFootageId) {
    return '$baseUrl/api/v4/projects/$projectId/drone-footages/$droneFootageId';
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

  static downloadSingleImageUrl(projectId, cameraId) {
    return '$baseUrl/api/v4/projects/$projectId/cameras/$cameraId/images/download';
  }

  static downloadMultiImageUrl(projectId, cameraId) {
    return '$baseUrl/api/v4/projects/$projectId/cameras/$cameraId/multi-image-downloads';
  }

  static imageCommentsUrl(projectId, cameraId, imageName) {
    return '$baseUrl/api/v4/projects/$projectId/cameras/$cameraId/comments/images/$imageName';
  }

  static imageCommentsRepliesUrl(projectId, cameraId, commentId) {
    return '$baseUrl/api/v4/projects/$projectId/cameras/$cameraId/comments/$commentId/replies';
  }

  static allImageCommentsUrl(projectId, cameraId, page) {
    return '$baseUrl/api/v4/projects/$projectId/cameras/$cameraId/comments?offset=$page&limit=20';
  }

  static deleteImageCommentsUrl(projectId, cameraId, commentId) {
    return '$baseUrl/api/v4/projects/$projectId/cameras/$cameraId/comments/$commentId';
  }

  static deleteImageCommentsReplyUrl(projectId, cameraId, commentId, replyId) {
    return '$baseUrl/api/v4/projects/$projectId/cameras/$cameraId/comments/$commentId/replies/$replyId';
  }

  static shareSocialsUrl(projectId, cameraId) {
    return '$baseUrl/api/v4/projects/$projectId/cameras/$cameraId/social-share';
  }

  static instantReportUrl(projectId, cameraId) {
    return '$baseUrl/api/v4/projects/$projectId/cameras/$cameraId/reports/instant';
  }

  static scheduledReportUrl(projectId, cameraId) {
    return '$baseUrl/api/v4/projects/$projectId/cameras/$cameraId/reports/scheduled';
  }
  //---------------------------- Teams ---------------------------------------

  static teamListUrl() {
    return '$baseUrl/api/v4/teams';
  }

  static userListUrl({searchText = ''}) {
    if (searchText.isNotEmpty) {
      return '$baseUrl/api/v4/search/users/?q=$searchText';
    } else {
      return '$baseUrl/api/v4/users';
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

  static allProgressLinePostsUrl() {
    return '$baseUrl/api/v4/progress-line';
  }

  static postCommentUrl(progressLineId) {
    return '$baseUrl/api/v4/progress-line/$progressLineId/comments';
  }

  static commentsUrl(progressLineId) {
    return '$baseUrl/api/v4/progress-line/$progressLineId/comments';
  }

  static progresslineByIdUrl(progresslineId, projectId) {
    return '$baseUrl/api/v4/progress-line/$progresslineId/projects/$projectId';
  }

  static deletePostUrl(id) {
    return '$baseUrl/api/v4/progress-line/$id';
  }

  static deleteProgressLineCommentUrl(progresslineId, commentId) {
    return '$baseUrl/api/v4/progress-line/$progresslineId/comments/$commentId';
  }

  static shareProgressLineUrl() {
    return '$baseUrl/api/v4/progress-line';
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

  static livelapseByIdUrl(projectId, cameraId, livelapseId) {
    return '$baseUrl/api/v4/projects/$projectId/cameras/$cameraId/live-lapses/$livelapseId';
  }

  //---------------------------- Progress Slider ---------------------------------------

  static progressSliderUrl(projectId, cameraId) {
    return '$baseUrl/api/v4/projects/$projectId/cameras/$cameraId/progress-slider';
  }

  //---------------------------- Notifications ---------------------------------------

  static notificationsListUrl(int page) {
    return '$baseUrl/api/v4/notifications/?offset=$page&limit=50';
  }

  static downloadNotificationDocUrl() {
    return '$baseUrl/api/v4/notifications/documents/url';
  }

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;
}
