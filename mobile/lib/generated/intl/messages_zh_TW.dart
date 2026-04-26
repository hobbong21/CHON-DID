// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_TW locale. All the
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
  String get localeName => 'zh_TW';

  static String m0(relation) => "是${relation}。\n請確認。";

  static String m1(account, name) => "${account} ${name}";

  static String m2(date) => "於 ${date} 簽發";

  static String m3(name) => "${name}, ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "AN_ERROR_HAS_OCCURRED": MessageLookupByLibrary.simpleMessage("發生錯誤"),
    "BANK_ACCOUNT_NOT_EXIST": MessageLookupByLibrary.simpleMessage(
      "找不到此 ID 的銀行帳戶",
    ),
    "CARD_INFO_EXISTED": MessageLookupByLibrary.simpleMessage("卡片資訊已存在"),
    "CARD_INFO_NOT_EXIST": MessageLookupByLibrary.simpleMessage("找不到該使用者的卡片"),
    "CLAN_EXISTED": MessageLookupByLibrary.simpleMessage("部落已存在"),
    "CLAN_NOT_EXISTED": MessageLookupByLibrary.simpleMessage("部落不存在"),
    "CONFIRM_DID_FAIL": MessageLookupByLibrary.simpleMessage("DID確認失敗。"),
    "DATA_NOT_MATCH": MessageLookupByLibrary.simpleMessage("資料不一致"),
    "DID_GENERATE_FAIL": MessageLookupByLibrary.simpleMessage("無法從公鑰產生DID。"),
    "ENROLL_DID_FAIL": MessageLookupByLibrary.simpleMessage("DID註冊失敗。"),
    "EVENT_CERTIFICATE_INVALID": MessageLookupByLibrary.simpleMessage("憑證無效"),
    "EVENT_CERTIFICATE_IS_NOT_CONFIRMED": MessageLookupByLibrary.simpleMessage(
      "憑證尚未確認",
    ),
    "EVENT_MUST_BE_CHECK_IN_BEFORE": MessageLookupByLibrary.simpleMessage(
      "事件必須先簽到",
    ),
    "EVENT_NOT_EXISTED": MessageLookupByLibrary.simpleMessage("事件不存在"),
    "FAMILY_TREE_HAS_BEEN_INITIATED": MessageLookupByLibrary.simpleMessage(
      "家譜已初始化。",
    ),
    "GENDER_INVALID": MessageLookupByLibrary.simpleMessage("性別必須為「男性」或「女性」"),
    "GENDER_NOT_NULL": MessageLookupByLibrary.simpleMessage("性別不能為空"),
    "ID_NUMBER_EXIST": MessageLookupByLibrary.simpleMessage("身分證號已存在"),
    "ID_NUMBER_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "身分證號只能包含數字",
    ),
    "ID_NUMBER_NOT_EXISTED": MessageLookupByLibrary.simpleMessage("身分證號不存在"),
    "ID_NUMBER_NOT_NULL": MessageLookupByLibrary.simpleMessage("身分證號不能為空"),
    "IMG_BASE64_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "圖片必須為有效的 base64 格式",
    ),
    "IMG_BASE64_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "imgBase64 不能為空",
    ),
    "INPUT_EMPTY": MessageLookupByLibrary.simpleMessage("輸入為空"),
    "INPUT_INVALID": MessageLookupByLibrary.simpleMessage("輸入無效"),
    "INTEGRATION_DID_FAIL": MessageLookupByLibrary.simpleMessage("DID整合失敗。"),
    "INVALID_TOKEN": MessageLookupByLibrary.simpleMessage("無效的權杖"),
    "ISSUED_DATE_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "發行日期必須為 yyyy-MM-dd 格式",
    ),
    "ISSUED_DATE_NOT_NULL": MessageLookupByLibrary.simpleMessage("發行日期不能為空"),
    "LOGIN_ERROR_01": MessageLookupByLibrary.simpleMessage("電子郵件已存在"),
    "MESSAGE_TOO_LONG": MessageLookupByLibrary.simpleMessage("訊息不能超過 2000 個字元"),
    "NATIONALITY_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "國籍只能包含字母與空格",
    ),
    "NATIONALITY_NOT_NULL": MessageLookupByLibrary.simpleMessage("國籍不能為空"),
    "NOT_FOUND": MessageLookupByLibrary.simpleMessage("找不到"),
    "OTP_EXPIRED": MessageLookupByLibrary.simpleMessage("OTP 已過期"),
    "PASSWORD_NOT_MATCH": MessageLookupByLibrary.simpleMessage("密碼不一致"),
    "PASSWORD_OR_ACCOUNT_IN_ACTIVE": MessageLookupByLibrary.simpleMessage(
      "密碼或帳號錯誤",
    ),
    "PHONE_NUMBER_EXISTED": MessageLookupByLibrary.simpleMessage("電話號碼已存在"),
    "PHONE_NUMBER_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "聯絡電話必須以國家代碼開頭，後接空格與 8~12 位數字",
    ),
    "PHONE_NUMBER_NOT_EXIST": MessageLookupByLibrary.simpleMessage("電話號碼不存在"),
    "PHONE_NUMBER_NOT_NULL": MessageLookupByLibrary.simpleMessage("聯絡電話不能為空"),
    "REF_VISA_TYPE_NOT_NULL": MessageLookupByLibrary.simpleMessage("簽證類型不能為空"),
    "REQUEST_TIMEOUT": MessageLookupByLibrary.simpleMessage("請求逾時"),
    "SHARE_LINK_ERROR": MessageLookupByLibrary.simpleMessage("產生分享連結時發生錯誤"),
    "SUBMIT_DID_FAIL": MessageLookupByLibrary.simpleMessage("DID提交失敗。"),
    "SYSTEM_ERROR": MessageLookupByLibrary.simpleMessage("系統錯誤"),
    "TAEKWONDO_EXISTED": MessageLookupByLibrary.simpleMessage("跆拳道已存在"),
    "TAEKWONDO_NOT_EXISTED": MessageLookupByLibrary.simpleMessage("跆拳道不存在"),
    "THE_CONNECTION_ERRORED": MessageLookupByLibrary.simpleMessage("伺服器維護中"),
    "UNAUTHORIZED": MessageLookupByLibrary.simpleMessage("工作階段已過期"),
    "UNKNOWN": MessageLookupByLibrary.simpleMessage("未知錯誤"),
    "VALIDATE_BANK_ACCOUNT_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "銀行帳戶不能為空",
    ),
    "VALIDATE_BANK_ID_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "銀行 ID 不能為空",
    ),
    "VALIDATE_BANK_REF_BANK_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "參考銀行不能為空",
    ),
    "VALIDATE_CARD_CARD_ID_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "卡片 ID 不能為空",
    ),
    "VALIDATE_CLAN_BIRTH_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "出生地不能為空",
    ),
    "VALIDATE_CLAN_CLAN_NAME_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "部落名稱不能為空",
    ),
    "VALIDATE_CLAN_IMAGE_BASE64_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "圖片必須為有效的 base64 格式（data:image/<type>;base64,...），且大小不超過 10MB",
        ),
    "VALIDATE_CLAN_IMAGE_BASE64_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "圖片 base64 不能為空",
    ),
    "VALIDATE_CLAN_ORIGIN_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "來源不能為空",
    ),
    "VALIDATE_CLAN_PA_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Pa 不能為空",
    ),
    "VALIDATE_CLAN_PERSONAL_NAME_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("個人姓名不能為空"),
    "VALIDATE_CLAN_PHONE_NUMBER_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "聯絡電話必須以國家代碼（如 +84、+1）開頭，後接空格與 8~12 位數字（例如 +84 123456789）",
        ),
    "VALIDATE_CLAN_PHONE_NUMBER_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "電話號碼不能為空",
    ),
    "VALIDATE_CLAN_SE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Se 不能為空",
    ),
    "VALIDATE_EVENT_ACTION_TYPE_INVALID": MessageLookupByLibrary.simpleMessage(
      "事件操作類型不能為空，且值必須為 1（簽到）或 2（簽退）",
    ),
    "VALIDATE_EVENT_ID_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "事件 ID 不能為空",
    ),
    "VALIDATE_PUBLIC_KEY_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "公開金鑰不能為空",
    ),
    "VALIDATE_RAW_DATA_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "原始資料不能為空",
    ),
    "VALIDATE_SIGNATURE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "簽名不能為空",
    ),
    "VALIDATE_TEAKWONDO_ID_NUMBER_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("身分證號不能為空"),
    "VALIDATE_TEAKWONDO_IMAGE_BASE64_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "圖片必須為有效的 base64 格式（data:image/<type>;base64,...），且大小不超過 10MB",
        ),
    "VALIDATE_TEAKWONDO_IMAGE_BASE64_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("圖片 base64 不能為空"),
    "VALIDATE_TEAKWONDO_ISSUE_DATE_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage("發行日期必須為 yyyy-MM-dd 格式"),
    "VALIDATE_TEAKWONDO_ISSUE_DATE_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("發行日期不能為空"),
    "VALIDATE_TEAKWONDO_LEVEL_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "等級不能為空",
    ),
    "VALIDATE_TEAKWONDO_LEVEL_NUMBER_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("等級編號不能為空"),
    "VALIDATE_TEAKWONDO_NAME_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "姓名不能為空",
    ),
    "VALIDATE_TEAKWONDO_NATIONALY_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("國籍不能為空"),
    "VERIFIED": MessageLookupByLibrary.simpleMessage("聯絡人已驗證"),
    "VERIFY_CONTACT_NOT_EXIST": MessageLookupByLibrary.simpleMessage("聯絡人不存在"),
    "VERIFY_ERROR": MessageLookupByLibrary.simpleMessage("OTP 驗證錯誤"),
    "account": MessageLookupByLibrary.simpleMessage("ID (電子信箱)"),
    "accountInfoError": MessageLookupByLibrary.simpleMessage("帳戶資訊錯誤，請檢查輸入內容。"),
    "accountList": MessageLookupByLibrary.simpleMessage("帳戶列表"),
    "accountRegisted": MessageLookupByLibrary.simpleMessage("您的帳戶已註冊！"),
    "accountRegistration": MessageLookupByLibrary.simpleMessage("註冊帳戶"),
    "accountRegistrationTerms": MessageLookupByLibrary.simpleMessage(
      "目的說明：註冊用於繳納會費與結算的專用帳戶\n\n本服務包含註冊和驗證銀行帳戶資訊的流程，以便執行合法的會費繳納及結算程序。\n您輸入的資訊是身分驗證和結算處理的必填項目，將用於以下目的：\n\n1. 身分確認與實名認證\n為確保用戶註冊的是本人名義的帳戶，將通過金融機構進行實名認證程序。此舉旨在防止盜用他人帳戶或誤轉帳等事故。\n\n2. 會費繳納與結算處理\n帳戶資訊將用於準確、安全地處理服務使用過程中產生的會費、結算金、獎金等資金交易。結算過程中產生的存取款明細將透明地通知用戶。\n\n3. 金融資訊的最小化收集與保管\n本服務僅收集和使用結算目的所需的最小限度的金融資訊，並僅在法律規定的期限內保管。超過保管期限的資訊將通過安全程序立即銷毀。\n\n4. 遵守法律與爭議應對\n根據金融交易相關法律，交易記錄及帳戶資訊可能會因稅務、審計、爭議解決等目的提交給相關機構。即使在此情況下，若無法律依據，不會隨意提供給第三方。\n\n所有收集的資訊均根據《個人資料保護法》及相關規定進行加密並安全管理。\n此外，用戶可隨時撤回資訊提供同意，但撤回後可能會限制後續結算服務的使用。",
    ),
    "accountVerificationCompleted": MessageLookupByLibrary.simpleMessage(
      "帳戶驗證\n已完成",
    ),
    "achievements": MessageLookupByLibrary.simpleMessage("成就"),
    "action_delete": MessageLookupByLibrary.simpleMessage("刪除"),
    "action_ok": MessageLookupByLibrary.simpleMessage("確定"),
    "action_select": MessageLookupByLibrary.simpleMessage("選擇"),
    "add": MessageLookupByLibrary.simpleMessage("新增"),
    "addNewAccount": MessageLookupByLibrary.simpleMessage("新增帳戶"),
    "address": MessageLookupByLibrary.simpleMessage("地址"),
    "agreeAccountRealName": MessageLookupByLibrary.simpleMessage(
      "(必選) 同意帳戶實名查詢",
    ),
    "agreeAll": MessageLookupByLibrary.simpleMessage("同意所有條款"),
    "agreeAndContinue": MessageLookupByLibrary.simpleMessage("同意並繼續"),
    "agreeFinancialInfoCollection": MessageLookupByLibrary.simpleMessage(
      "(必選) 同意最小化收集與保管金融資訊",
    ),
    "agreeNotification": MessageLookupByLibrary.simpleMessage(
      "(可選) 接收收據/結算通知 (推播/郵件)",
    ),
    "album": MessageLookupByLibrary.simpleMessage("相簿"),
    "appLanguage": MessageLookupByLibrary.simpleMessage("應用語言"),
    "approval": MessageLookupByLibrary.simpleMessage("批准"),
    "approvalSuccess": MessageLookupByLibrary.simpleMessage("已批准"),
    "askForAnything": MessageLookupByLibrary.simpleMessage("隨時提問"),
    "attachmentLabel": MessageLookupByLibrary.simpleMessage("附件"),
    "aunt_father_sister": MessageLookupByLibrary.simpleMessage("姑母"),
    "aunt_uncle_wife": MessageLookupByLibrary.simpleMessage("伯母"),
    "authRejected": MessageLookupByLibrary.simpleMessage("已拒絕相互認證"),
    "authentication": MessageLookupByLibrary.simpleMessage("認證"),
    "authenticationRequest": MessageLookupByLibrary.simpleMessage(
      "收到的相互認證\n請求列表",
    ),
    "back": MessageLookupByLibrary.simpleMessage("返回"),
    "bankAccount": MessageLookupByLibrary.simpleMessage("銀行帳戶"),
    "bankAccountNumber": MessageLookupByLibrary.simpleMessage("銀行帳號"),
    "bankInfo": MessageLookupByLibrary.simpleMessage("銀行資訊"),
    "birth": MessageLookupByLibrary.simpleMessage("出生日期"),
    "birthYearSuffix": MessageLookupByLibrary.simpleMessage("年生"),
    "blockHash": MessageLookupByLibrary.simpleMessage("區塊哈希"),
    "brother": MessageLookupByLibrary.simpleMessage("兄弟"),
    "brother2": MessageLookupByLibrary.simpleMessage("兄弟"),
    "brother_in_law": MessageLookupByLibrary.simpleMessage("姊夫"),
    "cameraNotInitialized": MessageLookupByLibrary.simpleMessage("相機未初始化"),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage("需要相機權限"),
    "cancel": MessageLookupByLibrary.simpleMessage("取消"),
    "captureIdCard": MessageLookupByLibrary.simpleMessage("拍攝證件"),
    "certification": MessageLookupByLibrary.simpleMessage("證明"),
    "certifierList": MessageLookupByLibrary.simpleMessage("認證人列表"),
    "change": MessageLookupByLibrary.simpleMessage("變更"),
    "changePhoneSuccess": MessageLookupByLibrary.simpleMessage("更換手機號碼成功"),
    "char": MessageLookupByLibrary.simpleMessage("字元"),
    "chat": MessageLookupByLibrary.simpleMessage("聊天"),
    "checkAccount": MessageLookupByLibrary.simpleMessage("檢查帳戶"),
    "checkIn": MessageLookupByLibrary.simpleMessage("簽到"),
    "checkInConfirmed": MessageLookupByLibrary.simpleMessage("簽到\n已確認"),
    "checkOriginal": MessageLookupByLibrary.simpleMessage("查看原件"),
    "checkOut": MessageLookupByLibrary.simpleMessage("簽退"),
    "checkOutConfirmed": MessageLookupByLibrary.simpleMessage("簽退\n已確認"),
    "children": MessageLookupByLibrary.simpleMessage("子女"),
    "chon_action_approve": MessageLookupByLibrary.simpleMessage("核准"),
    "chon_action_attach": MessageLookupByLibrary.simpleMessage("附件"),
    "chon_action_attached": MessageLookupByLibrary.simpleMessage("已附加"),
    "chon_action_back": MessageLookupByLibrary.simpleMessage("返回"),
    "chon_action_close": MessageLookupByLibrary.simpleMessage("關閉"),
    "chon_action_confirm": MessageLookupByLibrary.simpleMessage("確認"),
    "chon_action_continue": MessageLookupByLibrary.simpleMessage("繼續"),
    "chon_action_finish": MessageLookupByLibrary.simpleMessage("完成"),
    "chon_action_next": MessageLookupByLibrary.simpleMessage("下一步"),
    "chon_action_recapture": MessageLookupByLibrary.simpleMessage("重拍"),
    "chon_action_reject": MessageLookupByLibrary.simpleMessage("拒絕"),
    "chon_action_retry": MessageLookupByLibrary.simpleMessage("重試"),
    "chon_action_save": MessageLookupByLibrary.simpleMessage("儲存"),
    "chon_action_search_again": MessageLookupByLibrary.simpleMessage("重新搜尋"),
    "chon_action_send": MessageLookupByLibrary.simpleMessage("傳送"),
    "chon_action_skip": MessageLookupByLibrary.simpleMessage("略過"),
    "chon_action_start": MessageLookupByLibrary.simpleMessage("開始"),
    "chon_chat_empty_body": MessageLookupByLibrary.simpleMessage(
      "向 AI 諮詢家族關係、\n身分驗證、家譜。",
    ),
    "chon_chat_empty_title": MessageLookupByLibrary.simpleMessage(
      "向 CHON AI 提問任何問題",
    ),
    "chon_chat_input_hint": MessageLookupByLibrary.simpleMessage("輸入訊息"),
    "chon_chat_title": MessageLookupByLibrary.simpleMessage("CHON AI"),
    "chon_contact_completed": MessageLookupByLibrary.simpleMessage("通話已結束。"),
    "chon_contact_connecting": MessageLookupByLibrary.simpleMessage("連線中…"),
    "chon_contact_failed": MessageLookupByLibrary.simpleMessage("無法連線。"),
    "chon_contact_idle_prompt": MessageLookupByLibrary.simpleMessage("請選擇聯絡人。"),
    "chon_contact_title": MessageLookupByLibrary.simpleMessage("聯絡"),
    "chon_ft_empty": MessageLookupByLibrary.simpleMessage("尚無家庭資訊。"),
    "chon_ft_title": MessageLookupByLibrary.simpleMessage("家譜"),
    "chon_home_banner": MessageLookupByLibrary.simpleMessage(
      "透過互相認證建立你的 CHON ID。",
    ),
    "chon_home_input_label": MessageLookupByLibrary.simpleMessage("輸入資訊"),
    "chon_home_mutual_subtitle": MessageLookupByLibrary.simpleMessage(
      "與家人、親屬\n互相確認",
    ),
    "chon_home_mutual_title": MessageLookupByLibrary.simpleMessage("互相認證"),
    "chon_home_q_contact": MessageLookupByLibrary.simpleMessage("聯絡\n(家譜)"),
    "chon_home_q_edit_profile": MessageLookupByLibrary.simpleMessage("編輯資料"),
    "chon_home_q_qr": MessageLookupByLibrary.simpleMessage("QR 碼"),
    "chon_home_q_support": MessageLookupByLibrary.simpleMessage("客服"),
    "chon_home_tutorial_card": MessageLookupByLibrary.simpleMessage(
      "CHON DID\n教學",
    ),
    "chon_id_gen_capture_back": MessageLookupByLibrary.simpleMessage(
      "將身分證背面對準指引框",
    ),
    "chon_id_gen_capture_front": MessageLookupByLibrary.simpleMessage(
      "將身分證正面對準指引框",
    ),
    "chon_id_gen_capture_tip": MessageLookupByLibrary.simpleMessage(
      "請在深色背景下拍攝。\n調整方向避免反光。",
    ),
    "chon_id_gen_field_phone": MessageLookupByLibrary.simpleMessage("電話號碼"),
    "chon_id_gen_ocr_form_title": MessageLookupByLibrary.simpleMessage(
      "請輸入用於產生 ID 的\n個人資訊",
    ),
    "chon_id_gen_ocr_form_subtitle_prefix":
        MessageLookupByLibrary.simpleMessage("如有錯誤,請"),
    "chon_id_gen_ocr_form_subtitle_edit":
        MessageLookupByLibrary.simpleMessage("修改"),
    "chon_id_gen_ocr_form_subtitle_suffix":
        MessageLookupByLibrary.simpleMessage(""),
    "chon_id_gen_review_form_title": MessageLookupByLibrary.simpleMessage(
      "請輸入用於產生 ID 的\n附加資訊",
    ),
    "chon_id_gen_done": MessageLookupByLibrary.simpleMessage("CHON ID 已簽發"),
    "chon_id_gen_err_required": MessageLookupByLibrary.simpleMessage("缺少必填資訊。"),
    "chon_id_gen_field_address": MessageLookupByLibrary.simpleMessage("地址"),
    "chon_id_gen_field_authority": MessageLookupByLibrary.simpleMessage("簽發機關"),
    "chon_id_gen_field_id": MessageLookupByLibrary.simpleMessage(
      "身分證號 / 外國人登記號",
    ),
    "chon_id_gen_field_id_label": MessageLookupByLibrary.simpleMessage("ID 編號"),
    "chon_id_gen_field_issued": MessageLookupByLibrary.simpleMessage("簽發日期"),
    "chon_id_gen_field_name": MessageLookupByLibrary.simpleMessage("姓名"),
    "chon_id_gen_field_name_hint": MessageLookupByLibrary.simpleMessage(
      "身分證上的姓名",
    ),
    "chon_id_gen_intro_body": MessageLookupByLibrary.simpleMessage(
      "輸入身分證資訊並拍照,\n建立你的 CHON ID。",
    ),
    "chon_id_gen_intro_title": MessageLookupByLibrary.simpleMessage(
      "開始簽發\n你的 CHON ID",
    ),
    "chon_id_gen_ocr_err": MessageLookupByLibrary.simpleMessage("無法辨識身分證,請重拍。"),
    "chon_id_gen_ocr_no_result": MessageLookupByLibrary.simpleMessage(
      "無自動辨識結果。",
    ),
    "chon_id_gen_ocr_title": MessageLookupByLibrary.simpleMessage("確認辨識結果"),
    "chon_id_gen_pick_type": MessageLookupByLibrary.simpleMessage("請選擇 ID 類型"),
    "chon_id_gen_prep_start": MessageLookupByLibrary.simpleMessage("開始拍攝"),
    "chon_id_gen_prep_tip1": MessageLookupByLibrary.simpleMessage("請在深色背景下拍攝。"),
    "chon_id_gen_prep_tip2": MessageLookupByLibrary.simpleMessage("請調整角度避免反光。"),
    "chon_id_gen_prep_tip3": MessageLookupByLibrary.simpleMessage(
      "將身分證放入指引框內。",
    ),
    "chon_id_gen_prep_title": MessageLookupByLibrary.simpleMessage("拍攝前請確認"),
    "chon_id_gen_reenter": MessageLookupByLibrary.simpleMessage("重新輸入"),
    "chon_id_gen_review_finish": MessageLookupByLibrary.simpleMessage("簽發"),
    "chon_id_gen_review_title": MessageLookupByLibrary.simpleMessage("確認後完成簽發"),
    "chon_id_gen_title": MessageLookupByLibrary.simpleMessage("簽發身分證"),
    "chon_id_gen_type_family": MessageLookupByLibrary.simpleMessage("家庭關係證明"),
    "chon_id_gen_type_resident": MessageLookupByLibrary.simpleMessage(
      "身分證 / 外國人登記證",
    ),
    "chon_id_gen_type_taekwondo": MessageLookupByLibrary.simpleMessage(
      "跆拳道段位證",
    ),
    "chon_id_gen_verified_fail": MessageLookupByLibrary.simpleMessage("無法驗證"),
    "chon_id_gen_verified_ok": MessageLookupByLibrary.simpleMessage("已驗證"),
    "chon_mauth_off_intro": MessageLookupByLibrary.simpleMessage(
      "在線下面對面\n互相驗證 CHON ID。",
    ),
    "chon_mauth_off_my_qr": MessageLookupByLibrary.simpleMessage("我的 QR"),
    "chon_mauth_off_no_payload": MessageLookupByLibrary.simpleMessage(
      "此卡沒有 QR 資訊。",
    ),
    "chon_mauth_off_scan": MessageLookupByLibrary.simpleMessage("掃描對方 QR"),
    "chon_mauth_off_scan_prompt": MessageLookupByLibrary.simpleMessage(
      "將 QR 對準方框內。",
    ),
    "chon_mauth_off_scan_sub": MessageLookupByLibrary.simpleMessage(
      "用相機辨識對方 QR。",
    ),
    "chon_mauth_off_scan_title": MessageLookupByLibrary.simpleMessage("掃描 QR"),
    "chon_mauth_off_show": MessageLookupByLibrary.simpleMessage("出示我的 QR"),
    "chon_mauth_off_show_prompt": MessageLookupByLibrary.simpleMessage(
      "請向對方出示此 QR。",
    ),
    "chon_mauth_off_show_sub": MessageLookupByLibrary.simpleMessage(
      "對方掃描我的 QR。",
    ),
    "chon_mauth_off_title": MessageLookupByLibrary.simpleMessage("線下互相認證"),
    "chon_mauth_off_verified": MessageLookupByLibrary.simpleMessage("已驗證"),
    "chon_mauth_off_verifying": MessageLookupByLibrary.simpleMessage("驗證中…"),
    "chon_mauth_rcv_anonymous": MessageLookupByLibrary.simpleMessage("匿名"),
    "chon_mauth_rcv_approved": MessageLookupByLibrary.simpleMessage("核准完成"),
    "chon_mauth_rcv_approving": MessageLookupByLibrary.simpleMessage("處理中…"),
    "chon_mauth_rcv_detail": MessageLookupByLibrary.simpleMessage("請求詳情"),
    "chon_mauth_rcv_empty": MessageLookupByLibrary.simpleMessage("尚無請求。"),
    "chon_mauth_rcv_rejected": MessageLookupByLibrary.simpleMessage("拒絕完成"),
    "chon_mauth_rcv_rejecting": MessageLookupByLibrary.simpleMessage("處理中…"),
    "chon_mauth_rcv_title": MessageLookupByLibrary.simpleMessage("收到的請求"),
    "chon_mauth_req_approved": MessageLookupByLibrary.simpleMessage("已核准。"),
    "chon_mauth_req_awaiting": MessageLookupByLibrary.simpleMessage(
      "已傳送。\n請等待對方回應。",
    ),
    "chon_mauth_req_confirm_q": MessageLookupByLibrary.simpleMessage("是這個人嗎?"),
    "chon_mauth_req_done": MessageLookupByLibrary.simpleMessage("認證完成。"),
    "chon_mauth_req_err_notfound": MessageLookupByLibrary.simpleMessage(
      "找不到該使用者。",
    ),
    "chon_mauth_req_err_phone": MessageLookupByLibrary.simpleMessage(
      "請輸入電話號碼。",
    ),
    "chon_mauth_req_phone_prompt": MessageLookupByLibrary.simpleMessage(
      "請輸入要認證的\n家人電話號碼。",
    ),
    "chon_mauth_req_rejected": MessageLookupByLibrary.simpleMessage("已拒絕。"),
    "chon_mauth_req_retry_msg": MessageLookupByLibrary.simpleMessage("請稍後再試。"),
    "chon_mauth_req_send": MessageLookupByLibrary.simpleMessage("傳送請求"),
    "chon_mauth_req_sending": MessageLookupByLibrary.simpleMessage("正在傳送…"),
    "chon_mauth_req_title": MessageLookupByLibrary.simpleMessage("互相認證"),
    "chon_nav_chon": MessageLookupByLibrary.simpleMessage("CHON"),
    "chon_nav_family_tree": MessageLookupByLibrary.simpleMessage("家譜"),
    "chon_nav_home": MessageLookupByLibrary.simpleMessage("首頁"),
    "chon_nav_id_card": MessageLookupByLibrary.simpleMessage("身分證"),
    "chon_nav_mutual": MessageLookupByLibrary.simpleMessage("互認"),
    "chon_profile_edit_given": MessageLookupByLibrary.simpleMessage("名"),
    "chon_profile_edit_required": MessageLookupByLibrary.simpleMessage("必填欄位。"),
    "chon_profile_edit_surname": MessageLookupByLibrary.simpleMessage("姓"),
    "chon_profile_edit_title": MessageLookupByLibrary.simpleMessage("編輯資料"),
    "chon_report_empty": MessageLookupByLibrary.simpleMessage("尚無報告。"),
    "chon_report_err_required": MessageLookupByLibrary.simpleMessage(
      "請輸入標題和內容。",
    ),
    "chon_report_failed": MessageLookupByLibrary.simpleMessage("傳送失敗。"),
    "chon_report_field_content": MessageLookupByLibrary.simpleMessage("內容"),
    "chon_report_field_content_hint": MessageLookupByLibrary.simpleMessage(
      "請詳細描述問題。",
    ),
    "chon_report_field_title": MessageLookupByLibrary.simpleMessage("標題"),
    "chon_report_field_title_hint": MessageLookupByLibrary.simpleMessage(
      "請輸入報告標題。",
    ),
    "chon_report_new": MessageLookupByLibrary.simpleMessage("新報告"),
    "chon_report_sending": MessageLookupByLibrary.simpleMessage("正在提交…"),
    "chon_report_submitted": MessageLookupByLibrary.simpleMessage("已收到您的報告。"),
    "chon_report_submitted_sub": MessageLookupByLibrary.simpleMessage(
      "確認後我們會盡快回覆。",
    ),
    "chon_report_title": MessageLookupByLibrary.simpleMessage("問題回報"),
    "chon_tutorial_s1_body": MessageLookupByLibrary.simpleMessage(
      "請家人為你的身分背書,\n在需要的地方完成驗證。",
    ),
    "chon_tutorial_s1_title": MessageLookupByLibrary.simpleMessage(
      "用 CHON DID\n驗證自己",
    ),
    "chon_tutorial_s2_body": MessageLookupByLibrary.simpleMessage(
      "與家人互相認證\n以證明你們的關係。",
    ),
    "chon_tutorial_s2_title": MessageLookupByLibrary.simpleMessage("互相認證"),
    "chon_tutorial_s3_body": MessageLookupByLibrary.simpleMessage(
      "視覺化家族關係\n安全保管家譜。",
    ),
    "chon_tutorial_s3_title": MessageLookupByLibrary.simpleMessage(
      "與家人一起\n繪製家譜",
    ),
    "chon_tutorial_s4_body": MessageLookupByLibrary.simpleMessage(
      "已完成設定。\n立即開始使用。",
    ),
    "chon_tutorial_s4_title": MessageLookupByLibrary.simpleMessage(
      "準備好\n開始使用 CHON 了嗎?",
    ),
    "clan": MessageLookupByLibrary.simpleMessage("姓氏"),
    "clanOfCertificate": MessageLookupByLibrary.simpleMessage("宗族證書"),
    "close": MessageLookupByLibrary.simpleMessage("關閉"),
    "coating": MessageLookupByLibrary.simpleMessage("宗族"),
    "confirm": MessageLookupByLibrary.simpleMessage("確認"),
    "confirmCheckInOut": MessageLookupByLibrary.simpleMessage(
      "您要進行\n簽到 / 簽退嗎？",
    ),
    "confirmDelete": MessageLookupByLibrary.simpleMessage("確定要刪除嗎？"),
    "confirmRelationSuffix": m0,
    "confirmed": MessageLookupByLibrary.simpleMessage("已確認"),
    "connect": MessageLookupByLibrary.simpleMessage("連線"),
    "connectionError": MessageLookupByLibrary.simpleMessage("連線錯誤，請重試"),
    "connectionInterrupted": MessageLookupByLibrary.simpleMessage("連線中斷，請重試"),
    "contactAction": MessageLookupByLibrary.simpleMessage("聯絡"),
    "copied": MessageLookupByLibrary.simpleMessage("已複製"),
    "copy": MessageLookupByLibrary.simpleMessage("複製"),
    "copyIdLink": MessageLookupByLibrary.simpleMessage("請複製 ID 連結以提交"),
    "copyLink": MessageLookupByLibrary.simpleMessage("複製連結"),
    "copyVerificationLink": MessageLookupByLibrary.simpleMessage("複製認證連結"),
    "count": MessageLookupByLibrary.simpleMessage("世"),
    "cousin": MessageLookupByLibrary.simpleMessage("堂表兄弟姊妹"),
    "cousin_brother": MessageLookupByLibrary.simpleMessage("堂表兄弟"),
    "cousin_brother_in_law": MessageLookupByLibrary.simpleMessage("堂表姊夫/妹夫"),
    "cousin_sister": MessageLookupByLibrary.simpleMessage("堂表姊妹"),
    "cousin_sister_in_law": MessageLookupByLibrary.simpleMessage("堂表嫂/弟媳"),
    "cousins_child": MessageLookupByLibrary.simpleMessage("堂表姪/甥"),
    "cousins_childs_child": MessageLookupByLibrary.simpleMessage("堂表姪孫/甥孫"),
    "create": MessageLookupByLibrary.simpleMessage("建立"),
    "createSelfId": MessageLookupByLibrary.simpleMessage("建立 SelfID"),
    "createSelfIdTitle": MessageLookupByLibrary.simpleMessage(
      "建立 Self ID (身分證)",
    ),
    "dateOfIssue": MessageLookupByLibrary.simpleMessage("簽發日期"),
    "daughter": MessageLookupByLibrary.simpleMessage("女兒"),
    "daughter2": MessageLookupByLibrary.simpleMessage("女"),
    "daughterInLaw": MessageLookupByLibrary.simpleMessage("兒媳"),
    "delete": MessageLookupByLibrary.simpleMessage("刪除"),
    "driverLicense": MessageLookupByLibrary.simpleMessage("駕照"),
    "duplicateNameSelectNumber": MessageLookupByLibrary.simpleMessage(
      "存在重名。請選擇序號。",
    ),
    "editProfile": MessageLookupByLibrary.simpleMessage("編輯個人資料"),
    "elder_brother": MessageLookupByLibrary.simpleMessage("兄"),
    "elder_sister": MessageLookupByLibrary.simpleMessage("姐"),
    "emailExists": MessageLookupByLibrary.simpleMessage("該電子信箱已被註冊"),
    "emailFormat": MessageLookupByLibrary.simpleMessage("電子信箱格式不正確"),
    "emailLabel": MessageLookupByLibrary.simpleMessage("電子郵件"),
    "emailRequired": MessageLookupByLibrary.simpleMessage("請輸入您的電子信箱"),
    "english": MessageLookupByLibrary.simpleMessage("英語"),
    "enter": MessageLookupByLibrary.simpleMessage("輸入"),
    "enterAccountNumber": MessageLookupByLibrary.simpleMessage("輸入帳號"),
    "enterInfoForIdCreation": MessageLookupByLibrary.simpleMessage(
      "請輸入建立 ID 所需的\n個人資訊",
    ),
    "enterNameAndRelationship": MessageLookupByLibrary.simpleMessage(
      "請輸入姓名並\n設定「關係」",
    ),
    "enterWithoutHyphen": MessageLookupByLibrary.simpleMessage("請輸入（無需連字號）"),
    "error": MessageLookupByLibrary.simpleMessage("錯誤"),
    "errorPageNotLoading": MessageLookupByLibrary.simpleMessage("頁面無法載入"),
    "family": MessageLookupByLibrary.simpleMessage("家族"),
    "familyCertificate": MessageLookupByLibrary.simpleMessage("家庭證"),
    "familyEditInstruction": MessageLookupByLibrary.simpleMessage(
      "點擊家庭圖示並按下「新增/刪除」按鈕即可編輯。",
    ),
    "familyTree": MessageLookupByLibrary.simpleMessage("家譜"),
    "father": MessageLookupByLibrary.simpleMessage("父親"),
    "father_2": MessageLookupByLibrary.simpleMessage("父"),
    "female": MessageLookupByLibrary.simpleMessage("女"),
    "field_given_name": MessageLookupByLibrary.simpleMessage("名"),
    "field_surname": MessageLookupByLibrary.simpleMessage("姓"),
    "fillAllRequiredFields": MessageLookupByLibrary.simpleMessage("請填寫所有必填欄位"),
    "finishSigup": MessageLookupByLibrary.simpleMessage("註冊已完成！"),
    "firstTimeChon": MessageLookupByLibrary.simpleMessage("初次使用 Chon？\n立即建立"),
    "gender": MessageLookupByLibrary.simpleMessage("性別"),
    "goToHome": MessageLookupByLibrary.simpleMessage("返回首頁"),
    "grandfather": MessageLookupByLibrary.simpleMessage("祖父"),
    "grandmother": MessageLookupByLibrary.simpleMessage("祖母"),
    "greenOnion": MessageLookupByLibrary.simpleMessage("派 (支派)"),
    "groupCall": MessageLookupByLibrary.simpleMessage("群組通話"),
    "groupChat": MessageLookupByLibrary.simpleMessage("群組聊天"),
    "guidanceAndAgreement": MessageLookupByLibrary.simpleMessage("指南與同意"),
    "hello": MessageLookupByLibrary.simpleMessage("你好"),
    "hint_ask_anything": MessageLookupByLibrary.simpleMessage("有什麼可以幫您？"),
    "hint_select_contact": MessageLookupByLibrary.simpleMessage("請選擇聯絡人"),
    "history": MessageLookupByLibrary.simpleMessage("歷史紀錄"),
    "home": MessageLookupByLibrary.simpleMessage("首頁"),
    "howCanIhelpYou": MessageLookupByLibrary.simpleMessage("有什麼可以幫您？"),
    "howToCreateSelfId": MessageLookupByLibrary.simpleMessage(
      "您希望透過哪種方式\n建立 Self ID (身分證明)？",
    ),
    "husband": MessageLookupByLibrary.simpleMessage("丈夫"),
    "idCardAreaGuide": MessageLookupByLibrary.simpleMessage("請將證件放入框內。"),
    "idCardTypes": MessageLookupByLibrary.simpleMessage("行動身分證、身分證、駕照"),
    "idCheckCompleted": MessageLookupByLibrary.simpleMessage("ID (證件) 檢查\n已完成"),
    "idList": MessageLookupByLibrary.simpleMessage("ID 列表"),
    "idNumber": MessageLookupByLibrary.simpleMessage("ID 號碼"),
    "idVerificationCompleted": MessageLookupByLibrary.simpleMessage(
      "證件驗證\n已完成",
    ),
    "identityCard": MessageLookupByLibrary.simpleMessage("身分證"),
    "image": MessageLookupByLibrary.simpleMessage("照片"),
    "infoRequired": MessageLookupByLibrary.simpleMessage("請輸入資訊"),
    "info_account_holder": m1,
    "info_issued_date": m2,
    "information": MessageLookupByLibrary.simpleMessage("資訊"),
    "inputInfoTitle": MessageLookupByLibrary.simpleMessage("輸入資訊"),
    "inquiryTitle": MessageLookupByLibrary.simpleMessage("諮詢"),
    "issueNumber": MessageLookupByLibrary.simpleMessage("。請確認。"),
    "issued": MessageLookupByLibrary.simpleMessage("已簽發"),
    "issuedDate": MessageLookupByLibrary.simpleMessage("簽發日期"),
    "issuer": MessageLookupByLibrary.simpleMessage("簽發機構"),
    "korean": MessageLookupByLibrary.simpleMessage("韓語"),
    "label_aptitude_test": MessageLookupByLibrary.simpleMessage("適性測驗"),
    "label_content": MessageLookupByLibrary.simpleMessage("內容"),
    "label_expiration_date": MessageLookupByLibrary.simpleMessage("過期日期"),
    "label_license_number": MessageLookupByLibrary.simpleMessage("執照號碼"),
    "language": MessageLookupByLibrary.simpleMessage("語言"),
    "languageOption": MessageLookupByLibrary.simpleMessage("語言"),
    "level": MessageLookupByLibrary.simpleMessage("段"),
    "levelNumber": MessageLookupByLibrary.simpleMessage("段位號"),
    "like": MessageLookupByLibrary.simpleMessage("號 (別號)"),
    "little_brother": MessageLookupByLibrary.simpleMessage("弟"),
    "little_sister": MessageLookupByLibrary.simpleMessage("妹"),
    "logOut": MessageLookupByLibrary.simpleMessage("登出"),
    "loginSessionExpired": MessageLookupByLibrary.simpleMessage("登入失效，請重新登入"),
    "makeCall": MessageLookupByLibrary.simpleMessage("撥打電話"),
    "male": MessageLookupByLibrary.simpleMessage("男"),
    "manualInput": MessageLookupByLibrary.simpleMessage("手動輸入"),
    "maternalGrandfather": MessageLookupByLibrary.simpleMessage("外祖父"),
    "maternalGrandmother": MessageLookupByLibrary.simpleMessage("外祖母"),
    "membershipCard": MessageLookupByLibrary.simpleMessage("會員卡"),
    "menuTitle": MessageLookupByLibrary.simpleMessage("選單"),
    "message": MessageLookupByLibrary.simpleMessage("訊息"),
    "mobileNumber": MessageLookupByLibrary.simpleMessage("手機號碼"),
    "mobilePhoneNumber": MessageLookupByLibrary.simpleMessage("手機號碼"),
    "mother": MessageLookupByLibrary.simpleMessage("母親"),
    "mother_2": MessageLookupByLibrary.simpleMessage("母"),
    "mutualAuthDesc": MessageLookupByLibrary.simpleMessage("與家人、親戚、朋友\n互相確認身分"),
    "mutualAuthTitle": MessageLookupByLibrary.simpleMessage("相互認證"),
    "mutualAuthentication": MessageLookupByLibrary.simpleMessage("相互認證"),
    "myInfo": MessageLookupByLibrary.simpleMessage("我的資訊"),
    "myInformation": MessageLookupByLibrary.simpleMessage("我的資訊"),
    "myReportHistoryTitle": MessageLookupByLibrary.simpleMessage("我的檢舉紀錄"),
    "name": MessageLookupByLibrary.simpleMessage("姓名"),
    "nameLabel": MessageLookupByLibrary.simpleMessage("姓名"),
    "nationality": MessageLookupByLibrary.simpleMessage("國籍"),
    "nephew": MessageLookupByLibrary.simpleMessage("孫子"),
    "nephewInLaw": MessageLookupByLibrary.simpleMessage("姪女婿"),
    "next": MessageLookupByLibrary.simpleMessage("下一步"),
    "niece": MessageLookupByLibrary.simpleMessage("孫女"),
    "nieceInLaw": MessageLookupByLibrary.simpleMessage("姪媳婦"),
    "niece_nephew": MessageLookupByLibrary.simpleMessage("姪子/外甥"),
    "noCard": MessageLookupByLibrary.simpleMessage("目前無ID"),
    "noCardsFound": MessageLookupByLibrary.simpleMessage("暫無卡片"),
    "noContact": MessageLookupByLibrary.simpleMessage("未找到聯絡方式。"),
    "noRequest": MessageLookupByLibrary.simpleMessage("無認證請求。"),
    "origin": MessageLookupByLibrary.simpleMessage("本貫 (籍貫)"),
    "other": MessageLookupByLibrary.simpleMessage("其他"),
    "other_grand": MessageLookupByLibrary.simpleMessage("姪孫"),
    "otpRequired": MessageLookupByLibrary.simpleMessage("請輸入發送至電子信箱的 4 位數驗證碼"),
    "ownedIdList": MessageLookupByLibrary.simpleMessage("已擁有的 ID 列表"),
    "ownerName": m3,
    "pa": MessageLookupByLibrary.simpleMessage("派"),
    "passport": MessageLookupByLibrary.simpleMessage("護照"),
    "password": MessageLookupByLibrary.simpleMessage("密碼"),
    "passwordMatching": MessageLookupByLibrary.simpleMessage("密碼相符"),
    "passwordRequired": MessageLookupByLibrary.simpleMessage("請輸入您要使用的密碼"),
    "personToVerify": MessageLookupByLibrary.simpleMessage("我需要認證的人"),
    "personalInfo": MessageLookupByLibrary.simpleMessage("個人資訊"),
    "phoneNotMatch": MessageLookupByLibrary.simpleMessage("手機號碼不匹配。"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("電話號碼"),
    "phoneNumberLabel": MessageLookupByLibrary.simpleMessage("電話號碼"),
    "pleaseAddVerifier": MessageLookupByLibrary.simpleMessage("請至少新增一名驗證人"),
    "pleaseCreateCertificate": MessageLookupByLibrary.simpleMessage(
      "請建立證書以繼續。",
    ),
    "pleaseEnter": MessageLookupByLibrary.simpleMessage("請輸入"),
    "pleaseEnterAccount": MessageLookupByLibrary.simpleMessage("請輸入帳號"),
    "pleaseEnterPassword": MessageLookupByLibrary.simpleMessage("請輸入密碼"),
    "pleaseEnterPhone": MessageLookupByLibrary.simpleMessage("請輸入手機號碼"),
    "pleaseEnterUsername": MessageLookupByLibrary.simpleMessage("請輸入帳號"),
    "pleaseFillAllFields": MessageLookupByLibrary.simpleMessage("請填寫所有欄位"),
    "pleaseRequestIdentityVerification": MessageLookupByLibrary.simpleMessage(
      "請請求下方申請人進行身分驗證。",
    ),
    "pleaseSelectBank": MessageLookupByLibrary.simpleMessage("請選擇銀行"),
    "pleaseSelectIds": MessageLookupByLibrary.simpleMessage(
      "請從下方的 ID 中選擇\n如果沒有，請使用「訊息」功能",
    ),
    "pleaseSelectIdsToSubmit": MessageLookupByLibrary.simpleMessage(
      "請選擇要提交的 ID",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("隱私權政策"),
    "profile": MessageLookupByLibrary.simpleMessage("個人資料"),
    "qrCheckInOut": MessageLookupByLibrary.simpleMessage("QR 簽到/簽退"),
    "qrScanComplete": MessageLookupByLibrary.simpleMessage(
      "QR 掃描完成！\n請點擊下方的連線",
    ),
    "qrScanOrUpload": MessageLookupByLibrary.simpleMessage(
      "請掃描 QR Code 或上傳圖片。",
    ),
    "readAndAgree": MessageLookupByLibrary.simpleMessage("閱讀並同意以下指南"),
    "redirectIdCreation": MessageLookupByLibrary.simpleMessage("跳轉至ID建立步驟"),
    "refusal": MessageLookupByLibrary.simpleMessage("拒絕"),
    "refusalSuccess": MessageLookupByLibrary.simpleMessage("已拒絕"),
    "registerToFamilyTreeGuide": MessageLookupByLibrary.simpleMessage(
      "如果確認，此人將被登記到我的家譜中",
    ),
    "relationship": MessageLookupByLibrary.simpleMessage("關係"),
    "relatives": MessageLookupByLibrary.simpleMessage("親屬"),
    "reportContentLabel": MessageLookupByLibrary.simpleMessage("檢舉內容"),
    "reportProblem": MessageLookupByLibrary.simpleMessage("回報問題"),
    "reportProblemTitle": MessageLookupByLibrary.simpleMessage("回報問題"),
    "requestVerificationGuide": MessageLookupByLibrary.simpleMessage(
      "請向家人、親戚或朋友\n請求驗證\n(相互認證)",
    ),
    "requesterList": MessageLookupByLibrary.simpleMessage("申請人列表"),
    "requireBothUpAndLowerCase": MessageLookupByLibrary.simpleMessage(
      "包含大小寫英文字母",
    ),
    "requireConfirmPassword": MessageLookupByLibrary.simpleMessage("請再次輸入密碼"),
    "requireSpecial": MessageLookupByLibrary.simpleMessage("包含特殊符號"),
    "requiredField": MessageLookupByLibrary.simpleMessage("必填"),
    "requiredFieldsNoticeHighlight": MessageLookupByLibrary.simpleMessage("必填"),
    "requiredFieldsNoticePrefix": MessageLookupByLibrary.simpleMessage(
      "所有欄位均為",
    ),
    "requiredFieldsNoticeSuffix": MessageLookupByLibrary.simpleMessage("項"),
    "resend": MessageLookupByLibrary.simpleMessage("重新發送"),
    "residenceCard": MessageLookupByLibrary.simpleMessage("居留證"),
    "residentNumber": MessageLookupByLibrary.simpleMessage("身分證字號"),
    "residentNumberFirstPartInvalid": MessageLookupByLibrary.simpleMessage(
      "身分證前6位必須正確 (YYMMDD)",
    ),
    "residentNumberSecondPartInvalid": MessageLookupByLibrary.simpleMessage(
      "身分證後7位必須正確",
    ),
    "ruler": MessageLookupByLibrary.simpleMessage("字 (表字)"),
    "save": MessageLookupByLibrary.simpleMessage("儲存"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("掃描 QR Code"),
    "se": MessageLookupByLibrary.simpleMessage("世"),
    "select": MessageLookupByLibrary.simpleMessage("選擇"),
    "selectCardType": MessageLookupByLibrary.simpleMessage("選擇卡片類型"),
    "selectFamilyRelationship": MessageLookupByLibrary.simpleMessage("請選擇家庭關係"),
    "selectIdToSubmit": MessageLookupByLibrary.simpleMessage("請選擇要提交的 ID (證件)"),
    "selectPortraitPhoto": MessageLookupByLibrary.simpleMessage("請選擇肖像照片"),
    "self": MessageLookupByLibrary.simpleMessage("本人"),
    "self_id_created": MessageLookupByLibrary.simpleMessage("Self ID 已建立"),
    "sendButton": MessageLookupByLibrary.simpleMessage("傳送"),
    "sendSms": MessageLookupByLibrary.simpleMessage("發送簡訊"),
    "sendTextMessage": MessageLookupByLibrary.simpleMessage("發送簡訊"),
    "serviceInterruption": MessageLookupByLibrary.simpleMessage("服務暫時中斷"),
    "serviceTermsAddendumContent": MessageLookupByLibrary.simpleMessage(
      "1. 本條款自 [2026.02.01] 起施行。\n2. 本條款也適用於施行日前加入的會員（法律法規有限制的除外）。",
    ),
    "serviceTermsAddendumTitle": MessageLookupByLibrary.simpleMessage("附則"),
    "serviceTermsAgreeCheckbox": MessageLookupByLibrary.simpleMessage(
      "(本條) 同意使用條款",
    ),
    "serviceTermsArt10Content": MessageLookupByLibrary.simpleMessage(
      "使用者不得進行以下行為：\n1. 盜用帳戶、盜用名義、冒充他人\n2. 發布違法資訊、侵犯版權、淫穢/非法拍攝物相關行為\n3. 誘發服務或伺服器過載或侵犯安全的行為\n4. 透過自動化手段未經授權蒐集/抓取/爬取（公司允許範圍除外）\n5. 侵犯他人權利（肖像權、個人資訊、名譽等）\n6. 其他違反法律法規或違背公序良俗的行為",
    ),
    "serviceTermsArt10Title": MessageLookupByLibrary.simpleMessage(
      "第10條（禁止行為）",
    ),
    "serviceTermsArt11Content": MessageLookupByLibrary.simpleMessage(
      "1. 會員違反本條款或營運政策時，公司可視違規程度採取警告、刪除/屏蔽內容、限制功能、暫停使用、永久暫停使用（註銷帳戶）等措施。\n2. 會員可隨時透過服務內程序終止使用合約（註銷會員）。\n3. 使用限制或終止後，根據相關法律法規及公司保管政策，部分資訊可能會保存一定期限，具體遵循隱私權政策。",
    ),
    "serviceTermsArt11Title": MessageLookupByLibrary.simpleMessage(
      "第11條（使用限制及合約終止）",
    ),
    "serviceTermsArt12Content": MessageLookupByLibrary.simpleMessage(
      "1. 付費服務的內容、資費、結算方式、提供期間、退款標準等遵循另行指南（服務畫面/結算頁面/退款政策）。\n2. 訂閱型服務的自動續費、解約、退款條件可能同時適用結算手段及應用商店政策（如：App Store/Play Store）與公司政策。",
    ),
    "serviceTermsArt12Title": MessageLookupByLibrary.simpleMessage(
      "第12條（付費服務及結算）",
    ),
    "serviceTermsArt13Content": MessageLookupByLibrary.simpleMessage(
      "1. 因天災、戰爭、停電、通信網故障、第三方服務故障等不可抗力導致無法提供服務時，公司不承擔責任。\n2. 除非法律認定責任，公司對使用者間糾紛、使用者輸入資訊的準確性、相互認證結果的可靠性、內容的合法性不承擔責任。\n3. 提供AI功能時，AI的輸出僅供參考（可能存在錯誤），最終判斷和責任由使用者承擔。",
    ),
    "serviceTermsArt13Title": MessageLookupByLibrary.simpleMessage(
      "第13條（免責及責任限制）",
    ),
    "serviceTermsArt14Content": MessageLookupByLibrary.simpleMessage(
      "1. 公司可透過會員註冊的電子郵件/手機號碼/App推播/服務內通知等合理方式進行通知。\n2. 因會員未保持聯絡方式最新導致未收到通知，由此產生的不利後果由會員承擔。",
    ),
    "serviceTermsArt14Title": MessageLookupByLibrary.simpleMessage("第14條（通知）"),
    "serviceTermsArt15Content": MessageLookupByLibrary.simpleMessage(
      "關於個人資訊的處理（蒐集、使用、提供、委託、銷毀等）遵循隱私權政策及相關同意程序。僅使用條款不代替個人資訊同意。",
    ),
    "serviceTermsArt15Title": MessageLookupByLibrary.simpleMessage(
      "第15條（個人資訊保護）",
    ),
    "serviceTermsArt16Content": MessageLookupByLibrary.simpleMessage(
      "1. 本條款根據大韓民國法律解釋和適用。\n2. 關於服務使用發生糾紛時，優先透過當事人協商解決，協商不成時，首爾中央地方法院為專屬管轄法院（或民事訴訟法上的管轄法院）。",
    ),
    "serviceTermsArt16Title": MessageLookupByLibrary.simpleMessage(
      "第16條（適用法律及管轄）",
    ),
    "serviceTermsArt1Content": MessageLookupByLibrary.simpleMessage(
      "本條款旨在規定公司與使用者（包括會員）之間關於使用公司提供的Chon服務的權利、義務及責任事項、使用條件與程序以及其他必要事項。",
    ),
    "serviceTermsArt1Title": MessageLookupByLibrary.simpleMessage("第1條（目的）"),
    "serviceTermsArt2Content": MessageLookupByLibrary.simpleMessage(
      "1. 服務：指公司提供的Chon App/Web及相關各項服務。\n2. 使用者：指存取服務並根據本條款使用公司提供服務的個人。\n3. 會員：指同意本條款、建立帳戶並使用服務的個人。\n4. 帳戶：指會員為識別身分及使用服務而設定的登入手段（電子郵件/手機號碼/社群登入等）及其附帶資訊。\n5. 內容：指會員在服務內發布、註冊、上傳、傳輸的文字、圖片、文件（含PDF）、連結、資料（含家譜/關係圖/個人檔案資訊）及其他資訊。\n6. 相互認證：指服務為確認和連結會員之間的特定關係（家人/朋友/組織等）而提供的認證程序或功能。\n7. 付費服務：指公司有償提供的訂閱、使用券、附加功能等（如適用）。",
    ),
    "serviceTermsArt2Title": MessageLookupByLibrary.simpleMessage("第2條（定義）"),
    "serviceTermsArt3Content": MessageLookupByLibrary.simpleMessage(
      "1. 本條款在服務畫面（初始畫面或連結畫面）發布或以其他方式通知，並經會員同意後生效。\n2. 公司可在不違反相關法律法規的範圍內修訂本條款。\n3. 本條款未盡事宜及解釋，遵循相關法律法規及公司另行制定的營運政策/指南、一般商業慣例。",
    ),
    "serviceTermsArt3Title": MessageLookupByLibrary.simpleMessage(
      "第3條（條款的效力及適用）",
    ),
    "serviceTermsArt4Content": MessageLookupByLibrary.simpleMessage(
      "1. 公司修訂條款時，將在服務內公告施行日期、修訂內容及修訂理由。\n2. 對於重要變更或對使用者不利的變更，公司將設定合理的期間（例如：至少30日前）進行公告，必要時進行單獨通知。\n3. 不同意變更條款的會員，可在變更條款生效前終止使用合約（註銷會員）。",
    ),
    "serviceTermsArt4Title": MessageLookupByLibrary.simpleMessage(
      "第4條（條款的變更及通知）",
    ),
    "serviceTermsArt5Content": MessageLookupByLibrary.simpleMessage(
      "1. 會員註冊在使用者同意條款並完成公司規定的程序（建立帳戶、實名認證等）後成立。\n2. 會員應保持帳戶資訊的最新性，因提供虛假資訊或盜用他人資訊而產生的不利後果由會員承擔。\n3. 會員有責任管理帳戶/密碼（或認證手段），如懷疑被第三方使用，應立即通知公司。",
    ),
    "serviceTermsArt5Title": MessageLookupByLibrary.simpleMessage(
      "第5條（會員註冊及帳戶管理）",
    ),
    "serviceTermsArt6Content": MessageLookupByLibrary.simpleMessage(
      "1. 未滿14歲兒童的會員註冊及個人資訊相關程序遵循法定代理人同意等相關法律法規（根據服務政策可能限制註冊）。\n2. 公司必要時可要求進行年齡驗證或法定代理人同意。",
    ),
    "serviceTermsArt6Title": MessageLookupByLibrary.simpleMessage(
      "第6條（未成年人的使用）",
    ),
    "serviceTermsArt7Content": MessageLookupByLibrary.simpleMessage(
      "1. 公司可提供以下服務：\na. 基於相互認證的關係（家人/朋友/組織等）連結及管理功能\nb. 家譜/關係圖建立、閱覽、共享功能\nc. 個人檔案/ID（身分/人脈）構成及顯示功能\nd. 文件/圖片上傳及整理功能（含PDF）\ne. 基於AI的搜尋/摘要/問答等附加功能（如適用）\n2. 公司可變更或中斷全部或部分服務，並在重大變更或中斷時提前公告。\n3. 公司可根據營運或技術需要進行維護，維護時間將在服務畫面公告。",
    ),
    "serviceTermsArt7Title": MessageLookupByLibrary.simpleMessage(
      "第7條（服務提供及變更）",
    ),
    "serviceTermsArt8Content": MessageLookupByLibrary.simpleMessage(
      "1. 相互認證是輔助確認會員間關係的功能，公司不保證會員間實際關係的法律效力或真實性。\n2. 未經他人同意，會員不得輸入或發布有關他人的敏感資訊（如：身分證字號等）。\n3. 關係資料（家譜/關係圖）由會員輸入及互動生成，由此產生的糾紛原則上由當事人之間解決。除非法律認定責任，公司無義務介入。",
    ),
    "serviceTermsArt8Title": MessageLookupByLibrary.simpleMessage(
      "第8條（相互認證及關係資料的特則）",
    ),
    "serviceTermsArt9Content": MessageLookupByLibrary.simpleMessage(
      "1. 內容的權利原則上歸屬於生成/註冊該內容的會員。\n2. 會員授予公司非獨家使用授權，允許公司在營運、提供、改進服務所需的範圍內儲存、複製、傳輸、轉換（如：格式轉換/搜尋索引）及顯示該內容。\n3. 會員保證對上傳的文件、圖片、文字等擁有合法權利或已獲得使用授權。\n4. 公司如欲利用內容改進AI功能等，將履行相關法律法規要求的另行通知/同意程序（如必要）。",
    ),
    "serviceTermsArt9Title": MessageLookupByLibrary.simpleMessage(
      "第9條（內容的權利及使用授權）",
    ),
    "serviceTermsCompanyInfoContent": MessageLookupByLibrary.simpleMessage(
      "• 名稱：Chon Inc.\n• 代表人：Shin Geun-young\n• 註冊號：196-86-03544\n• 地址：309, 3F, 464 Gangnam-daero, Gangnam-gu, Seoul\n• 客服：010-3420-8691 / ops@chon.ai\n• CPO：Kim Nam-yul",
    ),
    "serviceTermsCompanyInfoTitle": MessageLookupByLibrary.simpleMessage(
      "公司資訊",
    ),
    "serviceTermsHeaderContent": MessageLookupByLibrary.simpleMessage(
      "施行日期：2026.02.01\n版本：v1.0\n公司名稱：Chon Inc. (“公司”)\n服務名稱：Chon (“服務”)",
    ),
    "serviceTermsHeaderTitle": MessageLookupByLibrary.simpleMessage(
      "Chon 服務使用條款",
    ),
    "serviceTermsTitle": MessageLookupByLibrary.simpleMessage("Chon 使用條款"),
    "setting": MessageLookupByLibrary.simpleMessage("設定"),
    "settings": MessageLookupByLibrary.simpleMessage("設定"),
    "shootingGuide": MessageLookupByLibrary.simpleMessage(
      "請在深色背景下拍攝，調整角度以避免反光。",
    ),
    "siblings_brother_sister": MessageLookupByLibrary.simpleMessage("兄弟姊妹"),
    "siblings_child": MessageLookupByLibrary.simpleMessage("姪子/外甥"),
    "siblings_grand_child": MessageLookupByLibrary.simpleMessage("姪孫"),
    "signIn": MessageLookupByLibrary.simpleMessage("登入"),
    "signUp": MessageLookupByLibrary.simpleMessage("註冊"),
    "sister": MessageLookupByLibrary.simpleMessage("姊妹"),
    "sister2": MessageLookupByLibrary.simpleMessage("姊妹"),
    "sister_in_law": MessageLookupByLibrary.simpleMessage("嫂子"),
    "son": MessageLookupByLibrary.simpleMessage("兒子"),
    "son2": MessageLookupByLibrary.simpleMessage("子"),
    "sonInLaw": MessageLookupByLibrary.simpleMessage("女婿"),
    "spouse": MessageLookupByLibrary.simpleMessage("配偶"),
    "subTier": MessageLookupByLibrary.simpleMessage("子級"),
    "subjectLabel": MessageLookupByLibrary.simpleMessage("標題"),
    "submit": MessageLookupByLibrary.simpleMessage("提交"),
    "success": MessageLookupByLibrary.simpleMessage("成功"),
    "surname": MessageLookupByLibrary.simpleMessage("姓"),
    "systemDefault": MessageLookupByLibrary.simpleMessage("系統預設"),
    "taekwondo": MessageLookupByLibrary.simpleMessage("跆拳道"),
    "taekwondoCertificate": MessageLookupByLibrary.simpleMessage("跆拳道證書"),
    "taekwondoOfCertificate": MessageLookupByLibrary.simpleMessage("跆拳道認證"),
    "termsAddendumContent": MessageLookupByLibrary.simpleMessage(
      "1. 本條款自 [2026.02.01] 起生效。\n2. 施行日前加入的會員亦適用本條款。",
    ),
    "termsAddendumTitle": MessageLookupByLibrary.simpleMessage("附則"),
    "termsCheckboxMarketingOptional": MessageLookupByLibrary.simpleMessage(
      "(選填) 同意接收行銷資訊（電子郵件/簡訊/推播）",
    ),
    "termsCheckboxPrivacyRequired": MessageLookupByLibrary.simpleMessage(
      "(必選) 同意蒐集與使用個人資訊",
    ),
    "termsCheckboxThirdPartyRequired": MessageLookupByLibrary.simpleMessage(
      "(必選) 同意向第三方提供個人資訊（相互認證/家譜功能）",
    ),
    "termsConfirm": MessageLookupByLibrary.simpleMessage("確認"),
    "termsItemsContent": MessageLookupByLibrary.simpleMessage(
      "本公司在服務所需範圍內蒐集以下資訊：\n(A) 帳戶必要項目\n• 電子郵件或手機號碼\n• 密碼（加密）或認證權杖\n• 顯示名稱（姓名/暱稱）\n• 內部識別碼 (UID)\n(B) 相互認證/家譜功能相關項目\n• 用戶輸入的關係資訊\n• 認證資訊（邀請碼、權杖）\n• 公開的個人檔案（照片、簡介）\n(C) 自動蒐集項目\n• 存取紀錄、IP位址、裝置資訊、Cookie",
    ),
    "termsItemsTitle": MessageLookupByLibrary.simpleMessage("2) 蒐集與使用的個人資訊項目"),
    "termsMainTitle": MessageLookupByLibrary.simpleMessage("Chon 使用條款"),
    "termsMarketingConsentDetailContent": MessageLookupByLibrary.simpleMessage(
      "不同意也可使用服務。\n• 目的：活動、促銷、新功能通知\n• 項目：電子郵件、手機號碼、推播權杖\n• 期間：直至撤回同意或註銷",
    ),
    "termsMarketingConsentDetailTitle": MessageLookupByLibrary.simpleMessage(
      "[選填] 行銷同意詳情",
    ),
    "termsMarketingInfoContent": MessageLookupByLibrary.simpleMessage(
      "即使不同意此項目，您仍可使用基本服務。\n生效日期：2026.02.01\n公司：Chon Inc.\n• 代表人：Shin Geun-young\n• 地址：309, 3F, 464 Gangnam-daero, Gangnam-gu, Seoul",
    ),
    "termsMarketingInfoTitle": MessageLookupByLibrary.simpleMessage(
      "5) 選填同意（行銷）",
    ),
    "termsOfService": MessageLookupByLibrary.simpleMessage("使用條款"),
    "termsPrivacyConsentTitle": MessageLookupByLibrary.simpleMessage(
      "Chon 個人資訊蒐集與使用同意書",
    ),
    "termsProvisionItemsContent": MessageLookupByLibrary.simpleMessage(
      "僅提供會員設定為公開/共享的資訊：\n• 顯示名稱\n• 公開個人檔案\n• 關係資料\n• 家譜資料\n※ 除非您主動共享，否則不會提供聯絡方式（電話/電子郵件）。",
    ),
    "termsProvisionItemsTitle": MessageLookupByLibrary.simpleMessage("3) 提供項目"),
    "termsProvisionPurposeContent": MessageLookupByLibrary.simpleMessage(
      "• 執行相互認證及確認結果\n• 連結關係\n• 顯示和閱覽家譜",
    ),
    "termsProvisionPurposeTitle": MessageLookupByLibrary.simpleMessage(
      "2) 提供目的",
    ),
    "termsPurposeContent": MessageLookupByLibrary.simpleMessage(
      "Chon Inc.（以下簡稱「本公司」）基於以下目的蒐集與使用個人資訊：\n• 會員註冊及帳戶管理（身分識別、實名認證、登入、防止詐欺）\n• 相互認證及關係（家人/朋友/組織等）連結、家譜建立與管理\n• 服務營運、資安保障、品質改善\n• 客戶諮詢與客訴處理",
    ),
    "termsPurposeTitle": MessageLookupByLibrary.simpleMessage("1) 蒐集與使用目的"),
    "termsRecipientContent": MessageLookupByLibrary.simpleMessage(
      "• 已建立相互認證的其他會員\n• 指定為家譜共享對象的會員",
    ),
    "termsRecipientRetentionContent": MessageLookupByLibrary.simpleMessage(
      "• 在關係連結或共享設定保持期間，接收方可以查閱和使用。\n• 如果關係被刪除或取消共享，資訊將停止顯示。",
    ),
    "termsRecipientRetentionTitle": MessageLookupByLibrary.simpleMessage(
      "4) 接收方的保存期間",
    ),
    "termsRecipientTitle": MessageLookupByLibrary.simpleMessage("1) 接收方"),
    "termsRefusalContent": MessageLookupByLibrary.simpleMessage(
      "您有權拒絕同意。但若拒絕必要項目，可能會限制服務使用（如註冊、相互認證等）。",
    ),
    "termsRefusalTitle": MessageLookupByLibrary.simpleMessage("4) 拒絕權及不利影響"),
    "termsRetentionContent": MessageLookupByLibrary.simpleMessage(
      "原則上，個人資訊將保存至會員註銷為止。法律法規另有規定者除外。",
    ),
    "termsRetentionTitle": MessageLookupByLibrary.simpleMessage("3) 保存與使用期間"),
    "termsScrollDown": MessageLookupByLibrary.simpleMessage("向下捲動"),
    "termsThirdPartyContent": MessageLookupByLibrary.simpleMessage(
      "本公司如下向第三方（包括其他會員）提供個人資訊：",
    ),
    "termsThirdPartyRefusalContent": MessageLookupByLibrary.simpleMessage(
      "您可以拒絕向第三方提供資訊。但這對於相互認證和家譜功能是必要的，拒絕將導致無法使用相關功能。",
    ),
    "termsThirdPartyRefusalTitle": MessageLookupByLibrary.simpleMessage(
      "5) 拒絕權（第三方提供）",
    ),
    "termsThirdPartyTitle": MessageLookupByLibrary.simpleMessage(
      "同意向第三方提供個人資訊",
    ),
    "tier": MessageLookupByLibrary.simpleMessage("級"),
    "unVerifiedList": MessageLookupByLibrary.simpleMessage("未認證列表"),
    "uncle_aunt_husband": MessageLookupByLibrary.simpleMessage("姑丈"),
    "uncle_father_older": MessageLookupByLibrary.simpleMessage("伯父"),
    "unverified": MessageLookupByLibrary.simpleMessage("未驗證"),
    "update": MessageLookupByLibrary.simpleMessage("更新"),
    "updateFailed": MessageLookupByLibrary.simpleMessage("無法更新"),
    "uploadSizeLimitWarning": MessageLookupByLibrary.simpleMessage(
      "僅限上傳300MB以下的檔案。",
    ),
    "username": MessageLookupByLibrary.simpleMessage("帳號"),
    "verificationPoint": MessageLookupByLibrary.simpleMessage("認證積分"),
    "verificationRequest": MessageLookupByLibrary.simpleMessage("認證請求"),
    "verificationRequestedBy": MessageLookupByLibrary.simpleMessage(
      "已發送\n確認請求",
    ),
    "verificationScore": MessageLookupByLibrary.simpleMessage("認證評分"),
    "verifiedList": MessageLookupByLibrary.simpleMessage("已認證列表"),
    "verifierForMe": MessageLookupByLibrary.simpleMessage("為我認證的人"),
    "verifyFinish": MessageLookupByLibrary.simpleMessage("雙向認證已完成。"),
    "verifyRequest": MessageLookupByLibrary.simpleMessage("認證請求"),
    "verifycationRequest": MessageLookupByLibrary.simpleMessage("驗證請求"),
    "viewFamilyTree": MessageLookupByLibrary.simpleMessage("查看家譜"),
    "visaType": MessageLookupByLibrary.simpleMessage("簽證類型"),
    "wife": MessageLookupByLibrary.simpleMessage("妻子"),
  };
}
