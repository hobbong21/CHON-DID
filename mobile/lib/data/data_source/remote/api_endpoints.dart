final class ApiEndpoints {
  ApiEndpoints._();

  static const String refreshToken = '/api/v1/auth/refresh';
  // AUTH
  static const String login = '/login';
  static const String sendEmail = '/send-otp';
  static const String vefifyOtp = '/vefify-otp';
  static const String firstPassword = '/first-password';

  // SELF ID
  static const String createSelfId = '/identifier/create/card';
  static const String createSecond = '/identifier/create/card-second';
  static const String updateSelfId = '/identifier/update/card';

  static const String createVerifier = '/identifier/create/verifier';

  static const String getHomeInfo = '/identifier/get-home-info';

  /// param {id}
  static const String getSelfIdDetail = '/identifier/card-info/{id}';
  static const String listCardInfo = '/identifier/list-card-info';
  static const String getListVerifier = '/identifier/list-verification';
  static const String initRelationList =
      '/identifier/init-family-tree/{cardId}';
  static const String deleteCard = '/identifier/delete';

  /// param {id}
  static const String deleteVerifier = '/identifier/delete/verifier';

  // SHARE
  static const String getLink = '/share/get-link';

  // VERIFY
  static const String getCardInfoVerify = '/verify/get-card-info';
  static const String getClanInfoVerify = '/verify/get-clan-info';
  static const String getTaekwondoInfoVerify = '/verify/get-taekwondo-info';
  static const String confirmVerify = '/verify/confirm';
  static const String rejectVerify = '/verify/reject';
  static const String verifySignature = '/verify/signature-info';
  static const String getRequesters = '/verify/requesters';
  static const String getPhone = '/verify/get-phone';
  static const String changePhone = '/verify/change-phone';
  static const String verifyDid = '/verify/verify-did';

  // BANK
  static const String getListBank = '/bank-account/get-list';
  static const String getBankDetail = '/bank-account/detail';
  static const String addBank = '/bank-account/create';
  static const String updateBank = '/bank-account/update';
  static const String deleteBank = '/bank-account/delete';
  static const String getBank = '/bank-type/get-list';

  // CLAN
  static const String addClan = '/clan/create';
  static const String updateClan = '/clan/update';
  static const String getClanDetail = '/clan/detail';

  // CLAN
  static const String addTaekwondo = '/taekwondo/create/taekwondo';
  static const String updateTaekwondo = '/taekwondo/update/taekwondo';
  static const String getTaekwondoDetail = '/taekwondo/detail/taekwondo';

  // EVENT
  static const String getEventInfo = '/event/web/detail';
  static const String visitEvent = '/event/app/visit';
  static const String eventListVerified = '/event/list-verified';

  // CATEGORY
  static const String getListCategory = '/category/list';
  static const String getListSubCategory = '/category/sub-level';

  // RELATION
  static const String getRelationList = '/relation/list';
  static const String getListRequester = '/relation/list-requester';
  static const String createRelation = '/relation/create';
  static const String updateRelation = '/relation/update';
  static const String deleteRelation = '/relation/delete/{id}';
  static const String getListRelationType = '/relation/list-relation-type';

  // REPORT
  static const String createReport = '/report/create';
  static const String listReport = '/report/list';
}
