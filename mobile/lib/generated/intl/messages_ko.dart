// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ko';

  static String m0(relation) => "님이 ${relation}임을\n확인해주세요";

  static String m1(account, name) => "${account} ${name}";

  static String m2(date) => "${date} 발급";

  static String m3(name) => "${name}님, ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "AN_ERROR_HAS_OCCURRED": MessageLookupByLibrary.simpleMessage("오류가 발생했습니다"),
    "BANK_ACCOUNT_NOT_EXIST": MessageLookupByLibrary.simpleMessage(
      "이 ID에 대한 은행 계좌가 없습니다",
    ),
    "CARD_INFO_EXISTED": MessageLookupByLibrary.simpleMessage("카드 정보가 존재합니다"),
    "CARD_INFO_NOT_EXIST": MessageLookupByLibrary.simpleMessage(
      "사용자에 대한 카드가 없습니다",
    ),
    "CLAN_EXISTED": MessageLookupByLibrary.simpleMessage("Clan existed"),
    "CLAN_NOT_EXISTED": MessageLookupByLibrary.simpleMessage(
      "Clan not existed",
    ),
    "CONFIRM_DID_FAIL": MessageLookupByLibrary.simpleMessage("DID 확인에 실패했습니다."),
    "DATA_NOT_MATCH": MessageLookupByLibrary.simpleMessage("데이터가 일치하지 않습니다"),
    "DID_GENERATE_FAIL": MessageLookupByLibrary.simpleMessage(
      "공개 키로부터 DID를 생성할 수 없습니다.",
    ),
    "ENROLL_DID_FAIL": MessageLookupByLibrary.simpleMessage("DID 등록에 실패했습니다."),
    "EVENT_CERTIFICATE_INVALID": MessageLookupByLibrary.simpleMessage(
      "인증서가 유효하지 않습니다",
    ),
    "EVENT_CERTIFICATE_IS_NOT_CONFIRMED": MessageLookupByLibrary.simpleMessage(
      "인증서가 확인되지 않았습니다",
    ),
    "EVENT_MUST_BE_CHECK_IN_BEFORE": MessageLookupByLibrary.simpleMessage(
      "이벤트는 체크인 전에 확인해야 합니다",
    ),
    "EVENT_NOT_EXISTED": MessageLookupByLibrary.simpleMessage("이벤트가 존재하지 않습니다"),
    "FAMILY_TREE_HAS_BEEN_INITIATED": MessageLookupByLibrary.simpleMessage(
      "가계도가 시작되었습니다.",
    ),
    "GENDER_INVALID": MessageLookupByLibrary.simpleMessage(
      "성별은 \'남성\' 또는 \'여성\'이어야 합니다.",
    ),
    "GENDER_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "성별은 null이 될 수 없습니다.",
    ),
    "ID_NUMBER_EXIST": MessageLookupByLibrary.simpleMessage("ID 번호가 존재합니다"),
    "ID_NUMBER_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "ID 번호는 숫자만 포함해야 합니다.",
    ),
    "ID_NUMBER_NOT_EXISTED": MessageLookupByLibrary.simpleMessage(
      "ID 번호가 존재하지 않습니다",
    ),
    "ID_NUMBER_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "ID 번호는 null이 될 수 없습니다.",
    ),
    "IMG_BASE64_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "이미지는 유효한 base64 형식이어야 합니다.",
    ),
    "IMG_BASE64_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "imgBase64는 null이 될 수 없습니다.",
    ),
    "INPUT_EMPTY": MessageLookupByLibrary.simpleMessage("입력이 비어있습니다"),
    "INPUT_INVALID": MessageLookupByLibrary.simpleMessage("입력 오류"),
    "INTEGRATION_DID_FAIL": MessageLookupByLibrary.simpleMessage(
      "DID 통합에 실패했습니다.",
    ),
    "INVALID_TOKEN": MessageLookupByLibrary.simpleMessage("유효하지 않은 토큰"),
    "ISSUED_DATE_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "발급일은 yyyy-MM-dd 형식이어야 합니다.",
    ),
    "ISSUED_DATE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "발급일은 null이 될 수 없습니다.",
    ),
    "LOGIN_ERROR_01": MessageLookupByLibrary.simpleMessage("이메일이 이미 존재합니다"),
    "MESSAGE_TOO_LONG": MessageLookupByLibrary.simpleMessage(
      "메시지는 2000자를 초과할 수 없습니다.",
    ),
    "NATIONALITY_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "국적에는 문자와 공백만 포함되어야 합니다.",
    ),
    "NATIONALITY_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "국적은 null이 될 수 없습니다.",
    ),
    "NOT_FOUND": MessageLookupByLibrary.simpleMessage("찾을 수 없음"),
    "OTP_EXPIRED": MessageLookupByLibrary.simpleMessage("OTP 만료됨"),
    "PASSWORD_NOT_MATCH": MessageLookupByLibrary.simpleMessage(
      "비밀번호가 일치하지 않습니다",
    ),
    "PASSWORD_OR_ACCOUNT_IN_ACTIVE": MessageLookupByLibrary.simpleMessage(
      "잘못된 비밀번호 또는 계정",
    ),
    "PHONE_NUMBER_EXISTED": MessageLookupByLibrary.simpleMessage("전화번호가 존재합니다"),
    "PHONE_NUMBER_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "연락처 전화번호는 국가 코드(예: +84, +1)로 시작하고 그 뒤에 공백과 8~12자리 숫자가 와야 합니다.",
    ),
    "PHONE_NUMBER_NOT_EXIST": MessageLookupByLibrary.simpleMessage(
      "전화번호가 존재하지 않습니다",
    ),
    "PHONE_NUMBER_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "연락처 전화번호는 null이 될 수 없습니다.",
    ),
    "REF_VISA_TYPE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "비자 유형은 null이 될 수 없습니다.",
    ),
    "REQUEST_TIMEOUT": MessageLookupByLibrary.simpleMessage("요청 시간 초과"),
    "SHARE_LINK_ERROR": MessageLookupByLibrary.simpleMessage("공유 링크 생성 오류"),
    "SUBMIT_DID_FAIL": MessageLookupByLibrary.simpleMessage("DID 제출에 실패했습니다."),
    "SYSTEM_ERROR": MessageLookupByLibrary.simpleMessage("시스템 오류"),
    "TAEKWONDO_EXISTED": MessageLookupByLibrary.simpleMessage(
      "Taekwondo existed",
    ),
    "TAEKWONDO_NOT_EXISTED": MessageLookupByLibrary.simpleMessage(
      "Taekwondo not existed",
    ),
    "THE_CONNECTION_ERRORED": MessageLookupByLibrary.simpleMessage("서버 점검중입니다"),
    "UNAUTHORIZED": MessageLookupByLibrary.simpleMessage("세션 만료됨"),
    "UNKNOWN": MessageLookupByLibrary.simpleMessage("알 수 없는 오류"),
    "VALIDATE_BANK_ACCOUNT_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "계좌번호는 비어있을 수 없습니다",
    ),
    "VALIDATE_BANK_ID_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "은행 ID는 비어있을 수 없습니다",
    ),
    "VALIDATE_BANK_REF_BANK_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "은행 참조는 비어있을 수 없습니다",
    ),
    "VALIDATE_CARD_CARD_ID_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "카드 ID는 null이 될 수 없습니다.",
    ),
    "VALIDATE_CLAN_BIRTH_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "출생지는 비어있을 수 없습니다",
    ),
    "VALIDATE_CLAN_CLAN_NAME_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "클랜 이름은 비어있을 수 없습니다",
    ),
    "VALIDATE_CLAN_IMAGE_BASE64_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "이미지는 유효한 base64 형식(data:image/<type>;base64,...)이어야 하며 크기는 10MB 이하여야 합니다.",
        ),
    "VALIDATE_CLAN_IMAGE_BASE64_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "이미지 base64는 비어있을 수 없습니다",
    ),
    "VALIDATE_CLAN_ORIGIN_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "출처는 비어있을 수 없습니다",
    ),
    "VALIDATE_CLAN_PA_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Pa는 비어있을 수 없습니다",
    ),
    "VALIDATE_CLAN_PERSONAL_NAME_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("개인 이름은 null이 될 수 없습니다."),
    "VALIDATE_CLAN_PHONE_NUMBER_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "연락처 전화번호는 국가 코드(예: +84, +1)로 시작하고 그 뒤에 공백과 8~12자리 숫자가 와야 합니다(예: +84 123456789).",
        ),
    "VALIDATE_CLAN_PHONE_NUMBER_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "전화번호는 비어있을 수 없습니다",
    ),
    "VALIDATE_CLAN_SE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Se는 비어있을 수 없습니다",
    ),
    "VALIDATE_EVENT_ACTION_TYPE_INVALID": MessageLookupByLibrary.simpleMessage(
      "이벤트 작업 유형은 null이 아니어야 하며 값은 1(체크인) 또는 2(체크아웃)이어야 합니다.",
    ),
    "VALIDATE_EVENT_ID_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "이벤트 ID는 null이 될 수 없습니다.",
    ),
    "VALIDATE_PUBLIC_KEY_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "공개 키는 null이 될 수 없습니다.",
    ),
    "VALIDATE_RAW_DATA_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "원시 데이터는 null이 될 수 없습니다.",
    ),
    "VALIDATE_SIGNATURE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "서명은 null이 될 수 없습니다.",
    ),
    "VALIDATE_TEAKWONDO_ID_NUMBER_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("ID 번호는 null이 될 수 없습니다."),
    "VALIDATE_TEAKWONDO_IMAGE_BASE64_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "이미지는 유효한 base64 형식(data:image/<type>;base64,...)이어야 하며 크기는 10MB 이하여야 합니다.",
        ),
    "VALIDATE_TEAKWONDO_IMAGE_BASE64_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("이미지 base64는 null이 될 수 없습니다."),
    "VALIDATE_TEAKWONDO_ISSUE_DATE_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage("발급일은 yyyy-MM-dd 형식이어야 합니다."),
    "VALIDATE_TEAKWONDO_ISSUE_DATE_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("발급일은 null이 될 수 없습니다."),
    "VALIDATE_TEAKWONDO_LEVEL_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "레벨은 null이 될 수 없습니다.",
    ),
    "VALIDATE_TEAKWONDO_LEVEL_NUMBER_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("레벨 번호는 null이 될 수 없습니다."),
    "VALIDATE_TEAKWONDO_NAME_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "이름은 null이 될 수 없습니다.",
    ),
    "VALIDATE_TEAKWONDO_NATIONALY_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("국적은 null이 될 수 없습니다."),
    "VERIFIED": MessageLookupByLibrary.simpleMessage("연락처 확인됨"),
    "VERIFY_CONTACT_NOT_EXIST": MessageLookupByLibrary.simpleMessage(
      "연락처가 존재하지 않습니다",
    ),
    "VERIFY_ERROR": MessageLookupByLibrary.simpleMessage("인증 오류"),
    "account": MessageLookupByLibrary.simpleMessage("아이디(이메일)"),
    "accountInfoError": MessageLookupByLibrary.simpleMessage(
      "계좌정보 오류입니다. 입력정보를 확인해주세요.",
    ),
    "accountList": MessageLookupByLibrary.simpleMessage("계좌 목록"),
    "accountRegisted": MessageLookupByLibrary.simpleMessage("계좌가 등록되었어요!"),
    "accountRegistration": MessageLookupByLibrary.simpleMessage("계좌 등록"),
    "accountRegistrationTerms": MessageLookupByLibrary.simpleMessage(
      "목적 안내\n“시제 회비·정산을 위한 정상 전용계좌 등록”\n\n본 서비스는 이용자의 정상적인 회비 납부 및 정산 절차 수행을 위해 은행 계좌 정보를 등록하고 검증하는 과정을 포함합니다.\n입력하신 정보는 본인 확인 및 정산 처리를 위한 필수 항목으로, 아래와 같은 목적에 따라 사용됩니다.\n\n1. 본인 확인 및 실명 인증\n이용자가 본인 명의의 계좌를 등록했는지 확인하기 위해 금융기관을 통한 실명 인증 절차가 진행됩니다.\n이를 통해 타인 명의 계좌의 부정 사용, 오입금 등의 사고를 예방합니다.\n\n2. 회비 납부 및 정산 처리\n서비스 이용 중 발생하는 회비, 정산금, 포상금 등 금전 거래를 정확하고 안전하게 처리하기 위해 계좌 정보를 활용합니다.\n정산 과정에서 발생하는 입금 및 출금 내역은 이용자에게 투명하게 고지됩니다.\n\n3. 금융 정보 최소 수집 및 보관\n서비스는 정산 목적에 필요한 최소한의 금융정보만을 수집·이용하며, 법령에서 정한 기간 동안만 보관합니다.\n보관 기간이 경과한 정보는 안전한 절차를 거쳐 즉시 파기됩니다.\n\n4. 법령 준수 및 분쟁 대응\n금융거래 관련 법령에 따라, 거래기록 및 계좌 정보는 세무·감사·분쟁 해결 등의 목적으로 관계 기관에 제출될 수 있습니다.\n이 경우에도 법적 근거가 없는 한 제3자에게 임의 제공되지 않습니다.\n\n수집된 모든 정보는 「개인정보 보호법」 및 관련 규정에 따라 암호화되어 안전하게 관리됩니다.\n또한, 이용자는 언제든지 정보 제공에 대한 동의를 철회할 수 있으며, 철회 시 이후 정산 서비스 이용이 제한될 수 있습니다.",
    ),
    "accountVerificationCompleted": MessageLookupByLibrary.simpleMessage(
      "계좌 확인이\n완료되었습니다",
    ),
    "achievements": MessageLookupByLibrary.simpleMessage("관직업적"),
    "action_delete": MessageLookupByLibrary.simpleMessage("삭제하기"),
    "action_ok": MessageLookupByLibrary.simpleMessage("확인"),
    "action_select": MessageLookupByLibrary.simpleMessage("선택"),
    "add": MessageLookupByLibrary.simpleMessage("추가하기"),
    "addNewAccount": MessageLookupByLibrary.simpleMessage("계좌은행 추가"),
    "address": MessageLookupByLibrary.simpleMessage("주소"),
    "agreeAccountRealName": MessageLookupByLibrary.simpleMessage(
      "(필수) 계좌실명조회 동의",
    ),
    "agreeAll": MessageLookupByLibrary.simpleMessage("동의 항목 전체 동의"),
    "agreeAndContinue": MessageLookupByLibrary.simpleMessage("동의하고 계속하기"),
    "agreeFinancialInfoCollection": MessageLookupByLibrary.simpleMessage(
      "(필수) 금융정보 최소수집·보관",
    ),
    "agreeNotification": MessageLookupByLibrary.simpleMessage(
      "(선택) 영수증/정산 알림 수신(푸시/이메일)",
    ),
    "album": MessageLookupByLibrary.simpleMessage("앨범"),
    "appLanguage": MessageLookupByLibrary.simpleMessage("앱 언어"),
    "approval": MessageLookupByLibrary.simpleMessage("승인"),
    "approvalSuccess": MessageLookupByLibrary.simpleMessage("승인 성공"),
    "askForAnything": MessageLookupByLibrary.simpleMessage("무엇이든 부탁하세요"),
    "attachmentLabel": MessageLookupByLibrary.simpleMessage("첨부파일"),
    "aunt_father_sister": MessageLookupByLibrary.simpleMessage("고모"),
    "aunt_uncle_wife": MessageLookupByLibrary.simpleMessage("큰어머니"),
    "authRejected": MessageLookupByLibrary.simpleMessage("상호인증을 거절 하셨습니다"),
    "authentication": MessageLookupByLibrary.simpleMessage("상호인증"),
    "authenticationRequest": MessageLookupByLibrary.simpleMessage(
      "수신된 상호인증\n요청 리스트 입니다",
    ),
    "back": MessageLookupByLibrary.simpleMessage("돌아가기"),
    "bankAccount": MessageLookupByLibrary.simpleMessage("은행 계좌"),
    "bankAccountNumber": MessageLookupByLibrary.simpleMessage("은행계좌번호"),
    "bankInfo": MessageLookupByLibrary.simpleMessage("은행정보"),
    "birth": MessageLookupByLibrary.simpleMessage("생년도"),
    "birthYearSuffix": MessageLookupByLibrary.simpleMessage("년 생"),
    "blockHash": MessageLookupByLibrary.simpleMessage("블록해시"),
    "brother": MessageLookupByLibrary.simpleMessage("남매"),
    "brother2": MessageLookupByLibrary.simpleMessage("형제"),
    "brother_in_law": MessageLookupByLibrary.simpleMessage("형부"),
    "cameraNotInitialized": MessageLookupByLibrary.simpleMessage(
      "카메라가 초기화되지 않았습니다",
    ),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "카메라 접근 권한이 필요합니다",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("취소"),
    "captureIdCard": MessageLookupByLibrary.simpleMessage("신분증 촬영"),
    "certification": MessageLookupByLibrary.simpleMessage("인증"),
    "certifierList": MessageLookupByLibrary.simpleMessage("인증자 목록"),
    "change": MessageLookupByLibrary.simpleMessage("변경하기"),
    "changePhoneSuccess": MessageLookupByLibrary.simpleMessage(
      "전화번호를 성공적으로 변경했습니다",
    ),
    "char": MessageLookupByLibrary.simpleMessage("자"),
    "chat": MessageLookupByLibrary.simpleMessage("채팅"),
    "checkAccount": MessageLookupByLibrary.simpleMessage("계좌확인"),
    "checkIn": MessageLookupByLibrary.simpleMessage("체크인"),
    "checkInConfirmed": MessageLookupByLibrary.simpleMessage("체크인\n확인되었습니다"),
    "checkOriginal": MessageLookupByLibrary.simpleMessage("원본확인"),
    "checkOut": MessageLookupByLibrary.simpleMessage("체크아웃"),
    "checkOutConfirmed": MessageLookupByLibrary.simpleMessage("체크아웃\n완료"),
    "children": MessageLookupByLibrary.simpleMessage("자녀"),
    "chon_action_approve": MessageLookupByLibrary.simpleMessage("승인"),
    "chon_action_attach": MessageLookupByLibrary.simpleMessage("파일 첨부"),
    "chon_action_attached": MessageLookupByLibrary.simpleMessage("첨부됨"),
    "chon_action_back": MessageLookupByLibrary.simpleMessage("뒤로"),
    "chon_action_close": MessageLookupByLibrary.simpleMessage("닫기"),
    "chon_action_confirm": MessageLookupByLibrary.simpleMessage("확인"),
    "chon_action_continue": MessageLookupByLibrary.simpleMessage("계속"),
    "chon_action_finish": MessageLookupByLibrary.simpleMessage("완료"),
    "chon_action_next": MessageLookupByLibrary.simpleMessage("다음"),
    "chon_action_recapture": MessageLookupByLibrary.simpleMessage("다시 촬영"),
    "chon_action_reject": MessageLookupByLibrary.simpleMessage("거절"),
    "chon_action_retry": MessageLookupByLibrary.simpleMessage("다시 시도"),
    "chon_action_save": MessageLookupByLibrary.simpleMessage("저장하기"),
    "chon_action_search_again": MessageLookupByLibrary.simpleMessage("다시 검색"),
    "chon_action_send": MessageLookupByLibrary.simpleMessage("보내기"),
    "chon_action_skip": MessageLookupByLibrary.simpleMessage("건너뛰기"),
    "chon_action_start": MessageLookupByLibrary.simpleMessage("시작하기"),
    "chon_chat_empty_body": MessageLookupByLibrary.simpleMessage(
      "가족 관계, 신원 인증, 가계도에 대해\n질문해 보세요.",
    ),
    "chon_chat_empty_title": MessageLookupByLibrary.simpleMessage(
      "CHON AI에 무엇이든 물어보세요",
    ),
    "chon_chat_input_hint": MessageLookupByLibrary.simpleMessage("메시지를 입력하세요"),
    "chon_chat_title": MessageLookupByLibrary.simpleMessage("CHON AI"),
    "chon_contact_completed": MessageLookupByLibrary.simpleMessage("통화가 끝났어요."),
    "chon_contact_connecting": MessageLookupByLibrary.simpleMessage("연결 중…"),
    "chon_contact_failed": MessageLookupByLibrary.simpleMessage("연결할 수 없어요."),
    "chon_contact_idle_prompt": MessageLookupByLibrary.simpleMessage(
      "연락할 가족을 선택해주세요.",
    ),
    "chon_contact_title": MessageLookupByLibrary.simpleMessage("연락하기"),
    "chon_ft_empty": MessageLookupByLibrary.simpleMessage("가족 정보가 없습니다."),
    "chon_ft_title": MessageLookupByLibrary.simpleMessage("가계도"),
    "chon_home_banner": MessageLookupByLibrary.simpleMessage(
      "상호인증으로 CHON ID를 만들어보세요.",
    ),
    "chon_home_input_label": MessageLookupByLibrary.simpleMessage("입력 정보"),
    "chon_home_mutual_subtitle": MessageLookupByLibrary.simpleMessage(
      "가족, 인척과\n서로를 확인받기",
    ),
    "chon_home_mutual_title": MessageLookupByLibrary.simpleMessage("상호 인증"),
    "chon_home_q_contact": MessageLookupByLibrary.simpleMessage("연락하기\n(가계도)"),
    "chon_home_q_edit_profile": MessageLookupByLibrary.simpleMessage("프로필 수정"),
    "chon_home_q_qr": MessageLookupByLibrary.simpleMessage("QR 코드"),
    "chon_home_q_support": MessageLookupByLibrary.simpleMessage("고객센터"),
    "chon_home_tutorial_card": MessageLookupByLibrary.simpleMessage(
      "나를 확인 받는\nCHON DID 튜토리얼",
    ),
    "chon_id_gen_capture_back": MessageLookupByLibrary.simpleMessage(
      "신분증 뒷면을 가이드 안에 맞춰주세요",
    ),
    "chon_id_gen_capture_front": MessageLookupByLibrary.simpleMessage(
      "신분증 앞면을 가이드 안에 맞춰주세요",
    ),
    "chon_id_gen_capture_tip": MessageLookupByLibrary.simpleMessage(
      "어두운 배경에서 촬영해주세요.\n빛이 반사되지 않도록 방향을 조정해 주세요.",
    ),
    "chon_id_gen_field_phone": MessageLookupByLibrary.simpleMessage("전화번호"),
    "chon_id_gen_ocr_form_title": MessageLookupByLibrary.simpleMessage(
      "ID 생성에 입력할\n개인정보를 입력해주세요",
    ),
    "chon_id_gen_ocr_form_subtitle_prefix":
        MessageLookupByLibrary.simpleMessage("스캔 내용이 틀린부분은 "),
    "chon_id_gen_ocr_form_subtitle_edit":
        MessageLookupByLibrary.simpleMessage("수정"),
    "chon_id_gen_ocr_form_subtitle_suffix":
        MessageLookupByLibrary.simpleMessage(" 해주세요"),
    "chon_id_gen_review_form_title": MessageLookupByLibrary.simpleMessage(
      "ID 생성에 입력할\n추가 정보를 입력해주세요",
    ),
    "chon_id_gen_done": MessageLookupByLibrary.simpleMessage("CHON ID가 발급되었어요"),
    "chon_id_gen_err_required": MessageLookupByLibrary.simpleMessage(
      "필수 정보가 누락되었습니다.",
    ),
    "chon_id_gen_field_address": MessageLookupByLibrary.simpleMessage("주소"),
    "chon_id_gen_field_authority": MessageLookupByLibrary.simpleMessage("발급기관"),
    "chon_id_gen_field_id": MessageLookupByLibrary.simpleMessage(
      "주민등록번호 / 외국인등록번호",
    ),
    "chon_id_gen_field_id_label": MessageLookupByLibrary.simpleMessage("ID 번호"),
    "chon_id_gen_field_issued": MessageLookupByLibrary.simpleMessage("발급일"),
    "chon_id_gen_field_name": MessageLookupByLibrary.simpleMessage("성명"),
    "chon_id_gen_field_name_hint": MessageLookupByLibrary.simpleMessage(
      "신분증 상의 이름",
    ),
    "chon_id_gen_intro_body": MessageLookupByLibrary.simpleMessage(
      "신분증 정보 입력과 촬영을 통해\n나의 CHON ID를 만들어 보세요.",
    ),
    "chon_id_gen_intro_title": MessageLookupByLibrary.simpleMessage(
      "CHON ID 발급을\n시작할게요",
    ),
    "chon_id_gen_ocr_err": MessageLookupByLibrary.simpleMessage(
      "신분증을 인식하지 못했어요. 다시 촬영해주세요.",
    ),
    "chon_id_gen_ocr_no_result": MessageLookupByLibrary.simpleMessage(
      "자동 인식 결과가 없어요. 직접 입력하셨다면 그대로 진행하세요.",
    ),
    "chon_id_gen_ocr_title": MessageLookupByLibrary.simpleMessage(
      "인식 결과를 확인해주세요",
    ),
    "chon_id_gen_pick_type": MessageLookupByLibrary.simpleMessage(
      "발급할 ID 종류를 선택해주세요",
    ),
    "chon_id_gen_prep_start": MessageLookupByLibrary.simpleMessage("촬영 시작"),
    "chon_id_gen_prep_tip1": MessageLookupByLibrary.simpleMessage(
      "어두운 배경에서 촬영해주세요.",
    ),
    "chon_id_gen_prep_tip2": MessageLookupByLibrary.simpleMessage(
      "빛이 반사되지 않도록 방향을 조정하세요.",
    ),
    "chon_id_gen_prep_tip3": MessageLookupByLibrary.simpleMessage(
      "신분증 모서리가 가이드 안에 들어오게 해주세요.",
    ),
    "chon_id_gen_prep_title": MessageLookupByLibrary.simpleMessage(
      "촬영 전 확인해주세요",
    ),
    "chon_id_gen_reenter": MessageLookupByLibrary.simpleMessage("다시 입력"),
    "chon_id_gen_review_finish": MessageLookupByLibrary.simpleMessage("발급하기"),
    "chon_id_gen_review_title": MessageLookupByLibrary.simpleMessage(
      "확인하시고 발급을 완료하세요",
    ),
    "chon_id_gen_title": MessageLookupByLibrary.simpleMessage("신분증 발급"),
    "chon_id_gen_type_family": MessageLookupByLibrary.simpleMessage("가족관계증명서"),
    "chon_id_gen_type_resident": MessageLookupByLibrary.simpleMessage(
      "주민/외국인등록증",
    ),
    "chon_id_gen_type_taekwondo": MessageLookupByLibrary.simpleMessage(
      "태권도 단증",
    ),
    "chon_id_gen_verified_fail": MessageLookupByLibrary.simpleMessage(
      "확인할 수 없어요",
    ),
    "chon_id_gen_verified_ok": MessageLookupByLibrary.simpleMessage("확인되었어요"),
    "chon_mauth_off_intro": MessageLookupByLibrary.simpleMessage(
      "오프라인에서 가족과 서로의\nCHON ID를 확인할 수 있어요.",
    ),
    "chon_mauth_off_my_qr": MessageLookupByLibrary.simpleMessage("내 QR"),
    "chon_mauth_off_no_payload": MessageLookupByLibrary.simpleMessage(
      "이 카드는 QR 정보가 없습니다.",
    ),
    "chon_mauth_off_scan": MessageLookupByLibrary.simpleMessage("상대 QR 스캔하기"),
    "chon_mauth_off_scan_prompt": MessageLookupByLibrary.simpleMessage(
      "상대방의 QR을 사각형 안에 맞춰주세요.",
    ),
    "chon_mauth_off_scan_sub": MessageLookupByLibrary.simpleMessage(
      "카메라로 상대방의 QR을 인식합니다.",
    ),
    "chon_mauth_off_scan_title": MessageLookupByLibrary.simpleMessage("QR 스캔"),
    "chon_mauth_off_show": MessageLookupByLibrary.simpleMessage("내 QR 보여주기"),
    "chon_mauth_off_show_prompt": MessageLookupByLibrary.simpleMessage(
      "상대방에게 이 QR을 보여주세요.",
    ),
    "chon_mauth_off_show_sub": MessageLookupByLibrary.simpleMessage(
      "상대방이 내 QR을 스캔합니다.",
    ),
    "chon_mauth_off_title": MessageLookupByLibrary.simpleMessage("오프라인 상호인증"),
    "chon_mauth_off_verified": MessageLookupByLibrary.simpleMessage("인증되었습니다"),
    "chon_mauth_off_verifying": MessageLookupByLibrary.simpleMessage("확인 중…"),
    "chon_mauth_rcv_anonymous": MessageLookupByLibrary.simpleMessage("익명"),
    "chon_mauth_rcv_approved": MessageLookupByLibrary.simpleMessage("승인 완료"),
    "chon_mauth_rcv_approving": MessageLookupByLibrary.simpleMessage(
      "승인 처리 중…",
    ),
    "chon_mauth_rcv_detail": MessageLookupByLibrary.simpleMessage("요청 상세"),
    "chon_mauth_rcv_empty": MessageLookupByLibrary.simpleMessage(
      "받은 요청이 없습니다.",
    ),
    "chon_mauth_rcv_rejected": MessageLookupByLibrary.simpleMessage("거절 완료"),
    "chon_mauth_rcv_rejecting": MessageLookupByLibrary.simpleMessage(
      "거절 처리 중…",
    ),
    "chon_mauth_rcv_title": MessageLookupByLibrary.simpleMessage("받은 인증 요청"),
    "chon_mauth_req_approved": MessageLookupByLibrary.simpleMessage("승인되었습니다."),
    "chon_mauth_req_awaiting": MessageLookupByLibrary.simpleMessage(
      "요청을 보냈어요.\n상대방의 응답을 기다려주세요.",
    ),
    "chon_mauth_req_confirm_q": MessageLookupByLibrary.simpleMessage(
      "이 분 맞으신가요?",
    ),
    "chon_mauth_req_done": MessageLookupByLibrary.simpleMessage("인증이 완료되었어요."),
    "chon_mauth_req_err_notfound": MessageLookupByLibrary.simpleMessage(
      "해당 사용자를 찾지 못했습니다.",
    ),
    "chon_mauth_req_err_phone": MessageLookupByLibrary.simpleMessage(
      "전화번호를 입력해주세요.",
    ),
    "chon_mauth_req_phone_prompt": MessageLookupByLibrary.simpleMessage(
      "인증할 가족의\n전화번호를 입력해주세요.",
    ),
    "chon_mauth_req_rejected": MessageLookupByLibrary.simpleMessage("거절되었습니다."),
    "chon_mauth_req_retry_msg": MessageLookupByLibrary.simpleMessage(
      "다음에 다시 시도해주세요.",
    ),
    "chon_mauth_req_send": MessageLookupByLibrary.simpleMessage("요청 보내기"),
    "chon_mauth_req_sending": MessageLookupByLibrary.simpleMessage(
      "요청을 보내고 있어요…",
    ),
    "chon_mauth_req_title": MessageLookupByLibrary.simpleMessage("상호 인증"),
    "chon_nav_chon": MessageLookupByLibrary.simpleMessage("CHON"),
    "chon_nav_family_tree": MessageLookupByLibrary.simpleMessage("가계도"),
    "chon_nav_home": MessageLookupByLibrary.simpleMessage("홈"),
    "chon_nav_id_card": MessageLookupByLibrary.simpleMessage("신분증"),
    "chon_nav_mutual": MessageLookupByLibrary.simpleMessage("상호인증"),
    "chon_profile_edit_given": MessageLookupByLibrary.simpleMessage("이름"),
    "chon_profile_edit_required": MessageLookupByLibrary.simpleMessage(
      "필수 항목입니다.",
    ),
    "chon_profile_edit_surname": MessageLookupByLibrary.simpleMessage("성"),
    "chon_profile_edit_title": MessageLookupByLibrary.simpleMessage("프로필 수정"),
    "chon_report_empty": MessageLookupByLibrary.simpleMessage("이전 신고가 없습니다."),
    "chon_report_err_required": MessageLookupByLibrary.simpleMessage(
      "제목과 내용을 입력해주세요.",
    ),
    "chon_report_failed": MessageLookupByLibrary.simpleMessage("전송에 실패했어요."),
    "chon_report_field_content": MessageLookupByLibrary.simpleMessage("내용"),
    "chon_report_field_content_hint": MessageLookupByLibrary.simpleMessage(
      "발생한 문제를 자세히 적어주세요.",
    ),
    "chon_report_field_title": MessageLookupByLibrary.simpleMessage("제목"),
    "chon_report_field_title_hint": MessageLookupByLibrary.simpleMessage(
      "신고 제목을 입력해주세요.",
    ),
    "chon_report_new": MessageLookupByLibrary.simpleMessage("새 신고하기"),
    "chon_report_sending": MessageLookupByLibrary.simpleMessage("신고를 보내는 중…"),
    "chon_report_submitted": MessageLookupByLibrary.simpleMessage(
      "신고가 접수되었어요.",
    ),
    "chon_report_submitted_sub": MessageLookupByLibrary.simpleMessage(
      "확인 후 빠른 시일 내에 답변 드리겠습니다.",
    ),
    "chon_report_title": MessageLookupByLibrary.simpleMessage("문제 신고"),
    "chon_tutorial_s1_body": MessageLookupByLibrary.simpleMessage(
      "내 신분을 가족·인척에게\n확인 받고, 필요한 곳에 인증해 보세요.",
    ),
    "chon_tutorial_s1_title": MessageLookupByLibrary.simpleMessage(
      "나를 확인 받는\nCHON DID",
    ),
    "chon_tutorial_s2_body": MessageLookupByLibrary.simpleMessage(
      "가족과 서로를 인증해\n관계를 증명하세요.",
    ),
    "chon_tutorial_s2_title": MessageLookupByLibrary.simpleMessage(
      "서로를 인증하는\n상호 인증",
    ),
    "chon_tutorial_s3_body": MessageLookupByLibrary.simpleMessage(
      "가족 관계를 시각화하고\n족보를 안전하게 보관합니다.",
    ),
    "chon_tutorial_s3_title": MessageLookupByLibrary.simpleMessage(
      "나의 가족과 함께\n가계도",
    ),
    "chon_tutorial_s4_body": MessageLookupByLibrary.simpleMessage(
      "준비가 끝났습니다.\n지금 바로 사용해 보세요.",
    ),
    "chon_tutorial_s4_title": MessageLookupByLibrary.simpleMessage(
      "CHON과 함께\n시작해 볼까요?",
    ),
    "clan": MessageLookupByLibrary.simpleMessage("성씨"),
    "clanOfCertificate": MessageLookupByLibrary.simpleMessage("종원증"),
    "close": MessageLookupByLibrary.simpleMessage("닫기"),
    "coating": MessageLookupByLibrary.simpleMessage("도장"),
    "confirm": MessageLookupByLibrary.simpleMessage("확인"),
    "confirmCheckInOut": MessageLookupByLibrary.simpleMessage(
      "체크인/체크아웃\n하시겠습니까?",
    ),
    "confirmDelete": MessageLookupByLibrary.simpleMessage("삭제하시겠습니까?"),
    "confirmRelationSuffix": m0,
    "confirmed": MessageLookupByLibrary.simpleMessage("확인되었습니다"),
    "connect": MessageLookupByLibrary.simpleMessage("접속하기"),
    "connectionError": MessageLookupByLibrary.simpleMessage(
      "연결 오류입니다. 다시 시도해 주세요",
    ),
    "connectionInterrupted": MessageLookupByLibrary.simpleMessage(
      "연결이 중단되었습니다. 다시 시도해 주세요",
    ),
    "contactAction": MessageLookupByLibrary.simpleMessage("연락하기"),
    "copied": MessageLookupByLibrary.simpleMessage("복사되었습니다"),
    "copy": MessageLookupByLibrary.simpleMessage("복사"),
    "copyIdLink": MessageLookupByLibrary.simpleMessage("제출할 ID(신분증) 링크를복사해주세요"),
    "copyLink": MessageLookupByLibrary.simpleMessage("링크복사"),
    "copyVerificationLink": MessageLookupByLibrary.simpleMessage("본인확인 링크 복사"),
    "count": MessageLookupByLibrary.simpleMessage("세"),
    "cousin": MessageLookupByLibrary.simpleMessage("사촌"),
    "cousin_brother": MessageLookupByLibrary.simpleMessage("사촌"),
    "cousin_brother_in_law": MessageLookupByLibrary.simpleMessage("사촌형부"),
    "cousin_sister": MessageLookupByLibrary.simpleMessage("사촌"),
    "cousin_sister_in_law": MessageLookupByLibrary.simpleMessage("사촌형수"),
    "cousins_child": MessageLookupByLibrary.simpleMessage("사촌조카"),
    "cousins_childs_child": MessageLookupByLibrary.simpleMessage("재종손"),
    "create": MessageLookupByLibrary.simpleMessage("생성하기"),
    "createSelfId": MessageLookupByLibrary.simpleMessage("SelfID 생성"),
    "createSelfIdTitle": MessageLookupByLibrary.simpleMessage(
      "Self ID(신분증)만들기",
    ),
    "dateOfIssue": MessageLookupByLibrary.simpleMessage("발행일"),
    "daughter": MessageLookupByLibrary.simpleMessage("자녀"),
    "daughter2": MessageLookupByLibrary.simpleMessage("녀"),
    "daughterInLaw": MessageLookupByLibrary.simpleMessage("며느리"),
    "delete": MessageLookupByLibrary.simpleMessage("지우기"),
    "driverLicense": MessageLookupByLibrary.simpleMessage("운전면허증"),
    "duplicateNameSelectNumber": MessageLookupByLibrary.simpleMessage(
      "같은 이름이있습니다. 번호를 선택해주세요.",
    ),
    "editProfile": MessageLookupByLibrary.simpleMessage("프로필 편집"),
    "elder_brother": MessageLookupByLibrary.simpleMessage("형"),
    "elder_sister": MessageLookupByLibrary.simpleMessage("자"),
    "emailExists": MessageLookupByLibrary.simpleMessage("이미 등록된 이메일이에요"),
    "emailFormat": MessageLookupByLibrary.simpleMessage("이메일 형식이 올바르지 않아요"),
    "emailLabel": MessageLookupByLibrary.simpleMessage("이메일"),
    "emailRequired": MessageLookupByLibrary.simpleMessage("이메일을\n입력해 주세요"),
    "english": MessageLookupByLibrary.simpleMessage("영어"),
    "enter": MessageLookupByLibrary.simpleMessage("입력하기"),
    "enterAccountNumber": MessageLookupByLibrary.simpleMessage("계좌번호 입력"),
    "enterInfoForIdCreation": MessageLookupByLibrary.simpleMessage(
      "신분증 생성에 필요한\n개인정보를 입력해주세요",
    ),
    "enterNameAndRelationship": MessageLookupByLibrary.simpleMessage(
      "이름을 입력해주시고\n‘관계’를 설정해주세요",
    ),
    "enterWithoutHyphen": MessageLookupByLibrary.simpleMessage("-없이 입력해주세요"),
    "error": MessageLookupByLibrary.simpleMessage("오류"),
    "errorPageNotLoading": MessageLookupByLibrary.simpleMessage("페이지 안뜸"),
    "family": MessageLookupByLibrary.simpleMessage("종중증"),
    "familyCertificate": MessageLookupByLibrary.simpleMessage("가족증"),
    "familyEditInstruction": MessageLookupByLibrary.simpleMessage(
      "가족 아이콘을 누르시고\n“추가하기/지우기” 버튼을 누르시면\n편집이 가능합니다.",
    ),
    "familyTree": MessageLookupByLibrary.simpleMessage("가계도"),
    "father": MessageLookupByLibrary.simpleMessage("아버지"),
    "father_2": MessageLookupByLibrary.simpleMessage("부"),
    "female": MessageLookupByLibrary.simpleMessage("여성"),
    "field_given_name": MessageLookupByLibrary.simpleMessage("길순"),
    "field_surname": MessageLookupByLibrary.simpleMessage("홍"),
    "fillAllRequiredFields": MessageLookupByLibrary.simpleMessage(
      "필수 정보를 모두 입력해주세요",
    ),
    "finishSigup": MessageLookupByLibrary.simpleMessage("가입이 완료되었어요!"),
    "firstTimeChon": MessageLookupByLibrary.simpleMessage(
      "Chon이 처음이세요?\n지금 바로 생성하세요",
    ),
    "gender": MessageLookupByLibrary.simpleMessage("성별"),
    "goToHome": MessageLookupByLibrary.simpleMessage("홈으로 가기"),
    "grandfather": MessageLookupByLibrary.simpleMessage("할아버지"),
    "grandmother": MessageLookupByLibrary.simpleMessage("할머니"),
    "greenOnion": MessageLookupByLibrary.simpleMessage("파"),
    "groupCall": MessageLookupByLibrary.simpleMessage("단체전화"),
    "groupChat": MessageLookupByLibrary.simpleMessage("단체톡"),
    "guidanceAndAgreement": MessageLookupByLibrary.simpleMessage("안내 및 동의"),
    "hello": MessageLookupByLibrary.simpleMessage("안녕하세요"),
    "hint_ask_anything": MessageLookupByLibrary.simpleMessage("무엇이든 물어보세요"),
    "hint_select_contact": MessageLookupByLibrary.simpleMessage(
      "연락할 분을 선택해주세요",
    ),
    "history": MessageLookupByLibrary.simpleMessage("기록"),
    "home": MessageLookupByLibrary.simpleMessage("홈"),
    "howCanIhelpYou": MessageLookupByLibrary.simpleMessage("무엇을 도와드릴까요?"),
    "howToCreateSelfId": MessageLookupByLibrary.simpleMessage(
      "어떤 방법으로\nSelf ID(신분증)를\n생성할까요?",
    ),
    "husband": MessageLookupByLibrary.simpleMessage("남편"),
    "idCardAreaGuide": MessageLookupByLibrary.simpleMessage(
      "표시된 영역안에 신분증을 잘 넣어주세요.",
    ),
    "idCardTypes": MessageLookupByLibrary.simpleMessage(
      "모바일 신분증, 주민등록증, 운전면허증",
    ),
    "idCheckCompleted": MessageLookupByLibrary.simpleMessage(
      "ID(신분증) 확인이\n완료 되었습니다",
    ),
    "idList": MessageLookupByLibrary.simpleMessage("ID 목록"),
    "idNumber": MessageLookupByLibrary.simpleMessage("거소신고번호"),
    "idVerificationCompleted": MessageLookupByLibrary.simpleMessage(
      "신분증 확인이\n완료 되었습니다",
    ),
    "identityCard": MessageLookupByLibrary.simpleMessage("주민등록증"),
    "image": MessageLookupByLibrary.simpleMessage("사진"),
    "infoRequired": MessageLookupByLibrary.simpleMessage("정보를 입력해주세요"),
    "info_account_holder": m1,
    "info_issued_date": m2,
    "information": MessageLookupByLibrary.simpleMessage("입력정보"),
    "inputInfoTitle": MessageLookupByLibrary.simpleMessage("입력 정보"),
    "inquiryTitle": MessageLookupByLibrary.simpleMessage("문의하기"),
    "issueNumber": MessageLookupByLibrary.simpleMessage("이 있습니다. 확인해주세요."),
    "issued": MessageLookupByLibrary.simpleMessage("발급"),
    "issuedDate": MessageLookupByLibrary.simpleMessage("발급일자"),
    "issuer": MessageLookupByLibrary.simpleMessage("발행처"),
    "korean": MessageLookupByLibrary.simpleMessage("한글"),
    "label_aptitude_test": MessageLookupByLibrary.simpleMessage("적성검사"),
    "label_content": MessageLookupByLibrary.simpleMessage("콘텐츠"),
    "label_expiration_date": MessageLookupByLibrary.simpleMessage("만료일"),
    "label_license_number": MessageLookupByLibrary.simpleMessage("면허번호"),
    "language": MessageLookupByLibrary.simpleMessage("언어"),
    "languageOption": MessageLookupByLibrary.simpleMessage("언어"),
    "level": MessageLookupByLibrary.simpleMessage("단"),
    "levelNumber": MessageLookupByLibrary.simpleMessage("단번호"),
    "like": MessageLookupByLibrary.simpleMessage("호"),
    "little_brother": MessageLookupByLibrary.simpleMessage("제"),
    "little_sister": MessageLookupByLibrary.simpleMessage("매"),
    "logOut": MessageLookupByLibrary.simpleMessage("로그아웃"),
    "loginSessionExpired": MessageLookupByLibrary.simpleMessage(
      "로그인 세션이 만료되었습니다",
    ),
    "makeCall": MessageLookupByLibrary.simpleMessage("전화하기"),
    "male": MessageLookupByLibrary.simpleMessage("남성"),
    "manualInput": MessageLookupByLibrary.simpleMessage("직접 입력"),
    "maternalGrandfather": MessageLookupByLibrary.simpleMessage("외할아버지"),
    "maternalGrandmother": MessageLookupByLibrary.simpleMessage("외할머니"),
    "membershipCard": MessageLookupByLibrary.simpleMessage("회원증"),
    "menuTitle": MessageLookupByLibrary.simpleMessage("메뉴"),
    "message": MessageLookupByLibrary.simpleMessage("메시지"),
    "mobileNumber": MessageLookupByLibrary.simpleMessage("모바일 번호"),
    "mobilePhoneNumber": MessageLookupByLibrary.simpleMessage("모바일번호"),
    "mother": MessageLookupByLibrary.simpleMessage("어머니"),
    "mother_2": MessageLookupByLibrary.simpleMessage("모"),
    "mutualAuthDesc": MessageLookupByLibrary.simpleMessage(
      "가족, 인척, 지인과\n서로 신분 확인하기",
    ),
    "mutualAuthTitle": MessageLookupByLibrary.simpleMessage("상호 인증"),
    "mutualAuthentication": MessageLookupByLibrary.simpleMessage("상호인증"),
    "myInfo": MessageLookupByLibrary.simpleMessage("거소증"),
    "myInformation": MessageLookupByLibrary.simpleMessage("내 정보"),
    "myReportHistoryTitle": MessageLookupByLibrary.simpleMessage("나의 신고 내역"),
    "name": MessageLookupByLibrary.simpleMessage("성명"),
    "nameLabel": MessageLookupByLibrary.simpleMessage("이름"),
    "nationality": MessageLookupByLibrary.simpleMessage("국가"),
    "nephew": MessageLookupByLibrary.simpleMessage("손자"),
    "nephewInLaw": MessageLookupByLibrary.simpleMessage("조카사위"),
    "next": MessageLookupByLibrary.simpleMessage("다음"),
    "niece": MessageLookupByLibrary.simpleMessage("손녀"),
    "nieceInLaw": MessageLookupByLibrary.simpleMessage("조카며느리"),
    "niece_nephew": MessageLookupByLibrary.simpleMessage("조카"),
    "noCard": MessageLookupByLibrary.simpleMessage("현재 보유하신\nID가 없습니다"),
    "noCardsFound": MessageLookupByLibrary.simpleMessage("카드가 없습니다"),
    "noContact": MessageLookupByLibrary.simpleMessage("연락처 정보를 찾을 수 없습니다."),
    "noRequest": MessageLookupByLibrary.simpleMessage("인증 요청이 존재하지 않습니다."),
    "origin": MessageLookupByLibrary.simpleMessage("본관"),
    "other": MessageLookupByLibrary.simpleMessage("기타"),
    "other_grand": MessageLookupByLibrary.simpleMessage("종손자"),
    "otpRequired": MessageLookupByLibrary.simpleMessage(
      "이메일로 발송된 인증번호\n4자리를 입력해 주세요",
    ),
    "ownedIdList": MessageLookupByLibrary.simpleMessage("보유 ID 목록"),
    "ownerName": m3,
    "pa": MessageLookupByLibrary.simpleMessage("파"),
    "passport": MessageLookupByLibrary.simpleMessage("여권"),
    "password": MessageLookupByLibrary.simpleMessage("비밀번호"),
    "passwordMatching": MessageLookupByLibrary.simpleMessage("비밀번호 일치"),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "사용할 비밀번호를\n입력해 주세요",
    ),
    "personToVerify": MessageLookupByLibrary.simpleMessage("내가 인증해줄사람"),
    "personalInfo": MessageLookupByLibrary.simpleMessage("개인정보"),
    "phoneNotMatch": MessageLookupByLibrary.simpleMessage("전화번호가 일치하지 않습니다."),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("휴대폰 번호"),
    "phoneNumberLabel": MessageLookupByLibrary.simpleMessage("전화번호"),
    "pleaseAddVerifier": MessageLookupByLibrary.simpleMessage(
      "최소한 한 명의 검증자를 추가하세요",
    ),
    "pleaseCreateCertificate": MessageLookupByLibrary.simpleMessage(
      "계속하려면 인증서를 생성하세요.",
    ),
    "pleaseEnter": MessageLookupByLibrary.simpleMessage("입력해 주세요"),
    "pleaseEnterAccount": MessageLookupByLibrary.simpleMessage("계좌번호를\n입력해주세요"),
    "pleaseEnterPassword": MessageLookupByLibrary.simpleMessage(
      "비밀번호를 입력해 주세요",
    ),
    "pleaseEnterPhone": MessageLookupByLibrary.simpleMessage(
      "휴대폰 번호를\n입력해 주세요",
    ),
    "pleaseEnterUsername": MessageLookupByLibrary.simpleMessage("아이디를 입력해 주세요"),
    "pleaseFillAllFields": MessageLookupByLibrary.simpleMessage(
      "모든 필드를 작성해 주세요",
    ),
    "pleaseRequestIdentityVerification": MessageLookupByLibrary.simpleMessage(
      "아래 요청자에 대해서 본인확인 요청해주세요",
    ),
    "pleaseSelectBank": MessageLookupByLibrary.simpleMessage("은행을 선택해주세요"),
    "pleaseSelectIds": MessageLookupByLibrary.simpleMessage(
      "아래 ID중에서 선택해주세요\n없으신 경우는 ‘메시지\'를 이용해주세요",
    ),
    "pleaseSelectIdsToSubmit": MessageLookupByLibrary.simpleMessage(
      "제출할 ID를 선택해주세요",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("개인정보 처리방침"),
    "profile": MessageLookupByLibrary.simpleMessage("프로필"),
    "qrCheckInOut": MessageLookupByLibrary.simpleMessage("QR 체크인/체크아웃"),
    "qrScanComplete": MessageLookupByLibrary.simpleMessage(
      "QR 스캔 완료!\n아래 접속하기를 눌러주세요",
    ),
    "qrScanOrUpload": MessageLookupByLibrary.simpleMessage(
      "QR코드를 스캔하거나 업로드 해보세요.",
    ),
    "readAndAgree": MessageLookupByLibrary.simpleMessage("아래 안내를 읽고 동의"),
    "redirectIdCreation": MessageLookupByLibrary.simpleMessage(
      "ID 생성단계로 이동하겠습니다",
    ),
    "refusal": MessageLookupByLibrary.simpleMessage("거절"),
    "refusalSuccess": MessageLookupByLibrary.simpleMessage("거절 성공"),
    "registerToFamilyTreeGuide": MessageLookupByLibrary.simpleMessage(
      "확인하면 내 가계도에 등록됩니다",
    ),
    "relationship": MessageLookupByLibrary.simpleMessage("관계"),
    "relatives": MessageLookupByLibrary.simpleMessage("친척"),
    "reportContentLabel": MessageLookupByLibrary.simpleMessage("신고내용"),
    "reportProblem": MessageLookupByLibrary.simpleMessage("문제신고"),
    "reportProblemTitle": MessageLookupByLibrary.simpleMessage("문제 신고하기"),
    "requestVerificationGuide": MessageLookupByLibrary.simpleMessage(
      "가족, 인척, 지인에게\n확인을 요청해주세요\n(상호인증)",
    ),
    "requesterList": MessageLookupByLibrary.simpleMessage("요청자 목록"),
    "requireBothUpAndLowerCase": MessageLookupByLibrary.simpleMessage(
      "영문 대, 소문자 포함",
    ),
    "requireConfirmPassword": MessageLookupByLibrary.simpleMessage(
      "한 번 더 입력해 주세요",
    ),
    "requireSpecial": MessageLookupByLibrary.simpleMessage("특수문자 포함"),
    "requiredField": MessageLookupByLibrary.simpleMessage("필수"),
    "requiredFieldsNoticeHighlight": MessageLookupByLibrary.simpleMessage("필수"),
    "requiredFieldsNoticePrefix": MessageLookupByLibrary.simpleMessage(
      "모든 빈칸은 ",
    ),
    "requiredFieldsNoticeSuffix": MessageLookupByLibrary.simpleMessage("입니다"),
    "resend": MessageLookupByLibrary.simpleMessage("다시 발송하기"),
    "residenceCard": MessageLookupByLibrary.simpleMessage("거소증"),
    "residentNumber": MessageLookupByLibrary.simpleMessage("주민번호"),
    "residentNumberFirstPartInvalid": MessageLookupByLibrary.simpleMessage(
      "주민등록번호 앞자리는 6자리여야 합니다 (YYMMDD)",
    ),
    "residentNumberSecondPartInvalid": MessageLookupByLibrary.simpleMessage(
      "주민등록번호 뒷자리는 7자리여야 합니다",
    ),
    "ruler": MessageLookupByLibrary.simpleMessage("자"),
    "save": MessageLookupByLibrary.simpleMessage("저장"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("QR 코드 스캔"),
    "se": MessageLookupByLibrary.simpleMessage("세"),
    "select": MessageLookupByLibrary.simpleMessage("선택하기"),
    "selectCardType": MessageLookupByLibrary.simpleMessage("카드 종류 선택"),
    "selectFamilyRelationship": MessageLookupByLibrary.simpleMessage(
      "가족 관계를 선택해주세요",
    ),
    "selectIdToSubmit": MessageLookupByLibrary.simpleMessage(
      "제출할 ID(신분증)를선택해 주세요",
    ),
    "selectPortraitPhoto": MessageLookupByLibrary.simpleMessage(
      "인물 사진을 선택해주세요",
    ),
    "self": MessageLookupByLibrary.simpleMessage("본인"),
    "self_id_created": MessageLookupByLibrary.simpleMessage("Self ID가 생성되었습니다"),
    "sendButton": MessageLookupByLibrary.simpleMessage("보내기"),
    "sendSms": MessageLookupByLibrary.simpleMessage("문자하기"),
    "sendTextMessage": MessageLookupByLibrary.simpleMessage("문자 전송"),
    "serviceInterruption": MessageLookupByLibrary.simpleMessage(
      "서비스를 일시적으로 사용할 수 없습니다",
    ),
    "serviceTermsAddendumContent": MessageLookupByLibrary.simpleMessage(
      "1. 본 약관은 [2026.02.01]부터 시행합니다.\n2. 본 약관 시행 이전 가입 회원에 대하여도 본 약관이 적용됩니다(단, 관련 법령상 제한이 있는 경우 예외).",
    ),
    "serviceTermsAddendumTitle": MessageLookupByLibrary.simpleMessage("부칙"),
    "serviceTermsAgreeCheckbox": MessageLookupByLibrary.simpleMessage(
      "(본조) 이용약관 동의",
    ),
    "serviceTermsArt10Content": MessageLookupByLibrary.simpleMessage(
      "이용자는 다음 각 호의 행위를 해서는 안 됩니다.\n1. 타인의 계정 도용, 명의도용, 사칭\n2. 불법 정보 게시, 저작권 침해, 음란물/불법촬영물 관련 행위\n3. 서비스 또는 서버에 과부하를 유발하거나 보안을 침해하는 행위\n4. 자동화 수단을 통한 무단 수집/스크래핑/크롤링(회사 허용 범위 제외)\n5. 타인의 권리(초상권, 개인정보, 명예 등) 침해\n6. 기타 법령 또는 선량한 풍속·사회질서에 반하는 행위",
    ),
    "serviceTermsArt10Title": MessageLookupByLibrary.simpleMessage(
      "제10조(금지행위)",
    ),
    "serviceTermsArt11Content": MessageLookupByLibrary.simpleMessage(
      "1. 회사는 회원이 본 약관 또는 운영정책을 위반한 경우, 위반 정도에 따라 경고, 콘텐츠 삭제/비공개, 기능 제한, 이용정지, 영구이용정지(계정 해지) 등의 조치를 할 수 있습니다.\n2. 회원은 언제든지 서비스 내 절차를 통해 이용계약을 해지(회원탈퇴)할 수 있습니다.\n3. 이용제한 또는 해지 후에도 관련 법령 및 회사의 보관정책에 따라 일부 정보는 일정 기간 보관될 수 있으며, 구체 사항은 개인정보처리방침에 따릅니다.",
    ),
    "serviceTermsArt11Title": MessageLookupByLibrary.simpleMessage(
      "제11조(이용제한 및 계약해지)",
    ),
    "serviceTermsArt12Content": MessageLookupByLibrary.simpleMessage(
      "1. 유료서비스의 내용, 요금, 결제방법, 제공기간, 환불 기준 등은 별도 안내(서비스 화면/결제 페이지/환불정책)에 따릅니다.\n2. 구독형 서비스의 자동 갱신, 해지, 환불 조건은 결제 수단 및 스토어 정책(예: 앱마켓)과 회사 정책이 함께 적용될 수 있습니다.",
    ),
    "serviceTermsArt12Title": MessageLookupByLibrary.simpleMessage(
      "제12조(유료서비스 및 결제)",
    ),
    "serviceTermsArt13Content": MessageLookupByLibrary.simpleMessage(
      "1. 회사는 천재지변, 전쟁, 정전, 통신망 장애, 제3자 서비스 장애 등 불가항력으로 서비스를 제공할 수 없는 경우 책임을 지지 않습니다.\n2. 회사는 이용자 간 분쟁, 이용자가 입력한 정보의 정확성, 상호인증 결과의 신뢰성, 콘텐츠의 적법성에 대해 법령상 책임이 인정되는 경우를 제외하고 책임을 지지 않습니다.\n3. AI 기능이 제공되는 경우, AI의 출력은 참고용이며(오류 가능), 최종 판단과 책임은 이용자에게 있습니다.",
    ),
    "serviceTermsArt13Title": MessageLookupByLibrary.simpleMessage(
      "제13조(면책 및 책임 제한)",
    ),
    "serviceTermsArt14Content": MessageLookupByLibrary.simpleMessage(
      "1. 회사는 회원이 등록한 이메일/휴대폰번호/앱 푸시/서비스 내 알림 등 합리적인 방법으로 통지할 수 있습니다.\n2. 회원이 연락처를 최신으로 유지하지 않아 통지를 받지 못한 경우 그에 따른 불이익은 회원에게 있습니다.",
    ),
    "serviceTermsArt14Title": MessageLookupByLibrary.simpleMessage("제14조(통지)"),
    "serviceTermsArt15Content": MessageLookupByLibrary.simpleMessage(
      "개인정보의 처리(수집·이용·제공·위탁·파기 등)에 관한 사항은 개인정보처리방침 및 관련 동의 절차에 따릅니다. 이용약관만으로 개인정보 동의를 대체하지 않습니다.",
    ),
    "serviceTermsArt15Title": MessageLookupByLibrary.simpleMessage(
      "제15조(개인정보보호)",
    ),
    "serviceTermsArt16Content": MessageLookupByLibrary.simpleMessage(
      "1. 본 약관은 대한민국 법령에 따라 해석·적용됩니다.\n2. 서비스 이용과 관련하여 분쟁이 발생할 경우, 당사자 간 협의로 해결을 우선하며, 협의가 불성립할 경우 서울중앙지방법원을 전속 관할로 합니다(또는 민사소송법상 관할 법원).",
    ),
    "serviceTermsArt16Title": MessageLookupByLibrary.simpleMessage(
      "제16조(준거법 및 관할)",
    ),
    "serviceTermsArt1Content": MessageLookupByLibrary.simpleMessage(
      "본 약관은 회사가 제공하는 촌(Chon) 서비스의 이용과 관련하여 회사와 이용자(회원 포함) 간 권리·의무 및 책임사항, 이용조건과 절차, 기타 필요한 사항을 규정함을 목적으로 합니다.",
    ),
    "serviceTermsArt1Title": MessageLookupByLibrary.simpleMessage("제1조(목적)"),
    "serviceTermsArt2Content": MessageLookupByLibrary.simpleMessage(
      "1. 서비스: 회사가 제공하는 촌(Chon) 앱/웹 및 관련 제반 서비스를 말합니다.\n2. 이용자: 서비스에 접속하여 본 약관에 따라 회사가 제공하는 서비스를 이용하는 자를 말합니다.\n3. 회원: 본 약관에 동의하고 계정을 생성하여 서비스를 이용하는 자를 말합니다.\n4. 계정: 회원 식별 및 서비스 이용을 위하여 회원이 설정한 로그인 수단(이메일/휴대폰번호/소셜로그인 등)과 이에 부수한 정보를 말합니다.\n5. 콘텐츠: 회원이 서비스 내에 게시·등록·업로드·전송하는 문자, 이미지, 문서(PDF 포함), 링크, 데이터(가계도/관계도/프로필 정보 포함) 및 기타 정보를 말합니다.\n6. 상호인증: 회원 간 특정 관계(가족/친구/조직 등)를 확인·연결하기 위해 서비스가 제공하는 인증 절차 또는 기능을 말합니다.\n7. 유료서비스: 회사가 유상으로 제공하는 구독, 이용권, 부가 기능 등을 말합니다(해당하는 경우에 한함).",
    ),
    "serviceTermsArt2Title": MessageLookupByLibrary.simpleMessage("제2조(정의)"),
    "serviceTermsArt3Content": MessageLookupByLibrary.simpleMessage(
      "1. 본 약관은 서비스 화면(초기화면 또는 연결화면)에 게시하거나 기타 방법으로 공지하고, 회원이 이에 동의함으로써 효력이 발생합니다.\n2. 회사는 관련 법령을 위반하지 않는 범위에서 본 약관을 개정할 수 있습니다.\n3. 본 약관에서 정하지 아니한 사항과 해석에 관하여는 관련 법령 및 회사가 별도로 정한 운영정책/가이드, 일반적인 거래관행에 따릅니다.",
    ),
    "serviceTermsArt3Title": MessageLookupByLibrary.simpleMessage(
      "제3조(약관의 효력 및 적용)",
    ),
    "serviceTermsArt4Content": MessageLookupByLibrary.simpleMessage(
      "1. 회사가 약관을 개정하는 경우 적용일자, 개정내용, 개정사유를 명시하여 서비스 내 공지합니다.\n2. 중요 변경 또는 이용자에게 불리한 변경의 경우, 회사는 합리적인 기간을 두고(예: 최소 30일 전) 공지 및 필요 시 개별 통지합니다.\n3. 약관 변경에 동의하지 않는 회원은 변경 약관 적용 전까지 이용계약을 해지(회원탈퇴)할 수 있습니다.",
    ),
    "serviceTermsArt4Title": MessageLookupByLibrary.simpleMessage(
      "제4조(약관의 변경 및 공지)",
    ),
    "serviceTermsArt5Content": MessageLookupByLibrary.simpleMessage(
      "1. 회원가입은 이용자가 약관 동의 후 회사가 정한 절차(계정 생성, 본인확인 등)를 완료함으로써 성립합니다.\n2. 회원은 계정 정보의 최신성을 유지해야 하며, 허위 정보 제공 또는 타인 정보 도용으로 인한 불이익은 회원에게 책임이 있습니다.\n3. 회원은 계정·비밀번호(또는 인증수단) 관리 책임이 있으며, 제3자 사용이 의심될 경우 즉시 회사에 통지해야 합니다.",
    ),
    "serviceTermsArt5Title": MessageLookupByLibrary.simpleMessage(
      "제5조(회원가입 및 계정 관리)",
    ),
    "serviceTermsArt6Content": MessageLookupByLibrary.simpleMessage(
      "1. 만 14세 미만 아동의 회원가입 및 개인정보 관련 절차는 법정대리인의 동의 등 관련 법령에 따릅니다(서비스 정책에 따라 가입 제한 가능).\n2. 회사는 필요 시 연령 확인 또는 법정대리인 동의를 요청할 수 있습니다.",
    ),
    "serviceTermsArt6Title": MessageLookupByLibrary.simpleMessage(
      "제6조(미성년자의 이용)",
    ),
    "serviceTermsArt7Content": MessageLookupByLibrary.simpleMessage(
      "1. 회사는 다음 각 호의 서비스를 제공할 수 있습니다.\na. 상호인증 기반 관계(가족/친구/조직 등) 연결 및 관리 기능\nb. 가계도/관계도 생성·열람·공유 기능\nc. 프로필/ID(신분·인맥) 구성 및 표시 기능\nd. 문서/이미지 업로드 및 정리 기능(PDF 포함)\ne. AI 기반 검색·요약·질의응답 등 부가 기능(해당 시)\n2. 회사는 서비스의 전부 또는 일부를 변경·중단할 수 있으며, 중대한 변경·중단 시 사전 공지합니다.\n3. 회사는 운영상·기술상 필요에 따라 점검을 실시할 수 있고, 점검 시간은 서비스 화면에 공지합니다.",
    ),
    "serviceTermsArt7Title": MessageLookupByLibrary.simpleMessage(
      "제7조(서비스 제공 및 변경)",
    ),
    "serviceTermsArt8Content": MessageLookupByLibrary.simpleMessage(
      "1. 상호인증은 회원 간 관계 확인을 돕기 위한 기능이며, 회사는 회원 간 실제 관계의 법적 효력이나 진실성을 보증하지 않습니다.\n2. 회원은 타인의 동의 없이 타인에 관한 민감한 정보(예: 주민등록번호 등)를 입력·게시해서는 안 됩니다.\n3. 관계 데이터(가계도/관계도)는 회원의 입력 및 상호작용에 의해 생성되며, 그로 인한 분쟁은 당사자 간 해결을 원칙으로 합니다. 회사는 관련 법령상 책임이 인정되는 경우를 제외하고 개입 의무가 없습니다.",
    ),
    "serviceTermsArt8Title": MessageLookupByLibrary.simpleMessage(
      "제8조(상호인증 및 관계 데이터의 특칙)",
    ),
    "serviceTermsArt9Content": MessageLookupByLibrary.simpleMessage(
      "1. 콘텐츠에 대한 권리는 원칙적으로 이를 생성·등록한 회원에게 귀속됩니다.\n2. 회원은 서비스를 운영·제공·개선하기 위해 필요한 범위에서 회사가 해당 콘텐츠를 저장, 복제, 전송, 변환(예: 형식 변환/검색 색인), 표시할 수 있도록 비독점적 이용허락을 회사에 부여합니다.\n3. 회원은 업로드하는 문서·이미지·텍스트 등에 대해 적법한 권리를 보유하거나 이용허락을 받았음을 보증합니다.\n4. 회사가 AI 기능 개선 등을 위해 콘텐츠를 활용하려는 경우, 관련 법령이 요구하는 별도 고지/동의 절차를 거칩니다(필요 시).",
    ),
    "serviceTermsArt9Title": MessageLookupByLibrary.simpleMessage(
      "제9조(콘텐츠의 권리 및 이용허락)",
    ),
    "serviceTermsCompanyInfoContent": MessageLookupByLibrary.simpleMessage(
      "• 상호: 주식회사 촌\n• 대표자: 신근영\n• 사업자등록번호: 196-86-03544\n• 주소: 서울특별시 강남구 강남대로 464, 3층 309호\n• 고객센터: 010-3420-8691 / ops@chon.ai\n• 개인정보 보호책임자: 김남율/부장/010-9949-4887",
    ),
    "serviceTermsCompanyInfoTitle": MessageLookupByLibrary.simpleMessage(
      "회사 정보(표기/고지용)",
    ),
    "serviceTermsHeaderContent": MessageLookupByLibrary.simpleMessage(
      "시행일자: 2026.02.01\n버전: v1.0\n회사명: 주식회사 촌 (“회사”)\n서비스명: 촌(Chon) (“서비스”)",
    ),
    "serviceTermsHeaderTitle": MessageLookupByLibrary.simpleMessage(
      "촌(Chon) 서비스 이용약관",
    ),
    "serviceTermsTitle": MessageLookupByLibrary.simpleMessage("촌(Chon) 이용약관"),
    "setting": MessageLookupByLibrary.simpleMessage("설정"),
    "settings": MessageLookupByLibrary.simpleMessage("설정"),
    "shootingGuide": MessageLookupByLibrary.simpleMessage(
      "어두운 배경에서 촬영해주세요. 빛이 반사되지 않도록 방향을 조정해 주세요.",
    ),
    "siblings_brother_sister": MessageLookupByLibrary.simpleMessage("남매"),
    "siblings_child": MessageLookupByLibrary.simpleMessage("조카"),
    "siblings_grand_child": MessageLookupByLibrary.simpleMessage("좋손"),
    "signIn": MessageLookupByLibrary.simpleMessage("로그인하기"),
    "signUp": MessageLookupByLibrary.simpleMessage("회원 가입하기"),
    "sister": MessageLookupByLibrary.simpleMessage("남매"),
    "sister2": MessageLookupByLibrary.simpleMessage("자매"),
    "sister_in_law": MessageLookupByLibrary.simpleMessage("형수"),
    "son": MessageLookupByLibrary.simpleMessage("자녀"),
    "son2": MessageLookupByLibrary.simpleMessage("자"),
    "sonInLaw": MessageLookupByLibrary.simpleMessage("사위"),
    "spouse": MessageLookupByLibrary.simpleMessage("배우자"),
    "subTier": MessageLookupByLibrary.simpleMessage("하위 단계"),
    "subjectLabel": MessageLookupByLibrary.simpleMessage("제목"),
    "submit": MessageLookupByLibrary.simpleMessage("제출하기"),
    "success": MessageLookupByLibrary.simpleMessage("성공"),
    "surname": MessageLookupByLibrary.simpleMessage("성씨"),
    "systemDefault": MessageLookupByLibrary.simpleMessage("시스템 기본값"),
    "taekwondo": MessageLookupByLibrary.simpleMessage("태권도"),
    "taekwondoCertificate": MessageLookupByLibrary.simpleMessage("태권도증"),
    "taekwondoOfCertificate": MessageLookupByLibrary.simpleMessage("태권도단증"),
    "termsAddendumContent": MessageLookupByLibrary.simpleMessage(
      "1. 본 약관은 [2026.02.01]부터 시행합니다.\n2. 본 약관 시행 이전 가입 회원에 대하여도 본 약관이 적용됩니다(단, 관련 법령상 제한이 있는 경우 예외).",
    ),
    "termsAddendumTitle": MessageLookupByLibrary.simpleMessage("부칙"),
    "termsCheckboxMarketingOptional": MessageLookupByLibrary.simpleMessage(
      "(선택) 마케팅 정보 수신 동의 (이메일/문자/푸시)",
    ),
    "termsCheckboxPrivacyRequired": MessageLookupByLibrary.simpleMessage(
      "(필수) 개인정보 수집·이용 동의",
    ),
    "termsCheckboxThirdPartyRequired": MessageLookupByLibrary.simpleMessage(
      "(필수) 개인정보 제3자 제공 동의 (상호인증·가계도/관계도 기능)",
    ),
    "termsConfirm": MessageLookupByLibrary.simpleMessage("확인"),
    "termsItemsContent": MessageLookupByLibrary.simpleMessage(
      "회사는 서비스 제공에 필요한 범위에서 다음 개인정보를 수집·이용합니다.\n(가) 회원가입/계정관리 필수 항목\n• 이메일 또는 휴대폰번호(가입 방식에 따라)\n• 비밀번호(암호화하여 저장) 또는 이에 준하는 인증정보(소셜 로그인 토큰 등)\n• 표시명(이름/닉네임)\n• 서비스 내부 식별값(회원번호/UID 등)\n(나) 상호인증/가계도·관계도 기능 관련 항목\n• 회원이 직접 입력/선택한 관계 정보(예: 관계명/호칭/촌수/연결 상태 등)\n• 상호인증을 위한 식별 정보(예: 초대코드/링크 토큰/인증 이력 및 일시 등)\n• 프로필 정보 중 회원이 설정한 공개 범위 내 항목(예: 프로필 사진, 소개글 등)\n(다) 서비스 이용 과정에서 자동 생성·수집되는 항목\n• 접속 기록, 이용 기록, IP 주소\n• 기기/앱 정보(OS/버전 등), 오류 기록\n• 쿠키 또는 유사 기술 기반 식별정보(웹 이용 시 해당되는 경우)\n(라) 고객센터 이용 시 수집 항목\n• 연락처(이메일/전화번호 중 회원이 제공한 항목)\n• 문의 내용 및 첨부파일(회원이 제출한 경우)",
    ),
    "termsItemsTitle": MessageLookupByLibrary.simpleMessage(
      "2) 수집·이용하는 개인정보 항목",
    ),
    "termsMainTitle": MessageLookupByLibrary.simpleMessage("촌(Chon) 이용약관"),
    "termsMarketingConsentDetailContent": MessageLookupByLibrary.simpleMessage(
      "동의하지 않아도 서비스 이용은 가능합니다.\n• 목적: 이벤트/프로모션 안내, 신규 기능/혜택 고지, 설문 및 만족도 조사(해당 시)\n• 수집 항목: 이메일, 휴대폰번호, 앱 푸시 토큰(푸시 수신 설정 시)\n• 보유·이용 기간: 동의 철회 또는 회원 탈퇴 시까지\n• 동의 거부 시 불이익: 없음",
    ),
    "termsMarketingConsentDetailTitle": MessageLookupByLibrary.simpleMessage(
      "[선택] 개인정보 수집·이용 동의 (마케팅/혜택 안내))",
    ),
    "termsMarketingInfoContent": MessageLookupByLibrary.simpleMessage(
      "회사가 이벤트/프로모션 안내, 신규 기능/혜택 고지 등을 위해 별도의 선택 동의를 받는 경우, 동의하지 않으셔도 기본 서비스 이용은 가능합니다. (선택 동의 항목, 목적, 보유기간은 실제 운영 정책에 맞춰 별도로 고지합니다.)\n시행일: 2026.02.01\n개인정보처리자: 주식회사 촌\n• 대표자: 신근영\n• 사업자등록번호: 196-86-03544\n• 주소: 서울특별시 강남구 강남대로 464, 3층 309호\n• 고객센터: 010-3420-8691 / ops@chon.ai\n• 개인정보 보호책임자: 김남율 / 부장 / 010-9949-4887",
    ),
    "termsMarketingInfoTitle": MessageLookupByLibrary.simpleMessage(
      "5) 선택 동의(마케팅/혜택 안내) – 해당 시",
    ),
    "termsOfService": MessageLookupByLibrary.simpleMessage("이용약관"),
    "termsPrivacyConsentTitle": MessageLookupByLibrary.simpleMessage(
      "촌(Chon) 개인정보 수집·이용 동의",
    ),
    "termsProvisionItemsContent": MessageLookupByLibrary.simpleMessage(
      "아래 항목 중 회원이 서비스 내에서 공개/공유 범위로 설정한 정보에 한하여 제공됩니다.\n• 표시명(이름/닉네임)\n• 프로필 정보(예: 프로필 사진, 소개글 등) 중 공개 설정된 항목\n• 관계 정보(관계명/호칭/촌수/연결 상태), 상호인증 상태 및 일시\n• 가계도/관계도에서 표시되는 노드/관계 데이터(회원이 입력·공유한 범위)\n※ 연락처(휴대폰번호/이메일) 등 민감도가 높은 정보는 기본적으로 제3자에게 제공하지 않으며, 회원이 별도로 공개를 선택한 경우에만 해당 설정 범위에서 제공될 수 있습니다(서비스 정책에 따름).",
    ),
    "termsProvisionItemsTitle": MessageLookupByLibrary.simpleMessage(
      "3) 제공 항목",
    ),
    "termsProvisionPurposeContent": MessageLookupByLibrary.simpleMessage(
      "• 상호인증 수행 및 결과 확인\n• 관계(가족/친구/조직 등) 연결\n• 가계도/관계도 표시·열람 및 관계 이력 관리",
    ),
    "termsProvisionPurposeTitle": MessageLookupByLibrary.simpleMessage(
      "2) 제공 목적",
    ),
    "termsPurposeContent": MessageLookupByLibrary.simpleMessage(
      "주식회사 촌은 (이하 “회사”라고 합니다.) 는 다음 목적을 위해 개인정보를 수집·이용합니다. (목적이 변경되는 경우, 관련 법령에 따라 안내 및 필요한 경우 동의를 다시 받습니다.)\n• 회원가입 및 계정 생성/관리(회원 식별, 본인 확인(해당 시), 로그인, 중복가입·부정이용 방지)\n• 상호인증 및 관계(가족/친구/조직 등) 연결, 가계도/관계도 생성·표시·관리\n• 서비스 운영, 보안, 품질 개선(장애 대응, 로그 분석, 이용환경 개선)\n• 고객 문의 응대 및 민원 처리(문의 확인, 답변, 처리 결과 안내)",
    ),
    "termsPurposeTitle": MessageLookupByLibrary.simpleMessage("1) 수집·이용 목적"),
    "termsRecipientContent": MessageLookupByLibrary.simpleMessage(
      "• 촌(Chon) 서비스를 이용하는 회원 중 상호인증이 성립된 상대방 회원\n• 회원이 가계도/관계도 공유 대상으로 지정한 회원(초대/연결 등으로 접근 권한이 부여된 경우)",
    ),
    "termsRecipientRetentionContent": MessageLookupByLibrary.simpleMessage(
      "• 관계 연결 또는 공유가 유지되는 동안(또는 회원이 공개 설정을 유지하는 동안) 제공받는 자가 서비스 내에서 열람·이용할 수 있습니다.\n• 회원이 관계 삭제/공개 해제/탈퇴하는 경우, 서비스 내 제공·노출은 중지되거나 삭제 처리됩니다. 다만 제공받는 자가 이미 저장·캡처한 정보까지 회사가 통제할 수는 없습니다(이 점에 유의해 주세요).",
    ),
    "termsRecipientRetentionTitle": MessageLookupByLibrary.simpleMessage(
      "4) 제공받는 자의 보유·이용 기간",
    ),
    "termsRecipientTitle": MessageLookupByLibrary.simpleMessage("1) 제공받는 자"),
    "termsRefusalContent": MessageLookupByLibrary.simpleMessage(
      "개인정보 수집·이용에 대한 동의를 거부할 권리가 있습니다. 다만, 서비스 제공에 필수적인 항목(회원가입/상호인증/관계도 기능 등)에 대한 동의를 거부하실 경우 서비스 이용이 제한될 수 있습니다.",
    ),
    "termsRefusalTitle": MessageLookupByLibrary.simpleMessage(
      "4) 동의 거부권 및 불이익",
    ),
    "termsRetentionContent": MessageLookupByLibrary.simpleMessage(
      "회사는 원칙적으로 회원 탈퇴 시까지 개인정보를 보유·이용합니다. 다만, 아래의 경우에는 해당 사유가 해소될 때까지 또는 관계 법령에 따라 필요한 범위에서 일정 기간 보관할 수 있습니다.\n• 법령상 보관 의무가 있는 경우\n• 부정이용 방지, 분쟁 해결, 민원 처리 등 정당한 목적을 위해 보관이 필요한 경우",
    ),
    "termsRetentionTitle": MessageLookupByLibrary.simpleMessage("3) 보유·이용 기간"),
    "termsScrollDown": MessageLookupByLibrary.simpleMessage("아래로 스크롤하기"),
    "termsThirdPartyContent": MessageLookupByLibrary.simpleMessage(
      "주식회사 촌 (이하 “회사”라고 합니다)은 아래와 같이 개인정보를 제3자(다른 회원 포함)에게 제공합니다. 제3자 제공 동의 시에는 제공받는 자, 목적, 항목, 보유·이용기간, 거부권 및 불이익을 고지합니다.",
    ),
    "termsThirdPartyRefusalContent": MessageLookupByLibrary.simpleMessage(
      "개인정보 제3자 제공에 대한 동의를 거부할 권리가 있습니다. 다만, 본 동의는 상호인증 및 가계도/관계도 공유 기능 제공에 필요하므로 동의를 거부하실 경우 해당 기능 이용이 제한될 수 있습니다.\n참고(위탁처리 안내)\n문자 발송, 인프라/클라우드 운영 등 서비스 제공을 위해 개인정보 처리업무를 외부에 위탁하는 경우가 있을 수 있으며, 이 경우 위탁 업무 범위 내에서만 처리되도록 관리·감독합니다.",
    ),
    "termsThirdPartyRefusalTitle": MessageLookupByLibrary.simpleMessage(
      "5) 동의 거부권 및 불이익",
    ),
    "termsThirdPartyTitle": MessageLookupByLibrary.simpleMessage(
      "촌(Chon) 개인정보 제3자 제공 동의",
    ),
    "tier": MessageLookupByLibrary.simpleMessage("단계"),
    "unVerifiedList": MessageLookupByLibrary.simpleMessage("피확인자요청 리스트"),
    "uncle_aunt_husband": MessageLookupByLibrary.simpleMessage("고모부"),
    "uncle_father_older": MessageLookupByLibrary.simpleMessage("큰아버지"),
    "unverified": MessageLookupByLibrary.simpleMessage("확인되지 않음"),
    "update": MessageLookupByLibrary.simpleMessage("업데이트"),
    "updateFailed": MessageLookupByLibrary.simpleMessage("업데이트할 수 없습니다"),
    "uploadSizeLimitWarning": MessageLookupByLibrary.simpleMessage(
      "300MB이하 파일만 업로드 가능합니다.",
    ),
    "username": MessageLookupByLibrary.simpleMessage("아이디"),
    "verificationPoint": MessageLookupByLibrary.simpleMessage("인증 포인트"),
    "verificationRequest": MessageLookupByLibrary.simpleMessage("확인자등록"),
    "verificationRequestedBy": MessageLookupByLibrary.simpleMessage(
      "님이\n확인 요청을 했습니다",
    ),
    "verificationScore": MessageLookupByLibrary.simpleMessage("인증 점수"),
    "verifiedList": MessageLookupByLibrary.simpleMessage("확인자등록"),
    "verifierForMe": MessageLookupByLibrary.simpleMessage("나를 인증해줄 사람"),
    "verifyFinish": MessageLookupByLibrary.simpleMessage("상호인증이\n완료 되었습니다"),
    "verifyRequest": MessageLookupByLibrary.simpleMessage("인증요청"),
    "verifycationRequest": MessageLookupByLibrary.simpleMessage("인증 요청"),
    "viewFamilyTree": MessageLookupByLibrary.simpleMessage("가계도 보기"),
    "visaType": MessageLookupByLibrary.simpleMessage("체류자격"),
    "wife": MessageLookupByLibrary.simpleMessage("아내"),
  };
}
