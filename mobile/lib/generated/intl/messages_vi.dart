// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
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
  String get localeName => 'vi';

  static String m0(relation) => " là ${relation}.\nVui lòng xác nhận.";

  static String m1(account, name) => "${account} ${name}";

  static String m2(date) => "Cấp ngày ${date}";

  static String m3(name) => "${name}, ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "AN_ERROR_HAS_OCCURRED": MessageLookupByLibrary.simpleMessage(
      "Đã xảy ra lỗi",
    ),
    "BANK_ACCOUNT_NOT_EXIST": MessageLookupByLibrary.simpleMessage(
      "Không tìm thấy tài khoản ngân hàng cho ID này",
    ),
    "CARD_INFO_EXISTED": MessageLookupByLibrary.simpleMessage(
      "Thông tin thẻ đã tồn tại",
    ),
    "CARD_INFO_NOT_EXIST": MessageLookupByLibrary.simpleMessage(
      "Không tìm thấy thẻ của người dùng",
    ),
    "CLAN_EXISTED": MessageLookupByLibrary.simpleMessage("Clan đã tồn tại"),
    "CLAN_NOT_EXISTED": MessageLookupByLibrary.simpleMessage(
      "Clan không tồn tại",
    ),
    "CONFIRM_DID_FAIL": MessageLookupByLibrary.simpleMessage(
      "Xác nhận DID thất bại.",
    ),
    "DATA_NOT_MATCH": MessageLookupByLibrary.simpleMessage(
      "Dữ liệu không khớp",
    ),
    "DID_GENERATE_FAIL": MessageLookupByLibrary.simpleMessage(
      "Không thể tạo DID từ khóa công khai.",
    ),
    "ENROLL_DID_FAIL": MessageLookupByLibrary.simpleMessage(
      "Đăng ký DID thất bại.",
    ),
    "EVENT_CERTIFICATE_INVALID": MessageLookupByLibrary.simpleMessage(
      "Chứng chỉ không hợp lệ",
    ),
    "EVENT_CERTIFICATE_IS_NOT_CONFIRMED": MessageLookupByLibrary.simpleMessage(
      "Chứng chỉ chưa được xác nhận",
    ),
    "EVENT_MUST_BE_CHECK_IN_BEFORE": MessageLookupByLibrary.simpleMessage(
      "Cần check-in trước khi tham gia sự kiện",
    ),
    "EVENT_NOT_EXISTED": MessageLookupByLibrary.simpleMessage(
      "Sự kiện không tồn tại",
    ),
    "FAMILY_TREE_HAS_BEEN_INITIATED": MessageLookupByLibrary.simpleMessage(
      "Cây gia phả đã được khởi tạo.",
    ),
    "GENDER_INVALID": MessageLookupByLibrary.simpleMessage(
      "Giới tính phải là \'male\' hoặc \'female\'",
    ),
    "GENDER_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Giới tính không được để trống",
    ),
    "ID_NUMBER_EXIST": MessageLookupByLibrary.simpleMessage("Số ID đã tồn tại"),
    "ID_NUMBER_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "Số ID chỉ được chứa chữ số",
    ),
    "ID_NUMBER_NOT_EXISTED": MessageLookupByLibrary.simpleMessage(
      "Số ID không tồn tại",
    ),
    "ID_NUMBER_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Số ID không được để trống",
    ),
    "IMG_BASE64_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "Ảnh phải ở định dạng base64 hợp lệ",
    ),
    "IMG_BASE64_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "imgBase64 không được để trống",
    ),
    "INPUT_EMPTY": MessageLookupByLibrary.simpleMessage(
      "Dữ liệu nhập bị trống",
    ),
    "INPUT_INVALID": MessageLookupByLibrary.simpleMessage(
      "Dữ liệu nhập không hợp lệ",
    ),
    "INTEGRATION_DID_FAIL": MessageLookupByLibrary.simpleMessage(
      "Tích hợp DID thất bại.",
    ),
    "INVALID_TOKEN": MessageLookupByLibrary.simpleMessage("Token không hợp lệ"),
    "ISSUED_DATE_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "Ngày cấp phải đúng định dạng yyyy-MM-dd",
    ),
    "ISSUED_DATE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Ngày cấp không được để trống",
    ),
    "LOGIN_ERROR_01": MessageLookupByLibrary.simpleMessage("Email đã tồn tại"),
    "MESSAGE_TOO_LONG": MessageLookupByLibrary.simpleMessage(
      "Tin nhắn không được vượt quá 2000 ký tự.",
    ),
    "NATIONALITY_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "Quốc tịch chỉ được chứa chữ cái và khoảng trắng",
    ),
    "NATIONALITY_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Quốc tịch không được để trống",
    ),
    "NOT_FOUND": MessageLookupByLibrary.simpleMessage("Không tìm thấy"),
    "OTP_EXPIRED": MessageLookupByLibrary.simpleMessage("OTP đã hết hạn"),
    "PASSWORD_NOT_MATCH": MessageLookupByLibrary.simpleMessage(
      "Mật khẩu không khớp",
    ),
    "PASSWORD_OR_ACCOUNT_IN_ACTIVE": MessageLookupByLibrary.simpleMessage(
      "Sai mật khẩu hoặc tài khoản",
    ),
    "PHONE_NUMBER_EXISTED": MessageLookupByLibrary.simpleMessage(
      "Số điện thoại đã tồn tại",
    ),
    "PHONE_NUMBER_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "Số điện thoại liên hệ phải bắt đầu bằng mã quốc gia (ví dụ: +84, +1), sau đó là một khoảng trắng và 8 đến 12 chữ số",
    ),
    "PHONE_NUMBER_NOT_EXIST": MessageLookupByLibrary.simpleMessage(
      "Số điện thoại không tồn tại",
    ),
    "PHONE_NUMBER_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Số điện thoại liên hệ không được để trống",
    ),
    "REF_VISA_TYPE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Loại visa không được để trống",
    ),
    "REQUEST_TIMEOUT": MessageLookupByLibrary.simpleMessage(
      "Yêu cầu đã hết thời gian chờ",
    ),
    "SHARE_LINK_ERROR": MessageLookupByLibrary.simpleMessage(
      "Lỗi tạo link chia sẻ",
    ),
    "SUBMIT_DID_FAIL": MessageLookupByLibrary.simpleMessage(
      "Gửi DID thất bại.",
    ),
    "SYSTEM_ERROR": MessageLookupByLibrary.simpleMessage("Lỗi hệ thống"),
    "TAEKWONDO_EXISTED": MessageLookupByLibrary.simpleMessage(
      "Taekwondo đã tồn tại",
    ),
    "TAEKWONDO_NOT_EXISTED": MessageLookupByLibrary.simpleMessage(
      "Taekwondo không tồn tại",
    ),
    "THE_CONNECTION_ERRORED": MessageLookupByLibrary.simpleMessage(
      "Máy chủ đang bảo trì",
    ),
    "UNAUTHORIZED": MessageLookupByLibrary.simpleMessage(
      "Phiên đăng nhập đã hết hạn",
    ),
    "UNKNOWN": MessageLookupByLibrary.simpleMessage("Lỗi không xác định"),
    "VALIDATE_BANK_ACCOUNT_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Số tài khoản không được để trống",
    ),
    "VALIDATE_BANK_ID_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "ID ngân hàng không được để trống",
    ),
    "VALIDATE_BANK_REF_BANK_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Ngân hàng tham chiếu không được để trống",
    ),
    "VALIDATE_CARD_CARD_ID_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Mã thẻ không được để trống",
    ),
    "VALIDATE_CLAN_BIRTH_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Nơi sinh không được để trống",
    ),
    "VALIDATE_CLAN_CLAN_NAME_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Tên clan không được để trống",
    ),
    "VALIDATE_CLAN_IMAGE_BASE64_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "Ảnh phải đúng định dạng base64 và dung lượng ≤ 10MB",
        ),
    "VALIDATE_CLAN_IMAGE_BASE64_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Ảnh base64 không được để trống",
    ),
    "VALIDATE_CLAN_ORIGIN_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Nguồn gốc không được để trống",
    ),
    "VALIDATE_CLAN_PA_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Pa không được để trống",
    ),
    "VALIDATE_CLAN_PERSONAL_NAME_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("Tên cá nhân không được để trống"),
    "VALIDATE_CLAN_PHONE_NUMBER_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "Số điện thoại phải bắt đầu bằng mã quốc gia (ví dụ +84) theo sau là khoảng trắng và 8–12 chữ số",
        ),
    "VALIDATE_CLAN_PHONE_NUMBER_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Số điện thoại không được để trống",
    ),
    "VALIDATE_CLAN_SE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Se không được để trống",
    ),
    "VALIDATE_EVENT_ACTION_TYPE_INVALID": MessageLookupByLibrary.simpleMessage(
      "Loại hành động sự kiện không được để trống và giá trị phải là 1 (check in) hoặc 2 (check out)",
    ),
    "VALIDATE_EVENT_ID_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Mã sự kiện không được để trống",
    ),
    "VALIDATE_PUBLIC_KEY_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Public key không được để trống",
    ),
    "VALIDATE_RAW_DATA_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Dữ liệu gốc không được để trống",
    ),
    "VALIDATE_SIGNATURE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Chữ ký không được để trống",
    ),
    "VALIDATE_TEAKWONDO_ID_NUMBER_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("Số ID không được để trống"),
    "VALIDATE_TEAKWONDO_IMAGE_BASE64_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "Ảnh phải ở định dạng base64 hợp lệ (data:image/<type>;base64,...) và kích thước ≤ 10MB",
        ),
    "VALIDATE_TEAKWONDO_IMAGE_BASE64_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("Ảnh base64 không được để trống"),
    "VALIDATE_TEAKWONDO_ISSUE_DATE_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "Ngày cấp phải đúng định dạng yyyy-MM-dd",
        ),
    "VALIDATE_TEAKWONDO_ISSUE_DATE_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("Ngày cấp không được để trống"),
    "VALIDATE_TEAKWONDO_LEVEL_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Cấp độ không được để trống",
    ),
    "VALIDATE_TEAKWONDO_LEVEL_NUMBER_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("Số cấp độ không được để trống"),
    "VALIDATE_TEAKWONDO_NAME_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Tên không được để trống",
    ),
    "VALIDATE_TEAKWONDO_NATIONALY_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("Quốc tịch không được để trống"),
    "VERIFIED": MessageLookupByLibrary.simpleMessage(
      "Liên hệ đã được xác thực",
    ),
    "VERIFY_CONTACT_NOT_EXIST": MessageLookupByLibrary.simpleMessage(
      "Liên hệ không tồn tại",
    ),
    "VERIFY_ERROR": MessageLookupByLibrary.simpleMessage("Lỗi xác thực OTP"),
    "account": MessageLookupByLibrary.simpleMessage("ID (email)"),
    "accountInfoError": MessageLookupByLibrary.simpleMessage(
      "Thông tin tài khoản bị lỗi. Vui lòng kiểm tra lại thông tin đã nhập.",
    ),
    "accountList": MessageLookupByLibrary.simpleMessage("Danh sách tài khoản"),
    "accountRegisted": MessageLookupByLibrary.simpleMessage(
      "Tài khoản của bạn đã được đăng ký!",
    ),
    "accountRegistration": MessageLookupByLibrary.simpleMessage(
      "Đăng ký tài khoản",
    ),
    "accountRegistrationTerms": MessageLookupByLibrary.simpleMessage(
      "Mục đích: Đăng ký tài khoản chuyên dụng để thanh toán và quyết toán hội phí\n\nDịch vụ này bao gồm quy trình đăng ký và xác minh thông tin tài khoản ngân hàng để thực hiện việc đóng hội phí và các thủ tục quyết toán hợp lệ.\nThông tin bạn nhập là bắt buộc để xác minh danh tính và xử lý quyết toán, được sử dụng cho các mục đích sau:\n\n1. Xác minh danh tính và tên thật\nĐể đảm bảo người dùng đăng ký tài khoản chính chủ, quy trình xác thực tên thật sẽ được thực hiện thông qua các tổ chức tài chính. Việc này giúp ngăn chặn các sự cố như sử dụng trái phép tài khoản của người khác hoặc chuyển khoản nhầm.\n\n2. Đóng hội phí và Xử lý quyết toán\nThông tin tài khoản được sử dụng để xử lý chính xác và an toàn các giao dịch tài chính như hội phí, tiền quyết toán, tiền thưởng phát sinh trong quá trình sử dụng dịch vụ. Chi tiết nạp và rút tiền trong quá trình quyết toán sẽ được thông báo minh bạch cho người dùng.\n\n3. Thu thập và lưu trữ tối thiểu thông tin tài chính\nDịch vụ chỉ thu thập và sử dụng thông tin tài chính tối thiểu cần thiết cho mục đích quyết toán và chỉ lưu trữ trong thời hạn pháp luật quy định. Thông tin quá thời hạn lưu trữ sẽ được hủy ngay lập tức thông qua các quy trình bảo mật.\n\n4. Tuân thủ pháp luật và Giải quyết tranh chấp\nTheo luật giao dịch tài chính, hồ sơ giao dịch và thông tin tài khoản có thể được nộp cho các cơ quan liên quan nhằm mục đích thuế, kiểm toán hoặc giải quyết tranh chấp. Ngay cả trong trường hợp này, thông tin sẽ không được cung cấp cho bên thứ ba nếu không có căn cứ pháp lý.\n\nTất cả thông tin thu thập đều được mã hóa và quản lý an toàn theo \'Luật bảo vệ thông tin cá nhân\' và các quy định liên quan.\nNgoài ra, người dùng có thể rút lại sự đồng ý cung cấp thông tin bất cứ lúc nào, tuy nhiên việc rút lại có thể hạn chế việc sử dụng dịch vụ quyết toán sau đó.",
    ),
    "accountVerificationCompleted": MessageLookupByLibrary.simpleMessage(
      "Xác thực tài khoản\nđã hoàn tất",
    ),
    "achievements": MessageLookupByLibrary.simpleMessage("Thành tựu"),
    "action_delete": MessageLookupByLibrary.simpleMessage("Xóa"),
    "action_ok": MessageLookupByLibrary.simpleMessage("OK"),
    "action_select": MessageLookupByLibrary.simpleMessage("Chọn"),
    "add": MessageLookupByLibrary.simpleMessage("Thêm"),
    "addNewAccount": MessageLookupByLibrary.simpleMessage("Thêm tài khoản mới"),
    "address": MessageLookupByLibrary.simpleMessage("Địa chỉ"),
    "agreeAccountRealName": MessageLookupByLibrary.simpleMessage(
      "(Bắt buộc) Đồng ý tra cứu tài khoản thực",
    ),
    "agreeAll": MessageLookupByLibrary.simpleMessage("Đồng ý tất cả các mục"),
    "agreeAndContinue": MessageLookupByLibrary.simpleMessage(
      "Đồng ý và Tiếp tục",
    ),
    "agreeFinancialInfoCollection": MessageLookupByLibrary.simpleMessage(
      "(Bắt buộc) Thu thập và lưu trữ tối thiểu thông tin tài chính",
    ),
    "agreeNotification": MessageLookupByLibrary.simpleMessage(
      "(Tùy chọn) Nhận thông báo biên lai/quyết toán (Push/Email)",
    ),
    "album": MessageLookupByLibrary.simpleMessage("Album"),
    "appLanguage": MessageLookupByLibrary.simpleMessage("Ngôn ngữ ứng dụng"),
    "approval": MessageLookupByLibrary.simpleMessage("Phê duyệt"),
    "approvalSuccess": MessageLookupByLibrary.simpleMessage(
      "Phê duyệt thành công",
    ),
    "askForAnything": MessageLookupByLibrary.simpleMessage(
      "Hỏi bất cứ điều gì",
    ),
    "attachmentLabel": MessageLookupByLibrary.simpleMessage("Tệp đính kèm"),
    "aunt_father_sister": MessageLookupByLibrary.simpleMessage("Bác gái"),
    "aunt_uncle_wife": MessageLookupByLibrary.simpleMessage("Bác dâu"),
    "authRejected": MessageLookupByLibrary.simpleMessage("Đã từ chối xác thực"),
    "authentication": MessageLookupByLibrary.simpleMessage("Xác thực"),
    "authenticationRequest": MessageLookupByLibrary.simpleMessage(
      "Danh sách các yêu cầu xác thực đã nhận",
    ),
    "back": MessageLookupByLibrary.simpleMessage("Quay lại"),
    "bankAccount": MessageLookupByLibrary.simpleMessage("Tài khoản ngân hàng"),
    "bankAccountNumber": MessageLookupByLibrary.simpleMessage(
      "Số tài khoản ngân hàng",
    ),
    "bankInfo": MessageLookupByLibrary.simpleMessage("Thông tin ngân hàng"),
    "birth": MessageLookupByLibrary.simpleMessage("Ngày sinh"),
    "birthYearSuffix": MessageLookupByLibrary.simpleMessage("Sinh năm"),
    "blockHash": MessageLookupByLibrary.simpleMessage("Block Hash"),
    "brother": MessageLookupByLibrary.simpleMessage("Anh em"),
    "brother2": MessageLookupByLibrary.simpleMessage("Anh em"),
    "brother_in_law": MessageLookupByLibrary.simpleMessage("Anh rể"),
    "cameraNotInitialized": MessageLookupByLibrary.simpleMessage(
      "Camera chưa được khởi tạo",
    ),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "Cần quyền truy cập camera",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Hủy"),
    "captureIdCard": MessageLookupByLibrary.simpleMessage("Chụp giấy tờ"),
    "certification": MessageLookupByLibrary.simpleMessage("Chứng nhận"),
    "certifierList": MessageLookupByLibrary.simpleMessage(
      "Danh sách người xác thực",
    ),
    "change": MessageLookupByLibrary.simpleMessage("Thay đổi"),
    "changePhoneSuccess": MessageLookupByLibrary.simpleMessage(
      "Đổi số điện thoại thành công",
    ),
    "char": MessageLookupByLibrary.simpleMessage("ký tự"),
    "chat": MessageLookupByLibrary.simpleMessage("Trò chuyện"),
    "checkAccount": MessageLookupByLibrary.simpleMessage("Kiểm tra tài khoản"),
    "checkIn": MessageLookupByLibrary.simpleMessage("Check-in"),
    "checkInConfirmed": MessageLookupByLibrary.simpleMessage(
      "Đã xác nhận\nCheck-in",
    ),
    "checkOriginal": MessageLookupByLibrary.simpleMessage("Kiểm tra bản gốc"),
    "checkOut": MessageLookupByLibrary.simpleMessage("Check-out"),
    "checkOutConfirmed": MessageLookupByLibrary.simpleMessage(
      "Đã xác nhận\nCheck-out",
    ),
    "children": MessageLookupByLibrary.simpleMessage("Con cái"),
    "chon_action_approve": MessageLookupByLibrary.simpleMessage("Chấp nhận"),
    "chon_action_attach": MessageLookupByLibrary.simpleMessage("Đính kèm"),
    "chon_action_attached": MessageLookupByLibrary.simpleMessage("Đã đính kèm"),
    "chon_action_back": MessageLookupByLibrary.simpleMessage("Trở lại"),
    "chon_action_close": MessageLookupByLibrary.simpleMessage("Đóng"),
    "chon_action_confirm": MessageLookupByLibrary.simpleMessage("Xác nhận"),
    "chon_action_continue": MessageLookupByLibrary.simpleMessage("Tiếp tục"),
    "chon_action_finish": MessageLookupByLibrary.simpleMessage("Hoàn tất"),
    "chon_action_next": MessageLookupByLibrary.simpleMessage("Tiếp"),
    "chon_action_recapture": MessageLookupByLibrary.simpleMessage("Chụp lại"),
    "chon_action_reject": MessageLookupByLibrary.simpleMessage("Từ chối"),
    "chon_action_retry": MessageLookupByLibrary.simpleMessage("Thử lại"),
    "chon_action_save": MessageLookupByLibrary.simpleMessage("Lưu"),
    "chon_action_search_again": MessageLookupByLibrary.simpleMessage("Tìm lại"),
    "chon_action_send": MessageLookupByLibrary.simpleMessage("Gửi"),
    "chon_action_skip": MessageLookupByLibrary.simpleMessage("Bỏ qua"),
    "chon_action_start": MessageLookupByLibrary.simpleMessage("Bắt đầu"),
    "chon_chat_empty_body": MessageLookupByLibrary.simpleMessage(
      "Hỏi về quan hệ gia đình, xác thực,\ngia phả.",
    ),
    "chon_chat_empty_title": MessageLookupByLibrary.simpleMessage(
      "Hỏi CHON AI bất cứ điều gì",
    ),
    "chon_chat_input_hint": MessageLookupByLibrary.simpleMessage(
      "Nhập tin nhắn",
    ),
    "chon_chat_title": MessageLookupByLibrary.simpleMessage("CHON AI"),
    "chon_contact_completed": MessageLookupByLibrary.simpleMessage(
      "Đã kết thúc cuộc gọi.",
    ),
    "chon_contact_connecting": MessageLookupByLibrary.simpleMessage(
      "Đang kết nối…",
    ),
    "chon_contact_failed": MessageLookupByLibrary.simpleMessage(
      "Không kết nối được.",
    ),
    "chon_contact_idle_prompt": MessageLookupByLibrary.simpleMessage(
      "Chọn người để liên hệ.",
    ),
    "chon_contact_title": MessageLookupByLibrary.simpleMessage("Liên hệ"),
    "chon_ft_empty": MessageLookupByLibrary.simpleMessage(
      "Chưa có thông tin gia đình.",
    ),
    "chon_ft_title": MessageLookupByLibrary.simpleMessage("Gia phả"),
    "chon_home_banner": MessageLookupByLibrary.simpleMessage(
      "Tạo CHON ID của bạn qua xác thực lẫn nhau.",
    ),
    "chon_home_input_label": MessageLookupByLibrary.simpleMessage(
      "Thông tin đầu vào",
    ),
    "chon_home_mutual_subtitle": MessageLookupByLibrary.simpleMessage(
      "Xác minh lẫn nhau\nvới gia đình",
    ),
    "chon_home_mutual_title": MessageLookupByLibrary.simpleMessage(
      "Xác thực lẫn nhau",
    ),
    "chon_home_q_contact": MessageLookupByLibrary.simpleMessage(
      "Liên hệ\n(Gia phả)",
    ),
    "chon_home_q_edit_profile": MessageLookupByLibrary.simpleMessage(
      "Sửa hồ sơ",
    ),
    "chon_home_q_qr": MessageLookupByLibrary.simpleMessage("Mã QR"),
    "chon_home_q_support": MessageLookupByLibrary.simpleMessage("Hỗ trợ"),
    "chon_home_tutorial_card": MessageLookupByLibrary.simpleMessage(
      "Hướng dẫn\nCHON DID",
    ),
    "chon_id_gen_capture_back": MessageLookupByLibrary.simpleMessage(
      "Căn mặt sau của ID vào khung",
    ),
    "chon_id_gen_capture_front": MessageLookupByLibrary.simpleMessage(
      "Căn mặt trước của ID vào khung",
    ),
    "chon_id_gen_done": MessageLookupByLibrary.simpleMessage(
      "Đã phát hành CHON ID",
    ),
    "chon_id_gen_err_required": MessageLookupByLibrary.simpleMessage(
      "Thiếu thông tin.",
    ),
    "chon_id_gen_field_address": MessageLookupByLibrary.simpleMessage(
      "Địa chỉ",
    ),
    "chon_id_gen_field_authority": MessageLookupByLibrary.simpleMessage(
      "Cơ quan phát hành",
    ),
    "chon_id_gen_field_id": MessageLookupByLibrary.simpleMessage("Số CMND/ID"),
    "chon_id_gen_field_id_label": MessageLookupByLibrary.simpleMessage("Số ID"),
    "chon_id_gen_field_issued": MessageLookupByLibrary.simpleMessage(
      "Ngày phát hành",
    ),
    "chon_id_gen_field_name": MessageLookupByLibrary.simpleMessage("Họ tên"),
    "chon_id_gen_field_name_hint": MessageLookupByLibrary.simpleMessage(
      "Tên trên thẻ ID",
    ),
    "chon_id_gen_intro_body": MessageLookupByLibrary.simpleMessage(
      "Nhập thông tin ID và chụp ảnh\nđể tạo CHON ID.",
    ),
    "chon_id_gen_intro_title": MessageLookupByLibrary.simpleMessage(
      "Bắt đầu phát hành\nCHON ID của bạn",
    ),
    "chon_id_gen_ocr_err": MessageLookupByLibrary.simpleMessage(
      "Không đọc được ID. Vui lòng chụp lại.",
    ),
    "chon_id_gen_ocr_no_result": MessageLookupByLibrary.simpleMessage(
      "Không có kết quả tự động.",
    ),
    "chon_id_gen_ocr_title": MessageLookupByLibrary.simpleMessage(
      "Xác nhận kết quả đọc",
    ),
    "chon_id_gen_pick_type": MessageLookupByLibrary.simpleMessage(
      "Chọn loại ID",
    ),
    "chon_id_gen_prep_start": MessageLookupByLibrary.simpleMessage(
      "Bắt đầu chụp",
    ),
    "chon_id_gen_prep_tip1": MessageLookupByLibrary.simpleMessage(
      "Chụp với nền tối.",
    ),
    "chon_id_gen_prep_tip2": MessageLookupByLibrary.simpleMessage(
      "Tránh ánh sáng phản chiếu.",
    ),
    "chon_id_gen_prep_tip3": MessageLookupByLibrary.simpleMessage(
      "Đặt ID vào khung hướng dẫn.",
    ),
    "chon_id_gen_prep_title": MessageLookupByLibrary.simpleMessage(
      "Trước khi chụp",
    ),
    "chon_id_gen_reenter": MessageLookupByLibrary.simpleMessage("Nhập lại"),
    "chon_id_gen_review_finish": MessageLookupByLibrary.simpleMessage(
      "Phát hành",
    ),
    "chon_id_gen_review_title": MessageLookupByLibrary.simpleMessage(
      "Kiểm tra và hoàn tất",
    ),
    "chon_id_gen_title": MessageLookupByLibrary.simpleMessage("Phát hành ID"),
    "chon_id_gen_type_family": MessageLookupByLibrary.simpleMessage(
      "Giấy CN gia đình",
    ),
    "chon_id_gen_type_resident": MessageLookupByLibrary.simpleMessage(
      "Thẻ căn cước",
    ),
    "chon_id_gen_type_taekwondo": MessageLookupByLibrary.simpleMessage(
      "Chứng chỉ Taekwondo",
    ),
    "chon_id_gen_verified_fail": MessageLookupByLibrary.simpleMessage(
      "Không xác minh được",
    ),
    "chon_id_gen_verified_ok": MessageLookupByLibrary.simpleMessage(
      "Đã xác minh",
    ),
    "chon_mauth_off_intro": MessageLookupByLibrary.simpleMessage(
      "Xác minh CHON ID\ntrực tiếp ngoại tuyến.",
    ),
    "chon_mauth_off_my_qr": MessageLookupByLibrary.simpleMessage("QR của tôi"),
    "chon_mauth_off_no_payload": MessageLookupByLibrary.simpleMessage(
      "Thẻ này không có QR.",
    ),
    "chon_mauth_off_scan": MessageLookupByLibrary.simpleMessage(
      "Quét QR đối phương",
    ),
    "chon_mauth_off_scan_prompt": MessageLookupByLibrary.simpleMessage(
      "Đặt QR vào trong khung.",
    ),
    "chon_mauth_off_scan_sub": MessageLookupByLibrary.simpleMessage(
      "Dùng camera để đọc QR.",
    ),
    "chon_mauth_off_scan_title": MessageLookupByLibrary.simpleMessage(
      "Quét QR",
    ),
    "chon_mauth_off_show": MessageLookupByLibrary.simpleMessage(
      "Hiện QR của tôi",
    ),
    "chon_mauth_off_show_prompt": MessageLookupByLibrary.simpleMessage(
      "Hãy đưa QR này cho đối phương.",
    ),
    "chon_mauth_off_show_sub": MessageLookupByLibrary.simpleMessage(
      "Đối phương quét QR của tôi.",
    ),
    "chon_mauth_off_title": MessageLookupByLibrary.simpleMessage(
      "Xác thực ngoại tuyến",
    ),
    "chon_mauth_off_verified": MessageLookupByLibrary.simpleMessage(
      "Đã xác minh",
    ),
    "chon_mauth_off_verifying": MessageLookupByLibrary.simpleMessage(
      "Đang xác minh…",
    ),
    "chon_mauth_rcv_anonymous": MessageLookupByLibrary.simpleMessage("Vô danh"),
    "chon_mauth_rcv_approved": MessageLookupByLibrary.simpleMessage(
      "Đã chấp nhận",
    ),
    "chon_mauth_rcv_approving": MessageLookupByLibrary.simpleMessage(
      "Đang chấp nhận…",
    ),
    "chon_mauth_rcv_detail": MessageLookupByLibrary.simpleMessage(
      "Chi tiết yêu cầu",
    ),
    "chon_mauth_rcv_empty": MessageLookupByLibrary.simpleMessage(
      "Chưa có yêu cầu.",
    ),
    "chon_mauth_rcv_rejected": MessageLookupByLibrary.simpleMessage(
      "Đã từ chối",
    ),
    "chon_mauth_rcv_rejecting": MessageLookupByLibrary.simpleMessage(
      "Đang từ chối…",
    ),
    "chon_mauth_rcv_title": MessageLookupByLibrary.simpleMessage(
      "Yêu cầu nhận",
    ),
    "chon_mauth_req_approved": MessageLookupByLibrary.simpleMessage(
      "Đã chấp nhận.",
    ),
    "chon_mauth_req_awaiting": MessageLookupByLibrary.simpleMessage(
      "Đã gửi.\nĐang chờ phản hồi.",
    ),
    "chon_mauth_req_confirm_q": MessageLookupByLibrary.simpleMessage(
      "Đúng người này không?",
    ),
    "chon_mauth_req_done": MessageLookupByLibrary.simpleMessage(
      "Xác thực hoàn tất.",
    ),
    "chon_mauth_req_err_notfound": MessageLookupByLibrary.simpleMessage(
      "Không tìm thấy người dùng.",
    ),
    "chon_mauth_req_err_phone": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập số điện thoại.",
    ),
    "chon_mauth_req_phone_prompt": MessageLookupByLibrary.simpleMessage(
      "Nhập số điện thoại\ncủa người thân.",
    ),
    "chon_mauth_req_rejected": MessageLookupByLibrary.simpleMessage(
      "Đã từ chối.",
    ),
    "chon_mauth_req_retry_msg": MessageLookupByLibrary.simpleMessage(
      "Vui lòng thử lại.",
    ),
    "chon_mauth_req_send": MessageLookupByLibrary.simpleMessage("Gửi yêu cầu"),
    "chon_mauth_req_sending": MessageLookupByLibrary.simpleMessage("Đang gửi…"),
    "chon_mauth_req_title": MessageLookupByLibrary.simpleMessage("Xác thực"),
    "chon_nav_chon": MessageLookupByLibrary.simpleMessage("CHON"),
    "chon_nav_family_tree": MessageLookupByLibrary.simpleMessage("Gia phả"),
    "chon_nav_home": MessageLookupByLibrary.simpleMessage("Trang chủ"),
    "chon_nav_id_card": MessageLookupByLibrary.simpleMessage("Thẻ ID"),
    "chon_nav_mutual": MessageLookupByLibrary.simpleMessage("Xác thực"),
    "chon_profile_edit_given": MessageLookupByLibrary.simpleMessage("Tên"),
    "chon_profile_edit_required": MessageLookupByLibrary.simpleMessage(
      "Bắt buộc.",
    ),
    "chon_profile_edit_surname": MessageLookupByLibrary.simpleMessage("Họ"),
    "chon_profile_edit_title": MessageLookupByLibrary.simpleMessage(
      "Sửa hồ sơ",
    ),
    "chon_report_empty": MessageLookupByLibrary.simpleMessage(
      "Chưa có báo cáo.",
    ),
    "chon_report_err_required": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập tiêu đề và nội dung.",
    ),
    "chon_report_failed": MessageLookupByLibrary.simpleMessage("Gửi thất bại."),
    "chon_report_field_content": MessageLookupByLibrary.simpleMessage(
      "Nội dung",
    ),
    "chon_report_field_content_hint": MessageLookupByLibrary.simpleMessage(
      "Mô tả chi tiết vấn đề.",
    ),
    "chon_report_field_title": MessageLookupByLibrary.simpleMessage("Tiêu đề"),
    "chon_report_field_title_hint": MessageLookupByLibrary.simpleMessage(
      "Nhập tiêu đề báo cáo.",
    ),
    "chon_report_new": MessageLookupByLibrary.simpleMessage("Báo cáo mới"),
    "chon_report_sending": MessageLookupByLibrary.simpleMessage(
      "Đang gửi báo cáo…",
    ),
    "chon_report_submitted": MessageLookupByLibrary.simpleMessage(
      "Đã nhận báo cáo.",
    ),
    "chon_report_submitted_sub": MessageLookupByLibrary.simpleMessage(
      "Chúng tôi sẽ phản hồi sớm.",
    ),
    "chon_report_title": MessageLookupByLibrary.simpleMessage("Báo cáo sự cố"),
    "chon_tutorial_s1_body": MessageLookupByLibrary.simpleMessage(
      "Được người thân xác nhận danh tính\nvà xác thực khi cần thiết.",
    ),
    "chon_tutorial_s1_title": MessageLookupByLibrary.simpleMessage(
      "Xác minh\nbản thân với CHON DID",
    ),
    "chon_tutorial_s2_body": MessageLookupByLibrary.simpleMessage(
      "Xác thực với gia đình\nđể chứng minh mối quan hệ.",
    ),
    "chon_tutorial_s2_title": MessageLookupByLibrary.simpleMessage(
      "Xác thực lẫn nhau",
    ),
    "chon_tutorial_s3_body": MessageLookupByLibrary.simpleMessage(
      "Trực quan hóa quan hệ gia đình\nvà lưu trữ gia phả an toàn.",
    ),
    "chon_tutorial_s3_title": MessageLookupByLibrary.simpleMessage(
      "Cây gia phả\nvới gia đình",
    ),
    "chon_tutorial_s4_body": MessageLookupByLibrary.simpleMessage(
      "Cài đặt đã hoàn tất.\nSử dụng ngay bây giờ.",
    ),
    "chon_tutorial_s4_title": MessageLookupByLibrary.simpleMessage(
      "Sẵn sàng\nbắt đầu với CHON?",
    ),
    "clan": MessageLookupByLibrary.simpleMessage("Dòng họ"),
    "clanOfCertificate": MessageLookupByLibrary.simpleMessage(
      "Giấy chứng nhận dòng họ",
    ),
    "close": MessageLookupByLibrary.simpleMessage("Đóng"),
    "coating": MessageLookupByLibrary.simpleMessage("Dòng họ"),
    "confirm": MessageLookupByLibrary.simpleMessage("Xác nhận"),
    "confirmCheckInOut": MessageLookupByLibrary.simpleMessage(
      "Bạn có muốn thực hiện\nCheck-in / Check-out không?",
    ),
    "confirmDelete": MessageLookupByLibrary.simpleMessage(
      "Bạn có muốn xoá không?",
    ),
    "confirmRelationSuffix": m0,
    "confirmed": MessageLookupByLibrary.simpleMessage("Đã xác nhận"),
    "connect": MessageLookupByLibrary.simpleMessage("Kết nối"),
    "connectionError": MessageLookupByLibrary.simpleMessage(
      "Lỗi kết nối, vui lòng thử lại",
    ),
    "connectionInterrupted": MessageLookupByLibrary.simpleMessage(
      "Kết nối bị gián đoạn, vui lòng thử lại",
    ),
    "contactAction": MessageLookupByLibrary.simpleMessage("Liên hệ"),
    "copied": MessageLookupByLibrary.simpleMessage("Đã sao chép"),
    "copy": MessageLookupByLibrary.simpleMessage("Sao chép"),
    "copyIdLink": MessageLookupByLibrary.simpleMessage(
      "Vui lòng sao chép liên kết ID để nộp",
    ),
    "copyLink": MessageLookupByLibrary.simpleMessage("Sao chép liên kết"),
    "copyVerificationLink": MessageLookupByLibrary.simpleMessage(
      "Sao chép link xác thực",
    ),
    "count": MessageLookupByLibrary.simpleMessage("Đời"),
    "cousin": MessageLookupByLibrary.simpleMessage("Anh chị em họ"),
    "cousin_brother": MessageLookupByLibrary.simpleMessage("Anh em họ"),
    "cousin_brother_in_law": MessageLookupByLibrary.simpleMessage("Anh rể họ"),
    "cousin_sister": MessageLookupByLibrary.simpleMessage("Chị em họ"),
    "cousin_sister_in_law": MessageLookupByLibrary.simpleMessage("Chị dâu họ"),
    "cousins_child": MessageLookupByLibrary.simpleMessage("Cháu họ"),
    "cousins_childs_child": MessageLookupByLibrary.simpleMessage("Chắt"),
    "create": MessageLookupByLibrary.simpleMessage("Tạo mới"),
    "createSelfId": MessageLookupByLibrary.simpleMessage("Tạo SelfID"),
    "createSelfIdTitle": MessageLookupByLibrary.simpleMessage(
      "Tạo Self ID (Giấy tờ)",
    ),
    "dateOfIssue": MessageLookupByLibrary.simpleMessage("Ngày cấp"),
    "daughter": MessageLookupByLibrary.simpleMessage("Con gái"),
    "daughter2": MessageLookupByLibrary.simpleMessage("Con gái"),
    "daughterInLaw": MessageLookupByLibrary.simpleMessage("Con dâu"),
    "delete": MessageLookupByLibrary.simpleMessage("Xóa"),
    "driverLicense": MessageLookupByLibrary.simpleMessage("Giấy phép lái xe"),
    "duplicateNameSelectNumber": MessageLookupByLibrary.simpleMessage(
      "Có người trùng tên. Vui lòng chọn số thứ tự.",
    ),
    "editProfile": MessageLookupByLibrary.simpleMessage("Chỉnh sửa hồ sơ"),
    "elder_brother": MessageLookupByLibrary.simpleMessage("anh trai"),
    "elder_sister": MessageLookupByLibrary.simpleMessage("chị gái"),
    "emailExists": MessageLookupByLibrary.simpleMessage(
      "Email này đã được đăng ký",
    ),
    "emailFormat": MessageLookupByLibrary.simpleMessage(
      "Định dạng email không đúng",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("Email"),
    "emailRequired": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập email của bạn",
    ),
    "english": MessageLookupByLibrary.simpleMessage("Tiếng Anh"),
    "enter": MessageLookupByLibrary.simpleMessage("Nhập"),
    "enterAccountNumber": MessageLookupByLibrary.simpleMessage(
      "Nhập số tài khoản",
    ),
    "enterInfoForIdCreation": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập thông tin cá nhân\ncần thiết để tạo ID",
    ),
    "enterNameAndRelationship": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập tên và\nthiết lập \'Mối quan hệ\'",
    ),
    "enterWithoutHyphen": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập liền, không có dấu gạch ngang",
    ),
    "error": MessageLookupByLibrary.simpleMessage("Lỗi"),
    "errorPageNotLoading": MessageLookupByLibrary.simpleMessage(
      "Trang không tải được",
    ),
    "family": MessageLookupByLibrary.simpleMessage("Gia đình"),
    "familyCertificate": MessageLookupByLibrary.simpleMessage(
      "Chứng nhận gia đình",
    ),
    "familyEditInstruction": MessageLookupByLibrary.simpleMessage(
      "Nhấn vào biểu tượng gia đình và nhấn nút \"Thêm/Xóa\" để chỉnh sửa.",
    ),
    "familyTree": MessageLookupByLibrary.simpleMessage("Gia phả"),
    "father": MessageLookupByLibrary.simpleMessage("Bố"),
    "father_2": MessageLookupByLibrary.simpleMessage("bố"),
    "female": MessageLookupByLibrary.simpleMessage("Nữ"),
    "field_given_name": MessageLookupByLibrary.simpleMessage("Tên"),
    "field_surname": MessageLookupByLibrary.simpleMessage("Họ"),
    "fillAllRequiredFields": MessageLookupByLibrary.simpleMessage(
      "Vui lòng điền đầy đủ thông tin bắt buộc",
    ),
    "finishSigup": MessageLookupByLibrary.simpleMessage("Đăng ký hoàn tất!"),
    "firstTimeChon": MessageLookupByLibrary.simpleMessage(
      "Lần đầu dùng Chon?\nTạo ngay bây giờ",
    ),
    "gender": MessageLookupByLibrary.simpleMessage("Giới tính"),
    "goToHome": MessageLookupByLibrary.simpleMessage("Về trang chủ"),
    "grandfather": MessageLookupByLibrary.simpleMessage("Ông"),
    "grandmother": MessageLookupByLibrary.simpleMessage("Bà"),
    "greenOnion": MessageLookupByLibrary.simpleMessage("Chi/Phái"),
    "groupCall": MessageLookupByLibrary.simpleMessage("Gọi nhóm"),
    "groupChat": MessageLookupByLibrary.simpleMessage("Chat nhóm"),
    "guidanceAndAgreement": MessageLookupByLibrary.simpleMessage(
      "Hướng dẫn và Đồng ý",
    ),
    "hello": MessageLookupByLibrary.simpleMessage("Xin chào"),
    "hint_ask_anything": MessageLookupByLibrary.simpleMessage(
      "Bạn cần giúp gì?",
    ),
    "hint_select_contact": MessageLookupByLibrary.simpleMessage(
      "Chọn người liên hệ",
    ),
    "history": MessageLookupByLibrary.simpleMessage("Lịch sử"),
    "home": MessageLookupByLibrary.simpleMessage("Trang chủ"),
    "howCanIhelpYou": MessageLookupByLibrary.simpleMessage(
      "Tôi có thể giúp gì cho bạn?",
    ),
    "howToCreateSelfId": MessageLookupByLibrary.simpleMessage(
      "Bạn muốn tạo Self ID (Định danh)\nbằng phương thức nào?",
    ),
    "husband": MessageLookupByLibrary.simpleMessage("Chồng"),
    "idCardAreaGuide": MessageLookupByLibrary.simpleMessage(
      "Vui lòng đặt giấy tờ vào đúng khung hình",
    ),
    "idCardTypes": MessageLookupByLibrary.simpleMessage(
      "ID di động, CMND/CCCD, Bằng lái xe",
    ),
    "idCheckCompleted": MessageLookupByLibrary.simpleMessage(
      "Đã hoàn tất\nkiểm tra ID (Giấy tờ)",
    ),
    "idList": MessageLookupByLibrary.simpleMessage("Danh sách ID"),
    "idNumber": MessageLookupByLibrary.simpleMessage("Số ID"),
    "idVerificationCompleted": MessageLookupByLibrary.simpleMessage(
      "Đã hoàn tất\nxác minh giấy tờ",
    ),
    "identityCard": MessageLookupByLibrary.simpleMessage("CCCD"),
    "image": MessageLookupByLibrary.simpleMessage("Hình ảnh"),
    "infoRequired": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập thông tin",
    ),
    "info_account_holder": m1,
    "info_issued_date": m2,
    "information": MessageLookupByLibrary.simpleMessage("Thông tin"),
    "inputInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Thông tin nhập liệu",
    ),
    "inquiryTitle": MessageLookupByLibrary.simpleMessage("Hỏi đáp & Thắc mắc"),
    "issueNumber": MessageLookupByLibrary.simpleMessage(
      " đã được nhận. Vui lòng kiểm tra.",
    ),
    "issued": MessageLookupByLibrary.simpleMessage("Đã cấp"),
    "issuedDate": MessageLookupByLibrary.simpleMessage("Ngày cấp"),
    "issuer": MessageLookupByLibrary.simpleMessage("Nơi cấp"),
    "korean": MessageLookupByLibrary.simpleMessage("Tiếng Hàn"),
    "label_aptitude_test": MessageLookupByLibrary.simpleMessage(
      "Kiểm tra sát hạch",
    ),
    "label_content": MessageLookupByLibrary.simpleMessage("Nội dung"),
    "label_expiration_date": MessageLookupByLibrary.simpleMessage(
      "Ngày hết hạn",
    ),
    "label_license_number": MessageLookupByLibrary.simpleMessage(
      "Số giấy phép",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Ngôn ngữ"),
    "languageOption": MessageLookupByLibrary.simpleMessage("Ngôn ngữ"),
    "level": MessageLookupByLibrary.simpleMessage("Cấp"),
    "levelNumber": MessageLookupByLibrary.simpleMessage("Số cấp"),
    "like": MessageLookupByLibrary.simpleMessage("Tên hiệu"),
    "little_brother": MessageLookupByLibrary.simpleMessage("em trai"),
    "little_sister": MessageLookupByLibrary.simpleMessage("em gái"),
    "logOut": MessageLookupByLibrary.simpleMessage("Đăng xuất"),
    "loginSessionExpired": MessageLookupByLibrary.simpleMessage(
      "Phiên đăng nhập hết hạn",
    ),
    "makeCall": MessageLookupByLibrary.simpleMessage("Gọi điện"),
    "male": MessageLookupByLibrary.simpleMessage("Nam"),
    "manualInput": MessageLookupByLibrary.simpleMessage("Nhập thủ công"),
    "maternalGrandfather": MessageLookupByLibrary.simpleMessage("Ông ngoại"),
    "maternalGrandmother": MessageLookupByLibrary.simpleMessage("Bà ngoại"),
    "membershipCard": MessageLookupByLibrary.simpleMessage("Thẻ thành viên"),
    "menuTitle": MessageLookupByLibrary.simpleMessage("Menu"),
    "message": MessageLookupByLibrary.simpleMessage("Tin nhắn"),
    "mobileNumber": MessageLookupByLibrary.simpleMessage(
      "Số điện thoại di động",
    ),
    "mobilePhoneNumber": MessageLookupByLibrary.simpleMessage("Số điện thoại"),
    "mother": MessageLookupByLibrary.simpleMessage("Mẹ"),
    "mother_2": MessageLookupByLibrary.simpleMessage("mẹ"),
    "mutualAuthDesc": MessageLookupByLibrary.simpleMessage(
      "Xác minh danh tính với\ngia đình và người quen",
    ),
    "mutualAuthTitle": MessageLookupByLibrary.simpleMessage("Xác thực chéo"),
    "mutualAuthentication": MessageLookupByLibrary.simpleMessage(
      "Xác thực chéo",
    ),
    "myInfo": MessageLookupByLibrary.simpleMessage("Thông tin của tôi"),
    "myInformation": MessageLookupByLibrary.simpleMessage("Thông tin của tôi"),
    "myReportHistoryTitle": MessageLookupByLibrary.simpleMessage(
      "Lịch sử báo cáo của tôi",
    ),
    "name": MessageLookupByLibrary.simpleMessage("Tên"),
    "nameLabel": MessageLookupByLibrary.simpleMessage("Họ và tên"),
    "nationality": MessageLookupByLibrary.simpleMessage("Quốc tịch"),
    "nephew": MessageLookupByLibrary.simpleMessage("Cháu trai"),
    "nephewInLaw": MessageLookupByLibrary.simpleMessage("Cháu rể"),
    "next": MessageLookupByLibrary.simpleMessage("Tiếp theo"),
    "niece": MessageLookupByLibrary.simpleMessage("Cháu gái"),
    "nieceInLaw": MessageLookupByLibrary.simpleMessage("Cháu dâu"),
    "niece_nephew": MessageLookupByLibrary.simpleMessage("Cháu"),
    "noCard": MessageLookupByLibrary.simpleMessage(
      "Hiện tại bạn chưa có giấy tờ tùy thân.",
    ),
    "noCardsFound": MessageLookupByLibrary.simpleMessage("Không có thẻ nào"),
    "noContact": MessageLookupByLibrary.simpleMessage(
      "Không tìm thấy thông tin liên hệ.",
    ),
    "noRequest": MessageLookupByLibrary.simpleMessage(
      "Không có yêu cầu xác thực nào",
    ),
    "origin": MessageLookupByLibrary.simpleMessage("Nguyên quán"),
    "other": MessageLookupByLibrary.simpleMessage("Khác"),
    "other_grand": MessageLookupByLibrary.simpleMessage("Chắt"),
    "otpRequired": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập mã xác thực 4 số được gửi đến email",
    ),
    "ownedIdList": MessageLookupByLibrary.simpleMessage(
      "Danh sách ID đang sở hữu",
    ),
    "ownerName": m3,
    "pa": MessageLookupByLibrary.simpleMessage("Chi/Phái"),
    "passport": MessageLookupByLibrary.simpleMessage("Hộ chiếu"),
    "password": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
    "passwordMatching": MessageLookupByLibrary.simpleMessage(
      "Mật khẩu trùng khớp",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập mật khẩu bạn muốn sử dụng",
    ),
    "personToVerify": MessageLookupByLibrary.simpleMessage(
      "Người tôi cần xác thực",
    ),
    "personalInfo": MessageLookupByLibrary.simpleMessage("Thông tin cá nhân"),
    "phoneNotMatch": MessageLookupByLibrary.simpleMessage(
      "Số điện thoại không khớp.",
    ),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Số điện thoại"),
    "phoneNumberLabel": MessageLookupByLibrary.simpleMessage("Số điện thoại"),
    "pleaseAddVerifier": MessageLookupByLibrary.simpleMessage(
      "Vui lòng thêm ít nhất một người xác thực",
    ),
    "pleaseCreateCertificate": MessageLookupByLibrary.simpleMessage(
      "Vui lòng tạo chứng nhận để tiếp tục.",
    ),
    "pleaseEnter": MessageLookupByLibrary.simpleMessage("Vui lòng nhập"),
    "pleaseEnterAccount": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập\nsố tài khoản",
    ),
    "pleaseEnterPassword": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập mật khẩu",
    ),
    "pleaseEnterPhone": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập số điện thoại di động",
    ),
    "pleaseEnterUsername": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập tài khoản",
    ),
    "pleaseFillAllFields": MessageLookupByLibrary.simpleMessage(
      "Vui lòng điền tất cả các trường",
    ),
    "pleaseRequestIdentityVerification": MessageLookupByLibrary.simpleMessage(
      "Vui lòng yêu cầu xác minh danh tính cho người yêu cầu bên dưới.",
    ),
    "pleaseSelectBank": MessageLookupByLibrary.simpleMessage(
      "Vui lòng chọn ngân hàng",
    ),
    "pleaseSelectIds": MessageLookupByLibrary.simpleMessage(
      "Vui lòng chọn ID bên dưới\nNếu không có, vui lòng dùng \'Tin nhắn\'",
    ),
    "pleaseSelectIdsToSubmit": MessageLookupByLibrary.simpleMessage(
      "Vui lòng chọn ID muốn nộp",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Chính sách bảo mật"),
    "profile": MessageLookupByLibrary.simpleMessage("Hồ sơ"),
    "qrCheckInOut": MessageLookupByLibrary.simpleMessage(
      "QR Check-in/Check-out",
    ),
    "qrScanComplete": MessageLookupByLibrary.simpleMessage(
      "Quét QR hoàn tất!\nVui lòng nhấn Kết nối bên dưới",
    ),
    "qrScanOrUpload": MessageLookupByLibrary.simpleMessage(
      "Hãy quét mã QR hoặc tải ảnh lên.",
    ),
    "readAndAgree": MessageLookupByLibrary.simpleMessage(
      "Đọc và đồng ý với hướng dẫn bên dưới",
    ),
    "redirectIdCreation": MessageLookupByLibrary.simpleMessage(
      "Chúng ta hãy chuyển sang bước tạo ID.",
    ),
    "refusal": MessageLookupByLibrary.simpleMessage("Từ chối"),
    "refusalSuccess": MessageLookupByLibrary.simpleMessage(
      "Từ chối thành công",
    ),
    "registerToFamilyTreeGuide": MessageLookupByLibrary.simpleMessage(
      "Nếu xác nhận, người này sẽ được thêm vào gia phả của tôi",
    ),
    "relationship": MessageLookupByLibrary.simpleMessage("Mối quan hệ"),
    "relatives": MessageLookupByLibrary.simpleMessage("Họ hàng"),
    "reportContentLabel": MessageLookupByLibrary.simpleMessage(
      "Nội dung báo cáo",
    ),
    "reportProblem": MessageLookupByLibrary.simpleMessage("Báo cáo sự cố"),
    "reportProblemTitle": MessageLookupByLibrary.simpleMessage("Báo cáo sự cố"),
    "requestVerificationGuide": MessageLookupByLibrary.simpleMessage(
      "Yêu cầu gia đình, người thân, bạn bè\nxác thực giúp bạn\n(Xác thực chéo)",
    ),
    "requesterList": MessageLookupByLibrary.simpleMessage(
      "Danh sách người yêu cầu",
    ),
    "requireBothUpAndLowerCase": MessageLookupByLibrary.simpleMessage(
      "Bao gồm chữ hoa và chữ thường",
    ),
    "requireConfirmPassword": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập lại mật khẩu",
    ),
    "requireSpecial": MessageLookupByLibrary.simpleMessage(
      "Chứa ký tự đặc biệt",
    ),
    "requiredField": MessageLookupByLibrary.simpleMessage("Bắt buộc"),
    "requiredFieldsNoticeHighlight": MessageLookupByLibrary.simpleMessage(
      "bắt buộc",
    ),
    "requiredFieldsNoticePrefix": MessageLookupByLibrary.simpleMessage(
      "Tất cả các mục là ",
    ),
    "requiredFieldsNoticeSuffix": MessageLookupByLibrary.simpleMessage(""),
    "resend": MessageLookupByLibrary.simpleMessage("Gửi lại"),
    "residenceCard": MessageLookupByLibrary.simpleMessage("Thẻ cư trú"),
    "residentNumber": MessageLookupByLibrary.simpleMessage("Số CMND/CCCD"),
    "residentNumberFirstPartInvalid": MessageLookupByLibrary.simpleMessage(
      "Phần đầu ID phải đúng 6 chữ số (YYMMDD)",
    ),
    "residentNumberSecondPartInvalid": MessageLookupByLibrary.simpleMessage(
      "Phần sau ID phải đúng 7 chữ số",
    ),
    "ruler": MessageLookupByLibrary.simpleMessage("Tên chữ"),
    "save": MessageLookupByLibrary.simpleMessage("Lưu"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("Quét mã QR"),
    "se": MessageLookupByLibrary.simpleMessage("Đời"),
    "select": MessageLookupByLibrary.simpleMessage("Chọn"),
    "selectCardType": MessageLookupByLibrary.simpleMessage("Chọn loại thẻ"),
    "selectFamilyRelationship": MessageLookupByLibrary.simpleMessage(
      "Vui lòng chọn quan hệ gia đình",
    ),
    "selectIdToSubmit": MessageLookupByLibrary.simpleMessage(
      "Vui lòng chọn ID (Giấy tờ) để nộp",
    ),
    "selectPortraitPhoto": MessageLookupByLibrary.simpleMessage(
      "Vui lòng chọn ảnh chân dung",
    ),
    "self": MessageLookupByLibrary.simpleMessage("Bản thân"),
    "self_id_created": MessageLookupByLibrary.simpleMessage(
      "Self ID đã được tạo",
    ),
    "sendButton": MessageLookupByLibrary.simpleMessage("Gửi"),
    "sendSms": MessageLookupByLibrary.simpleMessage("Nhắn tin"),
    "sendTextMessage": MessageLookupByLibrary.simpleMessage("Gửi tin nhắn"),
    "serviceInterruption": MessageLookupByLibrary.simpleMessage(
      "Dịch vụ tạm thời gián đoạn",
    ),
    "serviceTermsAddendumContent": MessageLookupByLibrary.simpleMessage(
      "1. Các điều khoản này có hiệu lực từ [01/02/2026].\n2. Các điều khoản này cũng áp dụng cho các Thành viên đã tham gia trước ngày hiệu lực (trừ trường hợp có hạn chế theo pháp luật).",
    ),
    "serviceTermsAddendumTitle": MessageLookupByLibrary.simpleMessage(
      "Phụ lục",
    ),
    "serviceTermsAgreeCheckbox": MessageLookupByLibrary.simpleMessage(
      "(Điều khoản này) Đồng ý Điều khoản sử dụng",
    ),
    "serviceTermsArt10Content": MessageLookupByLibrary.simpleMessage(
      "Người dùng không được thực hiện các hành vi sau:\n1. Đánh cắp tài khoản, giả mạo danh tính người khác\n2. Đăng thông tin bất hợp pháp, vi phạm bản quyền, nội dung khiêu dâm/quay lén\n3. Gây quá tải cho Dịch vụ hoặc máy chủ hoặc xâm phạm bảo mật\n4. Thu thập/cào dữ liệu trái phép bằng phương tiện tự động (trừ phạm vi được Công ty cho phép)\n5. Xâm phạm quyền của người khác (quyền hình ảnh, thông tin cá nhân, danh dự, v.v.)\n6. Các hành vi khác vi phạm pháp luật hoặc trái với thuần phong mỹ tục và trật tự xã hội",
    ),
    "serviceTermsArt10Title": MessageLookupByLibrary.simpleMessage(
      "Điều 10 (Hành vi bị cấm)",
    ),
    "serviceTermsArt11Content": MessageLookupByLibrary.simpleMessage(
      "1. Trường hợp Thành viên vi phạm Điều khoản này hoặc chính sách vận hành, Công ty có thể áp dụng các biện pháp như cảnh cáo, xóa/ẩn nội dung, hạn chế tính năng, tạm ngừng sử dụng, ngừng sử dụng vĩnh viễn (hủy tài khoản) tùy theo mức độ vi phạm.\n2. Thành viên có thể chấm dứt hợp đồng sử dụng (hủy thành viên) bất cứ lúc nào thông qua quy trình trong Dịch vụ.\n3. Sau khi hạn chế sử dụng hoặc chấm dứt, một số thông tin có thể được lưu trữ trong một khoảng thời gian nhất định theo pháp luật và chính sách lưu trữ của Công ty, chi tiết tuân theo Chính sách bảo mật.",
    ),
    "serviceTermsArt11Title": MessageLookupByLibrary.simpleMessage(
      "Điều 11 (Hạn chế sử dụng và Chấm dứt hợp đồng)",
    ),
    "serviceTermsArt12Content": MessageLookupByLibrary.simpleMessage(
      "1. Nội dung, giá cước, phương thức thanh toán, thời gian cung cấp, tiêu chuẩn hoàn tiền, v.v. của Dịch vụ trả phí tuân theo hướng dẫn riêng (màn hình Dịch vụ/trang thanh toán/chính sách hoàn tiền).\n2. Các điều kiện gia hạn tự động, hủy bỏ, hoàn tiền của dịch vụ đăng ký có thể áp dụng đồng thời chính sách của phương thức thanh toán và cửa hàng ứng dụng (ví dụ: App Store/Play Store) và chính sách của Công ty.",
    ),
    "serviceTermsArt12Title": MessageLookupByLibrary.simpleMessage(
      "Điều 12 (Dịch vụ trả phí và Thanh toán)",
    ),
    "serviceTermsArt13Content": MessageLookupByLibrary.simpleMessage(
      "1. Công ty không chịu trách nhiệm trong trường hợp không thể cung cấp Dịch vụ do nguyên nhân bất khả kháng như thiên tai, chiến tranh, mất điện, sự cố mạng viễn thông, sự cố dịch vụ của bên thứ ba.\n2. Công ty không chịu trách nhiệm về tranh chấp giữa những Người dùng, tính chính xác của thông tin do Người dùng nhập, độ tin cậy của kết quả xác thực chéo, tính hợp pháp của Nội dung, trừ khi pháp luật quy định trách nhiệm.\n3. Trường hợp cung cấp tính năng AI, kết quả đầu ra của AI chỉ mang tính tham khảo (có thể có lỗi), phán quyết cuối cùng và trách nhiệm thuộc về Người dùng.",
    ),
    "serviceTermsArt13Title": MessageLookupByLibrary.simpleMessage(
      "Điều 13 (Miễn trừ và Giới hạn trách nhiệm)",
    ),
    "serviceTermsArt14Content": MessageLookupByLibrary.simpleMessage(
      "1. Công ty có thể thông báo bằng các phương thức hợp lý như email/số điện thoại/thông báo đẩy (push)/thông báo trong Dịch vụ mà Thành viên đã đăng ký.\n2. Trường hợp Thành viên không nhận được thông báo do không duy trì thông tin liên hệ cập nhật, mọi bất lợi phát sinh thuộc về Thành viên.",
    ),
    "serviceTermsArt14Title": MessageLookupByLibrary.simpleMessage(
      "Điều 14 (Thông báo)",
    ),
    "serviceTermsArt15Content": MessageLookupByLibrary.simpleMessage(
      "Các vấn đề về xử lý thông tin cá nhân (thu thập, sử dụng, cung cấp, ủy thác, hủy bỏ, v.v.) tuân theo Chính sách bảo mật và các thủ tục đồng ý liên quan. Điều khoản sử dụng không thay thế cho sự đồng ý về thông tin cá nhân.",
    ),
    "serviceTermsArt15Title": MessageLookupByLibrary.simpleMessage(
      "Điều 15 (Bảo vệ thông tin cá nhân)",
    ),
    "serviceTermsArt16Content": MessageLookupByLibrary.simpleMessage(
      "1. Các điều khoản này được giải thích và áp dụng theo pháp luật Hàn Quốc.\n2. Trường hợp phát sinh tranh chấp liên quan đến việc sử dụng Dịch vụ, ưu tiên giải quyết thông qua thương lượng giữa các bên, nếu thương lượng không thành, Tòa án Quận Trung tâm Seoul sẽ là tòa án có thẩm quyền độc quyền (hoặc tòa án có thẩm quyền theo Luật Tố tụng Dân sự).",
    ),
    "serviceTermsArt16Title": MessageLookupByLibrary.simpleMessage(
      "Điều 16 (Luật áp dụng và Thẩm quyền)",
    ),
    "serviceTermsArt1Content": MessageLookupByLibrary.simpleMessage(
      "Mục đích của các điều khoản này là quy định quyền, nghĩa vụ và trách nhiệm, điều kiện và thủ tục sử dụng, cũng như các vấn đề cần thiết khác giữa Công ty và Người dùng (bao gồm cả Thành viên) liên quan đến việc sử dụng dịch vụ Chon do Công ty cung cấp.",
    ),
    "serviceTermsArt1Title": MessageLookupByLibrary.simpleMessage(
      "Điều 1 (Mục đích)",
    ),
    "serviceTermsArt2Content": MessageLookupByLibrary.simpleMessage(
      "1. Dịch vụ: Là ứng dụng/web Chon và các dịch vụ liên quan do Công ty cung cấp.\n2. Người dùng: Là người truy cập Dịch vụ và sử dụng Dịch vụ do Công ty cung cấp theo Điều khoản này.\n3. Thành viên: Là người đồng ý với Điều khoản này, tạo tài khoản và sử dụng Dịch vụ.\n4. Tài khoản: Là phương tiện đăng nhập (email/số điện thoại/đăng nhập xã hội, v.v.) và thông tin đi kèm do Thành viên thiết lập để nhận dạng và sử dụng Dịch vụ.\n5. Nội dung: Là văn bản, hình ảnh, tài liệu (bao gồm PDF), liên kết, dữ liệu (bao gồm cây gia phả/sơ đồ mối quan hệ/thông tin hồ sơ) và các thông tin khác mà Thành viên đăng, đăng ký, tải lên hoặc truyền tải trong Dịch vụ.\n6. Xác thực chéo: Là quy trình hoặc chức năng xác thực do Dịch vụ cung cấp để xác nhận và kết nối các mối quan hệ cụ thể giữa các Thành viên (gia đình/bạn bè/tổ chức, v.v.).\n7. Dịch vụ trả phí: Là các gói đăng ký, quyền sử dụng, tính năng bổ sung, v.v. do Công ty cung cấp có thu phí (nếu có).",
    ),
    "serviceTermsArt2Title": MessageLookupByLibrary.simpleMessage(
      "Điều 2 (Định nghĩa)",
    ),
    "serviceTermsArt3Content": MessageLookupByLibrary.simpleMessage(
      "1. Các điều khoản này có hiệu lực khi được đăng trên màn hình Dịch vụ (màn hình ban đầu hoặc màn hình liên kết) hoặc được thông báo bằng phương thức khác và được Thành viên đồng ý.\n2. Công ty có thể sửa đổi các điều khoản này trong phạm vi không vi phạm pháp luật liên quan.\n3. Các vấn đề không được quy định trong Điều khoản này sẽ tuân theo pháp luật liên quan, chính sách vận hành/hướng dẫn do Công ty quy định riêng và tập quán thương mại chung.",
    ),
    "serviceTermsArt3Title": MessageLookupByLibrary.simpleMessage(
      "Điều 3 (Hiệu lực và Áp dụng)",
    ),
    "serviceTermsArt4Content": MessageLookupByLibrary.simpleMessage(
      "1. Khi sửa đổi điều khoản, Công ty sẽ thông báo ngày áp dụng, nội dung sửa đổi và lý do sửa đổi trong Dịch vụ.\n2. Trong trường hợp thay đổi quan trọng hoặc bất lợi cho Người dùng, Công ty sẽ thông báo trước một khoảng thời gian hợp lý (ví dụ: ít nhất 30 ngày) và thông báo riêng nếu cần thiết.\n3. Thành viên không đồng ý với điều khoản thay đổi có thể chấm dứt hợp đồng sử dụng (hủy thành viên) trước khi điều khoản thay đổi có hiệu lực.",
    ),
    "serviceTermsArt4Title": MessageLookupByLibrary.simpleMessage(
      "Điều 4 (Thay đổi và Thông báo)",
    ),
    "serviceTermsArt5Content": MessageLookupByLibrary.simpleMessage(
      "1. Đăng ký thành viên hoàn tất khi Người dùng đồng ý với điều khoản và hoàn thành các thủ tục do Công ty quy định (tạo tài khoản, xác minh danh tính, v.v.).\n2. Thành viên phải duy trì thông tin tài khoản cập nhật nhất và chịu trách nhiệm về mọi bất lợi do cung cấp thông tin sai lệch hoặc đánh cắp thông tin của người khác.\n3. Thành viên có trách nhiệm quản lý tài khoản/mật khẩu (hoặc phương tiện xác thực) và phải thông báo ngay cho Công ty nếu nghi ngờ có bên thứ ba sử dụng.",
    ),
    "serviceTermsArt5Title": MessageLookupByLibrary.simpleMessage(
      "Điều 5 (Đăng ký và Quản lý Tài khoản)",
    ),
    "serviceTermsArt6Content": MessageLookupByLibrary.simpleMessage(
      "1. Việc đăng ký và quy trình liên quan đến thông tin cá nhân của trẻ em dưới 14 tuổi tuân theo pháp luật liên quan như sự đồng ý của người đại diện theo pháp luật (có thể hạn chế đăng ký theo chính sách Dịch vụ).\n2. Công ty có thể yêu cầu xác minh độ tuổi hoặc sự đồng ý của người đại diện theo pháp luật nếu cần thiết.",
    ),
    "serviceTermsArt6Title": MessageLookupByLibrary.simpleMessage(
      "Điều 6 (Sử dụng bởi Người chưa thành niên)",
    ),
    "serviceTermsArt7Content": MessageLookupByLibrary.simpleMessage(
      "1. Công ty có thể cung cấp các dịch vụ sau:\na. Kết nối và quản lý mối quan hệ dựa trên xác thực chéo (gia đình/bạn bè/tổ chức, v.v.)\nb. Tạo, xem và chia sẻ cây gia phả/sơ đồ mối quan hệ\nc. Cấu hình và hiển thị Hồ sơ/ID (thân phận/kết nối)\nd. Tải lên và sắp xếp tài liệu/hình ảnh (bao gồm PDF)\ne. Các tính năng bổ sung như tìm kiếm/tóm tắt/hỏi đáp dựa trên AI (nếu có)\n2. Công ty có thể thay đổi hoặc ngừng cung cấp toàn bộ hoặc một phần Dịch vụ và sẽ thông báo trước trong trường hợp thay đổi hoặc ngừng cung cấp quan trọng.\n3. Công ty có thể tiến hành bảo trì theo nhu cầu vận hành/kỹ thuật và thời gian bảo trì sẽ được thông báo trên màn hình Dịch vụ.",
    ),
    "serviceTermsArt7Title": MessageLookupByLibrary.simpleMessage(
      "Điều 7 (Cung cấp và Thay đổi Dịch vụ)",
    ),
    "serviceTermsArt8Content": MessageLookupByLibrary.simpleMessage(
      "1. Xác thực chéo là tính năng hỗ trợ xác nhận mối quan hệ giữa các Thành viên, Công ty không đảm bảo hiệu lực pháp lý hoặc tính trung thực của mối quan hệ thực tế giữa các Thành viên.\n2. Thành viên không được nhập hoặc đăng thông tin nhạy cảm về người khác (ví dụ: số CMND, v.v.) mà không có sự đồng ý của họ.\n3. Dữ liệu mối quan hệ (cây gia phả/sơ đồ mối quan hệ) được tạo ra bởi sự nhập liệu và tương tác của Thành viên, tranh chấp phát sinh từ đó về nguyên tắc sẽ được giải quyết giữa các bên. Công ty không có nghĩa vụ can thiệp trừ khi pháp luật quy định trách nhiệm.",
    ),
    "serviceTermsArt8Title": MessageLookupByLibrary.simpleMessage(
      "Điều 8 (Quy định đặc biệt về Xác thực chéo và Dữ liệu mối quan hệ)",
    ),
    "serviceTermsArt9Content": MessageLookupByLibrary.simpleMessage(
      "1. Quyền đối với Nội dung về nguyên tắc thuộc về Thành viên đã tạo/đăng ký nội dung đó.\n2. Thành viên cấp cho Công ty quyền sử dụng không độc quyền để lưu trữ, sao chép, truyền tải, chuyển đổi (ví dụ: chuyển đổi định dạng/lập chỉ mục tìm kiếm) và hiển thị Nội dung đó trong phạm vi cần thiết để vận hành, cung cấp và cải thiện Dịch vụ.\n3. Thành viên đảm bảo rằng mình nắm giữ các quyền hợp pháp hoặc đã nhận được sự cho phép sử dụng đối với các tài liệu, hình ảnh, văn bản, v.v. được tải lên.\n4. Trường hợp Công ty có ý định sử dụng Nội dung để cải thiện tính năng AI, v.v., Công ty sẽ thực hiện các thủ tục thông báo/đồng ý riêng theo yêu cầu của pháp luật (nếu cần thiết).",
    ),
    "serviceTermsArt9Title": MessageLookupByLibrary.simpleMessage(
      "Điều 9 (Quyền đối với Nội dung và Cấp phép sử dụng)",
    ),
    "serviceTermsCompanyInfoContent": MessageLookupByLibrary.simpleMessage(
      "• Tên: Công ty Chon\n• Đại diện: Shin Geun-young\n• Số ĐKKD: 196-86-03544\n• Địa chỉ: 309, 3F, 464 Gangnam-daero, Gangnam-gu, Seoul\n• CSKH: 010-3420-8691 / ops@chon.ai\n• CPO: Kim Nam-yul / Giám đốc / 010-9949-4887",
    ),
    "serviceTermsCompanyInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Thông tin công ty",
    ),
    "serviceTermsHeaderContent": MessageLookupByLibrary.simpleMessage(
      "Ngày hiệu lực: 01/02/2026\nPhiên bản: v1.0\nTên công ty: Công ty Chon (“Công ty”)\nTên dịch vụ: Chon (“Dịch vụ”)",
    ),
    "serviceTermsHeaderTitle": MessageLookupByLibrary.simpleMessage(
      "Điều khoản sử dụng dịch vụ Chon",
    ),
    "serviceTermsTitle": MessageLookupByLibrary.simpleMessage(
      "Điều khoản sử dụng Chon",
    ),
    "setting": MessageLookupByLibrary.simpleMessage("Cài đặt"),
    "settings": MessageLookupByLibrary.simpleMessage("Cài đặt"),
    "shootingGuide": MessageLookupByLibrary.simpleMessage(
      "Vui lòng chụp trên nền tối. Điều chỉnh góc độ để tránh bị lóa sáng.",
    ),
    "siblings_brother_sister": MessageLookupByLibrary.simpleMessage(
      "Anh chị em",
    ),
    "siblings_child": MessageLookupByLibrary.simpleMessage("Cháu họ"),
    "siblings_grand_child": MessageLookupByLibrary.simpleMessage("Chắt"),
    "signIn": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
    "signUp": MessageLookupByLibrary.simpleMessage("Đăng ký"),
    "sister": MessageLookupByLibrary.simpleMessage("Chị em"),
    "sister2": MessageLookupByLibrary.simpleMessage("Chị em"),
    "sister_in_law": MessageLookupByLibrary.simpleMessage("Chị dâu"),
    "son": MessageLookupByLibrary.simpleMessage("Con trai"),
    "son2": MessageLookupByLibrary.simpleMessage("Con trai"),
    "sonInLaw": MessageLookupByLibrary.simpleMessage("Con rể"),
    "spouse": MessageLookupByLibrary.simpleMessage("Vợ chồng"),
    "subTier": MessageLookupByLibrary.simpleMessage("Bậc phụ"),
    "subjectLabel": MessageLookupByLibrary.simpleMessage("Tiêu đề"),
    "submit": MessageLookupByLibrary.simpleMessage("Gửi"),
    "success": MessageLookupByLibrary.simpleMessage("Thành công"),
    "surname": MessageLookupByLibrary.simpleMessage("Họ"),
    "systemDefault": MessageLookupByLibrary.simpleMessage("Mặc định hệ thống"),
    "taekwondo": MessageLookupByLibrary.simpleMessage("Taekwondo"),
    "taekwondoCertificate": MessageLookupByLibrary.simpleMessage(
      "Chứng chỉ Taekwondo",
    ),
    "taekwondoOfCertificate": MessageLookupByLibrary.simpleMessage(
      "Giấy chứng nhận Taekwondo",
    ),
    "termsAddendumContent": MessageLookupByLibrary.simpleMessage(
      "1. Các điều khoản này có hiệu lực từ [01/02/2026].\n2. Áp dụng cho cả các thành viên đã tham gia trước ngày này.",
    ),
    "termsAddendumTitle": MessageLookupByLibrary.simpleMessage("Phụ lục"),
    "termsCheckboxMarketingOptional": MessageLookupByLibrary.simpleMessage(
      "(Tùy chọn) Đồng ý nhận thông tin tiếp thị (Email/SMS/Push)",
    ),
    "termsCheckboxPrivacyRequired": MessageLookupByLibrary.simpleMessage(
      "(Bắt buộc) Đồng ý thu thập và sử dụng thông tin cá nhân",
    ),
    "termsCheckboxThirdPartyRequired": MessageLookupByLibrary.simpleMessage(
      "(Bắt buộc) Đồng ý cung cấp cho bên thứ ba (Xác thực chéo/Gia phả)",
    ),
    "termsConfirm": MessageLookupByLibrary.simpleMessage("Xác nhận"),
    "termsItemsContent": MessageLookupByLibrary.simpleMessage(
      "Công ty thu thập các thông tin sau:\n(A) Bắt buộc cho tài khoản:\n• Email hoặc Số điện thoại\n• Mật khẩu (mã hóa) hoặc token xác thực\n• Tên hiển thị (Tên/Biệt danh)\n• UID nội bộ\n(B) Cho tính năng Gia phả:\n• Thông tin mối quan hệ do người dùng nhập\n• Thông tin xác thực (mã mời, token)\n• Thông tin hồ sơ công khai (Ảnh, Giới thiệu)\n(C) Tự động thu thập:\n• Nhật ký truy cập, IP, Thiết bị, Cookies",
    ),
    "termsItemsTitle": MessageLookupByLibrary.simpleMessage(
      "2) Các mục thông tin thu thập",
    ),
    "termsMainTitle": MessageLookupByLibrary.simpleMessage(
      "Điều khoản sử dụng Chon",
    ),
    "termsMarketingConsentDetailContent": MessageLookupByLibrary.simpleMessage(
      "Dịch vụ vẫn khả dụng nếu không đồng ý.\n• Mục đích: Sự kiện, Khuyến mãi, Tính năng mới\n• Mục thu thập: Email, SĐT, Push Token\n• Lưu trữ: Đến khi rút lại đồng ý hoặc hủy thành viên",
    ),
    "termsMarketingConsentDetailTitle": MessageLookupByLibrary.simpleMessage(
      "[Tùy chọn] Chi tiết đồng ý tiếp thị",
    ),
    "termsMarketingInfoContent": MessageLookupByLibrary.simpleMessage(
      "Bạn vẫn có thể sử dụng dịch vụ cơ bản ngay cả khi không đồng ý mục này.\nNgày hiệu lực: 01/02/2026\nCông ty: Chon Inc.\n• Đại diện: Shin Geun-young\n• Địa chỉ: 309, 3F, 464 Gangnam-daero, Gangnam-gu, Seoul",
    ),
    "termsMarketingInfoTitle": MessageLookupByLibrary.simpleMessage(
      "5) Đồng ý tùy chọn (Tiếp thị)",
    ),
    "termsOfService": MessageLookupByLibrary.simpleMessage(
      "Điều khoản sử dụng",
    ),
    "termsPrivacyConsentTitle": MessageLookupByLibrary.simpleMessage(
      "Đồng ý thu thập & sử dụng thông tin cá nhân Chon",
    ),
    "termsProvisionItemsContent": MessageLookupByLibrary.simpleMessage(
      "Chỉ cung cấp thông tin được thành viên đặt là công khai/chia sẻ:\n• Tên hiển thị\n• Thông tin hồ sơ công khai\n• Dữ liệu mối quan hệ\n• Dữ liệu cây gia phả\n* Số điện thoại/Email không được cung cấp trừ khi bạn chủ động chia sẻ.",
    ),
    "termsProvisionItemsTitle": MessageLookupByLibrary.simpleMessage(
      "3) Các mục cung cấp",
    ),
    "termsProvisionPurposeContent": MessageLookupByLibrary.simpleMessage(
      "• Thực hiện xác thực chéo\n• Kết nối mối quan hệ\n• Hiển thị cây gia phả",
    ),
    "termsProvisionPurposeTitle": MessageLookupByLibrary.simpleMessage(
      "2) Mục đích cung cấp",
    ),
    "termsPurposeContent": MessageLookupByLibrary.simpleMessage(
      "Công ty Chon (sau đây gọi là \"Công ty\") thu thập và sử dụng thông tin cá nhân cho các mục đích sau:\n• Đăng ký và quản lý tài khoản (định danh, đăng nhập, ngăn chặn gian lận)\n• Xác thực chéo và kết nối quan hệ (gia đình/bạn bè), tạo và quản lý cây gia phả\n• Vận hành dịch vụ, bảo mật, cải thiện chất lượng\n• Hỗ trợ khách hàng và giải quyết khiếu nại",
    ),
    "termsPurposeTitle": MessageLookupByLibrary.simpleMessage(
      "1) Mục đích thu thập và sử dụng",
    ),
    "termsRecipientContent": MessageLookupByLibrary.simpleMessage(
      "• Các thành viên khác đã thiết lập xác thực chéo\n• Các thành viên được chia sẻ cây gia phả",
    ),
    "termsRecipientRetentionContent": MessageLookupByLibrary.simpleMessage(
      "• Người nhận có thể xem trong khi mối quan hệ hoặc cài đặt chia sẻ được duy trì.\n• Nếu quan hệ bị xóa, thông tin sẽ ngừng hiển thị.",
    ),
    "termsRecipientRetentionTitle": MessageLookupByLibrary.simpleMessage(
      "4) Thời gian lưu trữ của người nhận",
    ),
    "termsRecipientTitle": MessageLookupByLibrary.simpleMessage(
      "1) Người nhận",
    ),
    "termsRefusalContent": MessageLookupByLibrary.simpleMessage(
      "Bạn có quyền từ chối đồng ý. Tuy nhiên, nếu từ chối các mục bắt buộc, việc sử dụng dịch vụ (Đăng ký/Xác thực chéo) có thể bị hạn chế.",
    ),
    "termsRefusalTitle": MessageLookupByLibrary.simpleMessage(
      "4) Quyền từ chối và bất lợi",
    ),
    "termsRetentionContent": MessageLookupByLibrary.simpleMessage(
      "Về nguyên tắc, thông tin được lưu trữ cho đến khi hủy thành viên. Ngoại trừ trường hợp pháp luật yêu cầu lưu trữ.",
    ),
    "termsRetentionTitle": MessageLookupByLibrary.simpleMessage(
      "3) Thời gian lưu trữ",
    ),
    "termsScrollDown": MessageLookupByLibrary.simpleMessage("Cuộn xuống"),
    "termsThirdPartyContent": MessageLookupByLibrary.simpleMessage(
      "Công ty cung cấp thông tin cá nhân cho bên thứ ba (bao gồm các thành viên khác) như sau:",
    ),
    "termsThirdPartyRefusalContent": MessageLookupByLibrary.simpleMessage(
      "Bạn có thể từ chối cung cấp cho bên thứ ba. Tuy nhiên, điều này là cần thiết cho tính năng xác thực chéo và gia phả, nên việc từ chối sẽ hạn chế các tính năng này.",
    ),
    "termsThirdPartyRefusalTitle": MessageLookupByLibrary.simpleMessage(
      "5) Quyền từ chối (Bên thứ ba)",
    ),
    "termsThirdPartyTitle": MessageLookupByLibrary.simpleMessage(
      "Đồng ý cung cấp thông tin cho bên thứ ba",
    ),
    "tier": MessageLookupByLibrary.simpleMessage("Bậc"),
    "unVerifiedList": MessageLookupByLibrary.simpleMessage(
      "Danh sách chưa xác thực",
    ),
    "uncle_aunt_husband": MessageLookupByLibrary.simpleMessage("Bác rể"),
    "uncle_father_older": MessageLookupByLibrary.simpleMessage("Bác trai"),
    "unverified": MessageLookupByLibrary.simpleMessage("Chưa xác thực"),
    "update": MessageLookupByLibrary.simpleMessage("Cập nhật"),
    "updateFailed": MessageLookupByLibrary.simpleMessage("Không thể cập nhật"),
    "uploadSizeLimitWarning": MessageLookupByLibrary.simpleMessage(
      "Chỉ có thể tải lên tệp dưới 300MB.",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Tài khoản"),
    "verificationPoint": MessageLookupByLibrary.simpleMessage("Điểm xác thực"),
    "verificationRequest": MessageLookupByLibrary.simpleMessage(
      "Yêu cầu xác thực",
    ),
    "verificationRequestedBy": MessageLookupByLibrary.simpleMessage(
      "đã gửi yêu cầu\nxác nhận",
    ),
    "verificationScore": MessageLookupByLibrary.simpleMessage("Điểm xác thực"),
    "verifiedList": MessageLookupByLibrary.simpleMessage(
      "Danh sách đã xác thực",
    ),
    "verifierForMe": MessageLookupByLibrary.simpleMessage(
      "Người xác thực cho tôi",
    ),
    "verifyFinish": MessageLookupByLibrary.simpleMessage(
      "Quá trình xác thực lẫn nhau đã hoàn tất.",
    ),
    "verifyRequest": MessageLookupByLibrary.simpleMessage("Yêu cầu xác thực"),
    "verifycationRequest": MessageLookupByLibrary.simpleMessage(
      "Yêu cầu xác thực",
    ),
    "viewFamilyTree": MessageLookupByLibrary.simpleMessage("Xem cây gia phả"),
    "visaType": MessageLookupByLibrary.simpleMessage("Loại Visa"),
    "wife": MessageLookupByLibrary.simpleMessage("Vợ"),
  };
}
