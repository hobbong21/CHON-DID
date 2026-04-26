part of 'app_navigator.dart';

enum Routes {
  // Auth Routes
  splash('/splash'),
  tutorial('/tutorial'),
  login('/login'),
  register('/register'),

  // Home Routes
  home('/home'),
  setting('/setting'),
  vehicleList('/vehicle_list'),
  profile('/profile'),
  profileEdit('/profileEdit'),
  chat('/chat'),
  selfIdCreaterOption('/SelfIdCreaterOption'),
  selfIdOcrOption('/SelfIdOcrOptionPage'),
  selfIdCreater('/SelfIdCreater'),
  selfIdCreaterSuccess('/SelfIdCreaterSuccess'),
  selfIdList('/SelfIdList'),
  selfIdListChoose('/SelfIdListChoose'),
  requestVerification('/RequestVerification'),
  verificationCross('/VerificationCross'),
  verificationFinish('/verificationFinish'),
  familyList('/familyList'),
  familyTree('/familyTree'),
  qrScan('/qrScan'),
  qrScanSuccess('/qrScanSuccess'),
  checkInOut('/checkInOut'),
  bankList('/bankList'),
  bankCreate('/bankCreate'),
  bankCreateSuccess('/bankCreateSuccess'),
  terms('/terms'),
  ocrId('/ocrId'),
  imageView('/imageView'),
  biography('/biography'),
  confirmRelationship('/confirmRelationship'),
  contactPicker('/contactPicker'),

  reportPage('/reportPage'),
  detailReportPage('/detailReportPage'),
  termService('/termSerVice'),
  privacyPolicy('/privacyPolicy'),
  guardPage('/guardPage'),
  requesterListPage('/requesterListPage'),
  ;

  final String path;

  const Routes(this.path);
}
