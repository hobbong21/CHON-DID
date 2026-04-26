// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_CN locale. All the
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
  String get localeName => 'zh_CN';

  static String m0(relation) => "是${relation}。\n请确认。";

  static String m1(account, name) => "${account} ${name}";

  static String m2(date) => "于 ${date} 签发";

  static String m3(name) => "${name}, ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "AN_ERROR_HAS_OCCURRED": MessageLookupByLibrary.simpleMessage("发生错误"),
    "BANK_ACCOUNT_NOT_EXIST": MessageLookupByLibrary.simpleMessage(
      "未找到该ID的银行账户",
    ),
    "CARD_INFO_EXISTED": MessageLookupByLibrary.simpleMessage("卡片信息已存在"),
    "CARD_INFO_NOT_EXIST": MessageLookupByLibrary.simpleMessage("未找到该用户的卡片"),
    "CLAN_EXISTED": MessageLookupByLibrary.simpleMessage("部落已存在"),
    "CLAN_NOT_EXISTED": MessageLookupByLibrary.simpleMessage("部落不存在"),
    "CONFIRM_DID_FAIL": MessageLookupByLibrary.simpleMessage("DID确认失败。"),
    "DATA_NOT_MATCH": MessageLookupByLibrary.simpleMessage("数据不匹配"),
    "DID_GENERATE_FAIL": MessageLookupByLibrary.simpleMessage("无法从公钥生成DID。"),
    "ENROLL_DID_FAIL": MessageLookupByLibrary.simpleMessage("DID注册失败。"),
    "EVENT_CERTIFICATE_INVALID": MessageLookupByLibrary.simpleMessage("证书无效"),
    "EVENT_CERTIFICATE_IS_NOT_CONFIRMED": MessageLookupByLibrary.simpleMessage(
      "证书未确认",
    ),
    "EVENT_MUST_BE_CHECK_IN_BEFORE": MessageLookupByLibrary.simpleMessage(
      "事件必须先签到",
    ),
    "EVENT_NOT_EXISTED": MessageLookupByLibrary.simpleMessage("事件不存在"),
    "FAMILY_TREE_HAS_BEEN_INITIATED": MessageLookupByLibrary.simpleMessage(
      "家谱已初始化。",
    ),
    "GENDER_INVALID": MessageLookupByLibrary.simpleMessage("性别必须是“男”或“女”"),
    "GENDER_NOT_NULL": MessageLookupByLibrary.simpleMessage("性别不能为空"),
    "ID_NUMBER_EXIST": MessageLookupByLibrary.simpleMessage("身份证号已存在"),
    "ID_NUMBER_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "身份证号只能包含数字",
    ),
    "ID_NUMBER_NOT_EXISTED": MessageLookupByLibrary.simpleMessage("身份证号不存在"),
    "ID_NUMBER_NOT_NULL": MessageLookupByLibrary.simpleMessage("身份证号不能为空"),
    "IMG_BASE64_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "图片必须是有效的 base64 格式",
    ),
    "IMG_BASE64_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "imgBase64 不能为空",
    ),
    "INPUT_EMPTY": MessageLookupByLibrary.simpleMessage("输入为空"),
    "INPUT_INVALID": MessageLookupByLibrary.simpleMessage("输入无效"),
    "INTEGRATION_DID_FAIL": MessageLookupByLibrary.simpleMessage("DID集成失败。"),
    "INVALID_TOKEN": MessageLookupByLibrary.simpleMessage("无效的令牌"),
    "ISSUED_DATE_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "发行日期必须为 yyyy-MM-dd 格式",
    ),
    "ISSUED_DATE_NOT_NULL": MessageLookupByLibrary.simpleMessage("发行日期不能为空"),
    "LOGIN_ERROR_01": MessageLookupByLibrary.simpleMessage("邮箱已存在"),
    "MESSAGE_TOO_LONG": MessageLookupByLibrary.simpleMessage(
      "消息长度不能超过 2000 个字符",
    ),
    "NATIONALITY_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "国籍只能包含字母和空格",
    ),
    "NATIONALITY_NOT_NULL": MessageLookupByLibrary.simpleMessage("国籍不能为空"),
    "NOT_FOUND": MessageLookupByLibrary.simpleMessage("未找到"),
    "OTP_EXPIRED": MessageLookupByLibrary.simpleMessage("OTP 已过期"),
    "PASSWORD_NOT_MATCH": MessageLookupByLibrary.simpleMessage("密码不匹配"),
    "PASSWORD_OR_ACCOUNT_IN_ACTIVE": MessageLookupByLibrary.simpleMessage(
      "密码或账号错误",
    ),
    "PHONE_NUMBER_EXISTED": MessageLookupByLibrary.simpleMessage("电话号码已存在"),
    "PHONE_NUMBER_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "联系电话必须以国家代码开头，后跟空格和 8~12 位数字",
    ),
    "PHONE_NUMBER_NOT_EXIST": MessageLookupByLibrary.simpleMessage("电话号码不存在"),
    "PHONE_NUMBER_NOT_NULL": MessageLookupByLibrary.simpleMessage("联系电话不能为空"),
    "REF_VISA_TYPE_NOT_NULL": MessageLookupByLibrary.simpleMessage("签证类型不能为空"),
    "REQUEST_TIMEOUT": MessageLookupByLibrary.simpleMessage("请求超时"),
    "SHARE_LINK_ERROR": MessageLookupByLibrary.simpleMessage("生成分享链接时出错"),
    "SUBMIT_DID_FAIL": MessageLookupByLibrary.simpleMessage("DID提交失败。"),
    "SYSTEM_ERROR": MessageLookupByLibrary.simpleMessage("系统错误"),
    "TAEKWONDO_EXISTED": MessageLookupByLibrary.simpleMessage("跆拳道已存在"),
    "TAEKWONDO_NOT_EXISTED": MessageLookupByLibrary.simpleMessage("跆拳道不存在"),
    "THE_CONNECTION_ERRORED": MessageLookupByLibrary.simpleMessage("服务器维护中"),
    "UNAUTHORIZED": MessageLookupByLibrary.simpleMessage("会话已过期"),
    "UNKNOWN": MessageLookupByLibrary.simpleMessage("未知错误"),
    "VALIDATE_BANK_ACCOUNT_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "银行账户不能为空",
    ),
    "VALIDATE_BANK_ID_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "银行ID不能为空",
    ),
    "VALIDATE_BANK_REF_BANK_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "参考银行不能为空",
    ),
    "VALIDATE_CARD_CARD_ID_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "卡片ID不能为空",
    ),
    "VALIDATE_CLAN_BIRTH_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "出生地不能为空",
    ),
    "VALIDATE_CLAN_CLAN_NAME_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "部落名称不能为空",
    ),
    "VALIDATE_CLAN_IMAGE_BASE64_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "图片必须是有效的 base64 格式（data:image/<type>;base64,...），且大小不超过 10MB",
        ),
    "VALIDATE_CLAN_IMAGE_BASE64_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "图片 base64 不能为空",
    ),
    "VALIDATE_CLAN_ORIGIN_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "来源不能为空",
    ),
    "VALIDATE_CLAN_PA_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Pa 不能为空",
    ),
    "VALIDATE_CLAN_PERSONAL_NAME_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("个人姓名不能为空"),
    "VALIDATE_CLAN_PHONE_NUMBER_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "联系电话必须以国家代码（如 +84、+1）开头，后跟空格和 8~12 位数字（例如 +84 123456789）",
        ),
    "VALIDATE_CLAN_PHONE_NUMBER_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "电话号码不能为空",
    ),
    "VALIDATE_CLAN_SE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Se 不能为空",
    ),
    "VALIDATE_EVENT_ACTION_TYPE_INVALID": MessageLookupByLibrary.simpleMessage(
      "事件操作类型不能为空，且值必须为 1（签到）或 2（签退）",
    ),
    "VALIDATE_EVENT_ID_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "事件ID不能为空",
    ),
    "VALIDATE_PUBLIC_KEY_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "公钥不能为空",
    ),
    "VALIDATE_RAW_DATA_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "原始数据不能为空",
    ),
    "VALIDATE_SIGNATURE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "签名不能为空",
    ),
    "VALIDATE_TEAKWONDO_ID_NUMBER_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("身份证号不能为空"),
    "VALIDATE_TEAKWONDO_IMAGE_BASE64_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "图片必须是有效的 base64 格式（data:image/<type>;base64,...），且大小不超过 10MB",
        ),
    "VALIDATE_TEAKWONDO_IMAGE_BASE64_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("图片 base64 不能为空"),
    "VALIDATE_TEAKWONDO_ISSUE_DATE_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage("发行日期必须为 yyyy-MM-dd 格式"),
    "VALIDATE_TEAKWONDO_ISSUE_DATE_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("发行日期不能为空"),
    "VALIDATE_TEAKWONDO_LEVEL_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "等级不能为空",
    ),
    "VALIDATE_TEAKWONDO_LEVEL_NUMBER_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("等级编号不能为空"),
    "VALIDATE_TEAKWONDO_NAME_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "姓名不能为空",
    ),
    "VALIDATE_TEAKWONDO_NATIONALY_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("国籍不能为空"),
    "VERIFIED": MessageLookupByLibrary.simpleMessage("联系人已验证"),
    "VERIFY_CONTACT_NOT_EXIST": MessageLookupByLibrary.simpleMessage("联系人不存在"),
    "VERIFY_ERROR": MessageLookupByLibrary.simpleMessage("OTP 验证错误"),
    "account": MessageLookupByLibrary.simpleMessage("ID (邮箱)"),
    "accountInfoError": MessageLookupByLibrary.simpleMessage("账户信息错误，请检查输入内容。"),
    "accountList": MessageLookupByLibrary.simpleMessage("账户列表"),
    "accountRegisted": MessageLookupByLibrary.simpleMessage("您的账户已注册！"),
    "accountRegistration": MessageLookupByLibrary.simpleMessage("注册账户"),
    "accountRegistrationTerms": MessageLookupByLibrary.simpleMessage(
      "目的说明：注册用于会费缴纳与结算的专用账户\n\n本服务包含注册和验证银行账户信息的流程，以便执行合法的会费缴纳及结算程序。\n您输入的信息是身份验证和结算处理的必填项，将用于以下目的：\n\n1. 身份验证与实名认证\n为确保用户注册的是本人名义的账户，将通过金融机构进行实名认证程序。此举旨在防止盗用他人账户或误转账等事故。\n\n2. 会费缴纳与结算处理\n账户信息将用于准确、安全地处理服务使用过程中产生的会费、结算金、奖金等资金交易。结算过程中产生的存取款明细将透明地通知用户。\n\n3. 金融信息的最小化收集与保管\n本服务仅收集和使用结算目的所需的最小限度的金融信息，并仅在法律规定的期限内保管。超过保管期限的信息将通过安全程序立即销毁。\n\n4. 遵守法律与争议应对\n根据金融交易相关法律，交易记录及账户信息可能会因税务、审计、争议解决等目的提交给相关机构。即使在此情况下，若无法律依据，不会随意提供给第三方。\n\n所有收集的信息均根据《个人信息保护法》及相关规定进行加密并安全管理。\n此外，用户可随时撤回信息提供同意，但撤回后可能会限制后续结算服务的使用。",
    ),
    "accountVerificationCompleted": MessageLookupByLibrary.simpleMessage(
      "账户验证\n已完成",
    ),
    "achievements": MessageLookupByLibrary.simpleMessage("成就"),
    "action_delete": MessageLookupByLibrary.simpleMessage("删除"),
    "action_ok": MessageLookupByLibrary.simpleMessage("确定"),
    "action_select": MessageLookupByLibrary.simpleMessage("选择"),
    "add": MessageLookupByLibrary.simpleMessage("添加"),
    "addNewAccount": MessageLookupByLibrary.simpleMessage("添加新账户"),
    "address": MessageLookupByLibrary.simpleMessage("地址"),
    "agreeAccountRealName": MessageLookupByLibrary.simpleMessage(
      "(必选) 同意账户实名查询",
    ),
    "agreeAll": MessageLookupByLibrary.simpleMessage("同意所有条款"),
    "agreeAndContinue": MessageLookupByLibrary.simpleMessage("同意并继续"),
    "agreeFinancialInfoCollection": MessageLookupByLibrary.simpleMessage(
      "(必选) 同意最小化收集与保管金融信息",
    ),
    "agreeNotification": MessageLookupByLibrary.simpleMessage(
      "(可选) 接收收据/结算通知 (推送/邮件)",
    ),
    "album": MessageLookupByLibrary.simpleMessage("相册"),
    "appLanguage": MessageLookupByLibrary.simpleMessage("应用语言"),
    "approval": MessageLookupByLibrary.simpleMessage("批准"),
    "approvalSuccess": MessageLookupByLibrary.simpleMessage("已批准"),
    "askForAnything": MessageLookupByLibrary.simpleMessage("随时提问"),
    "attachmentLabel": MessageLookupByLibrary.simpleMessage("附件"),
    "aunt_father_sister": MessageLookupByLibrary.simpleMessage("姑母"),
    "aunt_uncle_wife": MessageLookupByLibrary.simpleMessage("伯母"),
    "authRejected": MessageLookupByLibrary.simpleMessage("已拒绝相互认证"),
    "authentication": MessageLookupByLibrary.simpleMessage("认证"),
    "authenticationRequest": MessageLookupByLibrary.simpleMessage(
      "收到的相互认证\n请求列表",
    ),
    "back": MessageLookupByLibrary.simpleMessage("返回"),
    "bankAccount": MessageLookupByLibrary.simpleMessage("银行账户"),
    "bankAccountNumber": MessageLookupByLibrary.simpleMessage("银行账号"),
    "bankInfo": MessageLookupByLibrary.simpleMessage("銀行資訊"),
    "birth": MessageLookupByLibrary.simpleMessage("出生日期"),
    "birthYearSuffix": MessageLookupByLibrary.simpleMessage("年生"),
    "blockHash": MessageLookupByLibrary.simpleMessage("区块哈希"),
    "brother": MessageLookupByLibrary.simpleMessage("兄弟"),
    "brother2": MessageLookupByLibrary.simpleMessage("兄弟"),
    "brother_in_law": MessageLookupByLibrary.simpleMessage("姐夫"),
    "cameraNotInitialized": MessageLookupByLibrary.simpleMessage("相机未初始化"),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage("需要相机权限"),
    "cancel": MessageLookupByLibrary.simpleMessage("取消"),
    "captureIdCard": MessageLookupByLibrary.simpleMessage("拍摄证件"),
    "certification": MessageLookupByLibrary.simpleMessage("证明"),
    "certifierList": MessageLookupByLibrary.simpleMessage("认证人列表"),
    "change": MessageLookupByLibrary.simpleMessage("更改"),
    "changePhoneSuccess": MessageLookupByLibrary.simpleMessage("更换手机号码成功"),
    "char": MessageLookupByLibrary.simpleMessage("字符"),
    "chat": MessageLookupByLibrary.simpleMessage("聊天"),
    "checkAccount": MessageLookupByLibrary.simpleMessage("检查账户"),
    "checkIn": MessageLookupByLibrary.simpleMessage("签到"),
    "checkInConfirmed": MessageLookupByLibrary.simpleMessage("签到\n已确认"),
    "checkOriginal": MessageLookupByLibrary.simpleMessage("查看原件"),
    "checkOut": MessageLookupByLibrary.simpleMessage("签退"),
    "checkOutConfirmed": MessageLookupByLibrary.simpleMessage("签退\n已确认"),
    "children": MessageLookupByLibrary.simpleMessage("子女"),
    "chon_action_approve": MessageLookupByLibrary.simpleMessage("批准"),
    "chon_action_attach": MessageLookupByLibrary.simpleMessage("附件"),
    "chon_action_attached": MessageLookupByLibrary.simpleMessage("已附加"),
    "chon_action_back": MessageLookupByLibrary.simpleMessage("返回"),
    "chon_action_close": MessageLookupByLibrary.simpleMessage("关闭"),
    "chon_action_confirm": MessageLookupByLibrary.simpleMessage("确认"),
    "chon_action_continue": MessageLookupByLibrary.simpleMessage("继续"),
    "chon_action_finish": MessageLookupByLibrary.simpleMessage("完成"),
    "chon_action_next": MessageLookupByLibrary.simpleMessage("下一步"),
    "chon_action_recapture": MessageLookupByLibrary.simpleMessage("重拍"),
    "chon_action_reject": MessageLookupByLibrary.simpleMessage("拒绝"),
    "chon_action_retry": MessageLookupByLibrary.simpleMessage("重试"),
    "chon_action_save": MessageLookupByLibrary.simpleMessage("保存"),
    "chon_action_search_again": MessageLookupByLibrary.simpleMessage("重新搜索"),
    "chon_action_send": MessageLookupByLibrary.simpleMessage("发送"),
    "chon_action_skip": MessageLookupByLibrary.simpleMessage("跳过"),
    "chon_action_start": MessageLookupByLibrary.simpleMessage("开始"),
    "chon_chat_empty_body": MessageLookupByLibrary.simpleMessage(
      "向 AI 咨询家庭关系、\n身份验证、家谱。",
    ),
    "chon_chat_empty_title": MessageLookupByLibrary.simpleMessage(
      "向 CHON AI 提问任何问题",
    ),
    "chon_chat_input_hint": MessageLookupByLibrary.simpleMessage("输入消息"),
    "chon_chat_title": MessageLookupByLibrary.simpleMessage("CHON AI"),
    "chon_contact_completed": MessageLookupByLibrary.simpleMessage("通话已结束。"),
    "chon_contact_connecting": MessageLookupByLibrary.simpleMessage("连接中…"),
    "chon_contact_failed": MessageLookupByLibrary.simpleMessage("无法连接。"),
    "chon_contact_idle_prompt": MessageLookupByLibrary.simpleMessage("请选择联系人。"),
    "chon_contact_title": MessageLookupByLibrary.simpleMessage("联系"),
    "chon_ft_empty": MessageLookupByLibrary.simpleMessage("暂无家庭信息。"),
    "chon_ft_title": MessageLookupByLibrary.simpleMessage("家谱"),
    "chon_home_banner": MessageLookupByLibrary.simpleMessage(
      "通过互相认证创建你的 CHON ID。",
    ),
    "chon_home_input_label": MessageLookupByLibrary.simpleMessage("输入信息"),
    "chon_home_mutual_subtitle": MessageLookupByLibrary.simpleMessage(
      "与家人、亲属\n互相确认",
    ),
    "chon_home_mutual_title": MessageLookupByLibrary.simpleMessage("互相认证"),
    "chon_home_q_contact": MessageLookupByLibrary.simpleMessage("联系\n(家谱)"),
    "chon_home_q_edit_profile": MessageLookupByLibrary.simpleMessage("编辑资料"),
    "chon_home_q_qr": MessageLookupByLibrary.simpleMessage("二维码"),
    "chon_home_q_support": MessageLookupByLibrary.simpleMessage("客服"),
    "chon_home_tutorial_card": MessageLookupByLibrary.simpleMessage(
      "CHON DID\n教程",
    ),
    "chon_id_gen_capture_back": MessageLookupByLibrary.simpleMessage(
      "将身份证背面对准指引框",
    ),
    "chon_id_gen_capture_front": MessageLookupByLibrary.simpleMessage(
      "将身份证正面对准指引框",
    ),
    "chon_id_gen_done": MessageLookupByLibrary.simpleMessage("CHON ID 已签发"),
    "chon_id_gen_err_required": MessageLookupByLibrary.simpleMessage("缺少必填信息。"),
    "chon_id_gen_field_address": MessageLookupByLibrary.simpleMessage("地址"),
    "chon_id_gen_field_authority": MessageLookupByLibrary.simpleMessage("签发机关"),
    "chon_id_gen_field_id": MessageLookupByLibrary.simpleMessage(
      "身份证号 / 外国人登记号",
    ),
    "chon_id_gen_field_id_label": MessageLookupByLibrary.simpleMessage("ID 编号"),
    "chon_id_gen_field_issued": MessageLookupByLibrary.simpleMessage("签发日期"),
    "chon_id_gen_field_name": MessageLookupByLibrary.simpleMessage("姓名"),
    "chon_id_gen_field_name_hint": MessageLookupByLibrary.simpleMessage(
      "身份证上的姓名",
    ),
    "chon_id_gen_intro_body": MessageLookupByLibrary.simpleMessage(
      "输入身份证信息并拍照,\n创建你的 CHON ID。",
    ),
    "chon_id_gen_intro_title": MessageLookupByLibrary.simpleMessage(
      "开始签发\n你的 CHON ID",
    ),
    "chon_id_gen_ocr_err": MessageLookupByLibrary.simpleMessage("无法识别身份证,请重拍。"),
    "chon_id_gen_ocr_no_result": MessageLookupByLibrary.simpleMessage(
      "无自动识别结果。",
    ),
    "chon_id_gen_ocr_title": MessageLookupByLibrary.simpleMessage("确认识别结果"),
    "chon_id_gen_pick_type": MessageLookupByLibrary.simpleMessage("请选择 ID 类型"),
    "chon_id_gen_prep_start": MessageLookupByLibrary.simpleMessage("开始拍摄"),
    "chon_id_gen_prep_tip1": MessageLookupByLibrary.simpleMessage("请在深色背景下拍摄。"),
    "chon_id_gen_prep_tip2": MessageLookupByLibrary.simpleMessage("请调整角度避免反光。"),
    "chon_id_gen_prep_tip3": MessageLookupByLibrary.simpleMessage(
      "将身份证放入指引框内。",
    ),
    "chon_id_gen_prep_title": MessageLookupByLibrary.simpleMessage("拍摄前请确认"),
    "chon_id_gen_reenter": MessageLookupByLibrary.simpleMessage("重新输入"),
    "chon_id_gen_review_finish": MessageLookupByLibrary.simpleMessage("签发"),
    "chon_id_gen_review_title": MessageLookupByLibrary.simpleMessage("确认后完成签发"),
    "chon_id_gen_title": MessageLookupByLibrary.simpleMessage("签发身份证"),
    "chon_id_gen_type_family": MessageLookupByLibrary.simpleMessage("家庭关系证明"),
    "chon_id_gen_type_resident": MessageLookupByLibrary.simpleMessage(
      "身份证 / 外国人登记证",
    ),
    "chon_id_gen_type_taekwondo": MessageLookupByLibrary.simpleMessage(
      "跆拳道段位证",
    ),
    "chon_id_gen_verified_fail": MessageLookupByLibrary.simpleMessage("无法验证"),
    "chon_id_gen_verified_ok": MessageLookupByLibrary.simpleMessage("已验证"),
    "chon_mauth_off_intro": MessageLookupByLibrary.simpleMessage(
      "在线下面对面\n互相验证 CHON ID。",
    ),
    "chon_mauth_off_my_qr": MessageLookupByLibrary.simpleMessage("我的二维码"),
    "chon_mauth_off_no_payload": MessageLookupByLibrary.simpleMessage(
      "此卡没有二维码信息。",
    ),
    "chon_mauth_off_scan": MessageLookupByLibrary.simpleMessage("扫描对方二维码"),
    "chon_mauth_off_scan_prompt": MessageLookupByLibrary.simpleMessage(
      "将二维码对准方框内。",
    ),
    "chon_mauth_off_scan_sub": MessageLookupByLibrary.simpleMessage(
      "用相机识别对方二维码。",
    ),
    "chon_mauth_off_scan_title": MessageLookupByLibrary.simpleMessage("扫描二维码"),
    "chon_mauth_off_show": MessageLookupByLibrary.simpleMessage("出示我的二维码"),
    "chon_mauth_off_show_prompt": MessageLookupByLibrary.simpleMessage(
      "请向对方出示此二维码。",
    ),
    "chon_mauth_off_show_sub": MessageLookupByLibrary.simpleMessage(
      "对方扫描我的二维码。",
    ),
    "chon_mauth_off_title": MessageLookupByLibrary.simpleMessage("线下互相认证"),
    "chon_mauth_off_verified": MessageLookupByLibrary.simpleMessage("已验证"),
    "chon_mauth_off_verifying": MessageLookupByLibrary.simpleMessage("验证中…"),
    "chon_mauth_rcv_anonymous": MessageLookupByLibrary.simpleMessage("匿名"),
    "chon_mauth_rcv_approved": MessageLookupByLibrary.simpleMessage("批准完成"),
    "chon_mauth_rcv_approving": MessageLookupByLibrary.simpleMessage("处理中…"),
    "chon_mauth_rcv_detail": MessageLookupByLibrary.simpleMessage("请求详情"),
    "chon_mauth_rcv_empty": MessageLookupByLibrary.simpleMessage("暂无请求。"),
    "chon_mauth_rcv_rejected": MessageLookupByLibrary.simpleMessage("拒绝完成"),
    "chon_mauth_rcv_rejecting": MessageLookupByLibrary.simpleMessage("处理中…"),
    "chon_mauth_rcv_title": MessageLookupByLibrary.simpleMessage("收到的请求"),
    "chon_mauth_req_approved": MessageLookupByLibrary.simpleMessage("已批准。"),
    "chon_mauth_req_awaiting": MessageLookupByLibrary.simpleMessage(
      "已发送。\n请等待对方回应。",
    ),
    "chon_mauth_req_confirm_q": MessageLookupByLibrary.simpleMessage("是这个人吗?"),
    "chon_mauth_req_done": MessageLookupByLibrary.simpleMessage("认证完成。"),
    "chon_mauth_req_err_notfound": MessageLookupByLibrary.simpleMessage(
      "未找到该用户。",
    ),
    "chon_mauth_req_err_phone": MessageLookupByLibrary.simpleMessage(
      "请输入电话号码。",
    ),
    "chon_mauth_req_phone_prompt": MessageLookupByLibrary.simpleMessage(
      "请输入要认证的\n家人电话号码。",
    ),
    "chon_mauth_req_rejected": MessageLookupByLibrary.simpleMessage("已拒绝。"),
    "chon_mauth_req_retry_msg": MessageLookupByLibrary.simpleMessage("请稍后再试。"),
    "chon_mauth_req_send": MessageLookupByLibrary.simpleMessage("发送请求"),
    "chon_mauth_req_sending": MessageLookupByLibrary.simpleMessage("正在发送…"),
    "chon_mauth_req_title": MessageLookupByLibrary.simpleMessage("互相认证"),
    "chon_nav_chon": MessageLookupByLibrary.simpleMessage("CHON"),
    "chon_nav_family_tree": MessageLookupByLibrary.simpleMessage("家谱"),
    "chon_nav_home": MessageLookupByLibrary.simpleMessage("首页"),
    "chon_nav_id_card": MessageLookupByLibrary.simpleMessage("身份证"),
    "chon_nav_mutual": MessageLookupByLibrary.simpleMessage("互认"),
    "chon_profile_edit_given": MessageLookupByLibrary.simpleMessage("名"),
    "chon_profile_edit_required": MessageLookupByLibrary.simpleMessage("必填项。"),
    "chon_profile_edit_surname": MessageLookupByLibrary.simpleMessage("姓"),
    "chon_profile_edit_title": MessageLookupByLibrary.simpleMessage("编辑资料"),
    "chon_report_empty": MessageLookupByLibrary.simpleMessage("暂无报告。"),
    "chon_report_err_required": MessageLookupByLibrary.simpleMessage(
      "请输入标题和内容。",
    ),
    "chon_report_failed": MessageLookupByLibrary.simpleMessage("发送失败。"),
    "chon_report_field_content": MessageLookupByLibrary.simpleMessage("内容"),
    "chon_report_field_content_hint": MessageLookupByLibrary.simpleMessage(
      "请详细描述问题。",
    ),
    "chon_report_field_title": MessageLookupByLibrary.simpleMessage("标题"),
    "chon_report_field_title_hint": MessageLookupByLibrary.simpleMessage(
      "请输入报告标题。",
    ),
    "chon_report_new": MessageLookupByLibrary.simpleMessage("新报告"),
    "chon_report_sending": MessageLookupByLibrary.simpleMessage("正在提交…"),
    "chon_report_submitted": MessageLookupByLibrary.simpleMessage("已收到您的报告。"),
    "chon_report_submitted_sub": MessageLookupByLibrary.simpleMessage(
      "确认后我们会尽快回复。",
    ),
    "chon_report_title": MessageLookupByLibrary.simpleMessage("问题反馈"),
    "chon_tutorial_s1_body": MessageLookupByLibrary.simpleMessage(
      "请家人为你的身份背书,\n在需要的地方完成验证。",
    ),
    "chon_tutorial_s1_title": MessageLookupByLibrary.simpleMessage(
      "用 CHON DID\n验证自己",
    ),
    "chon_tutorial_s2_body": MessageLookupByLibrary.simpleMessage(
      "与家人互相认证\n以证明你们的关系。",
    ),
    "chon_tutorial_s2_title": MessageLookupByLibrary.simpleMessage("互相认证"),
    "chon_tutorial_s3_body": MessageLookupByLibrary.simpleMessage(
      "可视化家庭关系\n安全保管家谱。",
    ),
    "chon_tutorial_s3_title": MessageLookupByLibrary.simpleMessage(
      "与家人一起\n绘制家谱",
    ),
    "chon_tutorial_s4_body": MessageLookupByLibrary.simpleMessage(
      "已完成设置。\n立即开始使用。",
    ),
    "chon_tutorial_s4_title": MessageLookupByLibrary.simpleMessage(
      "准备好\n开始使用 CHON 了吗?",
    ),
    "clan": MessageLookupByLibrary.simpleMessage("姓氏"),
    "clanOfCertificate": MessageLookupByLibrary.simpleMessage("宗族证书"),
    "close": MessageLookupByLibrary.simpleMessage("关闭"),
    "coating": MessageLookupByLibrary.simpleMessage("宗族"),
    "confirm": MessageLookupByLibrary.simpleMessage("确认"),
    "confirmCheckInOut": MessageLookupByLibrary.simpleMessage(
      "您要进行\n签到 / 签退吗？",
    ),
    "confirmDelete": MessageLookupByLibrary.simpleMessage("确定要删除吗？"),
    "confirmRelationSuffix": m0,
    "confirmed": MessageLookupByLibrary.simpleMessage("已确认"),
    "connect": MessageLookupByLibrary.simpleMessage("连接"),
    "connectionError": MessageLookupByLibrary.simpleMessage("连接错误，请重试"),
    "connectionInterrupted": MessageLookupByLibrary.simpleMessage("连接中断，请重试"),
    "contactAction": MessageLookupByLibrary.simpleMessage("联系"),
    "copied": MessageLookupByLibrary.simpleMessage("已复制"),
    "copy": MessageLookupByLibrary.simpleMessage("复制"),
    "copyIdLink": MessageLookupByLibrary.simpleMessage("请复制 ID 链接以提交"),
    "copyLink": MessageLookupByLibrary.simpleMessage("复制链接"),
    "copyVerificationLink": MessageLookupByLibrary.simpleMessage("复制认证链接"),
    "count": MessageLookupByLibrary.simpleMessage("世"),
    "cousin": MessageLookupByLibrary.simpleMessage("堂表兄弟姐妹"),
    "cousin_brother": MessageLookupByLibrary.simpleMessage("堂表兄弟"),
    "cousin_brother_in_law": MessageLookupByLibrary.simpleMessage("堂表姐夫/妹夫"),
    "cousin_sister": MessageLookupByLibrary.simpleMessage("堂表姐妹"),
    "cousin_sister_in_law": MessageLookupByLibrary.simpleMessage("堂表嫂/弟妹"),
    "cousins_child": MessageLookupByLibrary.simpleMessage("堂表侄/甥"),
    "cousins_childs_child": MessageLookupByLibrary.simpleMessage("堂表侄孙/甥孙"),
    "create": MessageLookupByLibrary.simpleMessage("创建"),
    "createSelfId": MessageLookupByLibrary.simpleMessage("创建 SelfID"),
    "createSelfIdTitle": MessageLookupByLibrary.simpleMessage(
      "创建 Self ID (身份证)",
    ),
    "dateOfIssue": MessageLookupByLibrary.simpleMessage("签发日期"),
    "daughter": MessageLookupByLibrary.simpleMessage("女儿"),
    "daughter2": MessageLookupByLibrary.simpleMessage("女"),
    "daughterInLaw": MessageLookupByLibrary.simpleMessage("儿媳"),
    "delete": MessageLookupByLibrary.simpleMessage("删除"),
    "driverLicense": MessageLookupByLibrary.simpleMessage("驾驶证"),
    "duplicateNameSelectNumber": MessageLookupByLibrary.simpleMessage(
      "存在重名。请选择序号。",
    ),
    "editProfile": MessageLookupByLibrary.simpleMessage("编辑资料"),
    "elder_brother": MessageLookupByLibrary.simpleMessage("兄"),
    "elder_sister": MessageLookupByLibrary.simpleMessage("姐"),
    "emailExists": MessageLookupByLibrary.simpleMessage("该邮箱已被注册"),
    "emailFormat": MessageLookupByLibrary.simpleMessage("邮箱格式不正确"),
    "emailLabel": MessageLookupByLibrary.simpleMessage("邮箱"),
    "emailRequired": MessageLookupByLibrary.simpleMessage("请输入您的邮箱"),
    "english": MessageLookupByLibrary.simpleMessage("英语"),
    "enter": MessageLookupByLibrary.simpleMessage("输入"),
    "enterAccountNumber": MessageLookupByLibrary.simpleMessage("输入账号"),
    "enterInfoForIdCreation": MessageLookupByLibrary.simpleMessage(
      "请输入创建 ID 所需的\n个人信息",
    ),
    "enterNameAndRelationship": MessageLookupByLibrary.simpleMessage(
      "请输入姓名并\n设置“关系”",
    ),
    "enterWithoutHyphen": MessageLookupByLibrary.simpleMessage("请输入（无需连字符）"),
    "error": MessageLookupByLibrary.simpleMessage("错误"),
    "errorPageNotLoading": MessageLookupByLibrary.simpleMessage("页面无法加载"),
    "family": MessageLookupByLibrary.simpleMessage("家族"),
    "familyCertificate": MessageLookupByLibrary.simpleMessage("家庭证"),
    "familyEditInstruction": MessageLookupByLibrary.simpleMessage(
      "点击家庭图标并按下“添加/删除”按钮即可编辑。",
    ),
    "familyTree": MessageLookupByLibrary.simpleMessage("家谱"),
    "father": MessageLookupByLibrary.simpleMessage("父亲"),
    "father_2": MessageLookupByLibrary.simpleMessage("父"),
    "female": MessageLookupByLibrary.simpleMessage("女"),
    "field_given_name": MessageLookupByLibrary.simpleMessage("名"),
    "field_surname": MessageLookupByLibrary.simpleMessage("姓"),
    "fillAllRequiredFields": MessageLookupByLibrary.simpleMessage("请填写所有必填项"),
    "finishSigup": MessageLookupByLibrary.simpleMessage("注册已完成！"),
    "firstTimeChon": MessageLookupByLibrary.simpleMessage("初次使用 Chon？\n立即创建"),
    "gender": MessageLookupByLibrary.simpleMessage("性别"),
    "goToHome": MessageLookupByLibrary.simpleMessage("返回首页"),
    "grandfather": MessageLookupByLibrary.simpleMessage("祖父"),
    "grandmother": MessageLookupByLibrary.simpleMessage("祖母"),
    "greenOnion": MessageLookupByLibrary.simpleMessage("派 (支派)"),
    "groupCall": MessageLookupByLibrary.simpleMessage("群组通话"),
    "groupChat": MessageLookupByLibrary.simpleMessage("群组聊天"),
    "guidanceAndAgreement": MessageLookupByLibrary.simpleMessage("指南与同意"),
    "hello": MessageLookupByLibrary.simpleMessage("你好"),
    "hint_ask_anything": MessageLookupByLibrary.simpleMessage("有什么可以帮您？"),
    "hint_select_contact": MessageLookupByLibrary.simpleMessage("请选择联系人"),
    "history": MessageLookupByLibrary.simpleMessage("历史记录"),
    "home": MessageLookupByLibrary.simpleMessage("首页"),
    "howCanIhelpYou": MessageLookupByLibrary.simpleMessage("有什么可以帮您？"),
    "howToCreateSelfId": MessageLookupByLibrary.simpleMessage(
      "您希望通过哪种方式\n创建 Self ID (身份证明)？",
    ),
    "husband": MessageLookupByLibrary.simpleMessage("丈夫"),
    "idCardAreaGuide": MessageLookupByLibrary.simpleMessage("请将证件放入框内。"),
    "idCardTypes": MessageLookupByLibrary.simpleMessage("电子身份证、居民身份证、驾驶证"),
    "idCheckCompleted": MessageLookupByLibrary.simpleMessage("ID (证件) 检查\n已完成"),
    "idList": MessageLookupByLibrary.simpleMessage("ID 列表"),
    "idNumber": MessageLookupByLibrary.simpleMessage("ID号码"),
    "idVerificationCompleted": MessageLookupByLibrary.simpleMessage(
      "证件验证\n已完成",
    ),
    "identityCard": MessageLookupByLibrary.simpleMessage("身份证"),
    "image": MessageLookupByLibrary.simpleMessage("照片"),
    "infoRequired": MessageLookupByLibrary.simpleMessage("请输入信息"),
    "info_account_holder": m1,
    "info_issued_date": m2,
    "information": MessageLookupByLibrary.simpleMessage("信息"),
    "inputInfoTitle": MessageLookupByLibrary.simpleMessage("输入信息"),
    "inquiryTitle": MessageLookupByLibrary.simpleMessage("咨询"),
    "issueNumber": MessageLookupByLibrary.simpleMessage("。请确认。"),
    "issued": MessageLookupByLibrary.simpleMessage("已签发"),
    "issuedDate": MessageLookupByLibrary.simpleMessage("签发日期"),
    "issuer": MessageLookupByLibrary.simpleMessage("签发机构"),
    "korean": MessageLookupByLibrary.simpleMessage("韩语"),
    "label_aptitude_test": MessageLookupByLibrary.simpleMessage("适应性测试"),
    "label_content": MessageLookupByLibrary.simpleMessage("内容"),
    "label_expiration_date": MessageLookupByLibrary.simpleMessage("过期日期"),
    "label_license_number": MessageLookupByLibrary.simpleMessage("执照号码"),
    "language": MessageLookupByLibrary.simpleMessage("语言"),
    "languageOption": MessageLookupByLibrary.simpleMessage("语言"),
    "level": MessageLookupByLibrary.simpleMessage("段"),
    "levelNumber": MessageLookupByLibrary.simpleMessage("段位号"),
    "like": MessageLookupByLibrary.simpleMessage("号 (别号)"),
    "little_brother": MessageLookupByLibrary.simpleMessage("弟"),
    "little_sister": MessageLookupByLibrary.simpleMessage("妹"),
    "logOut": MessageLookupByLibrary.simpleMessage("退出登录"),
    "loginSessionExpired": MessageLookupByLibrary.simpleMessage("登录会话已过期"),
    "makeCall": MessageLookupByLibrary.simpleMessage("拨打电话"),
    "male": MessageLookupByLibrary.simpleMessage("男"),
    "manualInput": MessageLookupByLibrary.simpleMessage("手动输入"),
    "maternalGrandfather": MessageLookupByLibrary.simpleMessage("外祖父"),
    "maternalGrandmother": MessageLookupByLibrary.simpleMessage("外祖母"),
    "membershipCard": MessageLookupByLibrary.simpleMessage("会员卡"),
    "menuTitle": MessageLookupByLibrary.simpleMessage("菜单"),
    "message": MessageLookupByLibrary.simpleMessage("消息"),
    "mobileNumber": MessageLookupByLibrary.simpleMessage("手机号码"),
    "mobilePhoneNumber": MessageLookupByLibrary.simpleMessage("手机号码"),
    "mother": MessageLookupByLibrary.simpleMessage("母亲"),
    "mother_2": MessageLookupByLibrary.simpleMessage("母"),
    "mutualAuthDesc": MessageLookupByLibrary.simpleMessage("与家人、亲戚、朋友\n互相确认身份"),
    "mutualAuthTitle": MessageLookupByLibrary.simpleMessage("相互认证"),
    "mutualAuthentication": MessageLookupByLibrary.simpleMessage("相互认证"),
    "myInfo": MessageLookupByLibrary.simpleMessage("我的信息"),
    "myInformation": MessageLookupByLibrary.simpleMessage("我的信息"),
    "myReportHistoryTitle": MessageLookupByLibrary.simpleMessage("我的举报记录"),
    "name": MessageLookupByLibrary.simpleMessage("姓名"),
    "nameLabel": MessageLookupByLibrary.simpleMessage("姓名"),
    "nationality": MessageLookupByLibrary.simpleMessage("国籍"),
    "nephew": MessageLookupByLibrary.simpleMessage("孙子"),
    "nephewInLaw": MessageLookupByLibrary.simpleMessage("侄女婿"),
    "next": MessageLookupByLibrary.simpleMessage("下一步"),
    "niece": MessageLookupByLibrary.simpleMessage("孙女"),
    "nieceInLaw": MessageLookupByLibrary.simpleMessage("侄媳妇"),
    "niece_nephew": MessageLookupByLibrary.simpleMessage("侄子/外甥"),
    "noCard": MessageLookupByLibrary.simpleMessage("当前无ID"),
    "noCardsFound": MessageLookupByLibrary.simpleMessage("暂无卡片"),
    "noContact": MessageLookupByLibrary.simpleMessage("未找到联系方式。"),
    "noRequest": MessageLookupByLibrary.simpleMessage("无认证请求。"),
    "origin": MessageLookupByLibrary.simpleMessage("本贯 (籍贯)"),
    "other": MessageLookupByLibrary.simpleMessage("其他"),
    "other_grand": MessageLookupByLibrary.simpleMessage("侄孙"),
    "otpRequired": MessageLookupByLibrary.simpleMessage("请输入发送到邮箱的4位验证码"),
    "ownedIdList": MessageLookupByLibrary.simpleMessage("已拥有的 ID 列表"),
    "ownerName": m3,
    "pa": MessageLookupByLibrary.simpleMessage("派"),
    "passport": MessageLookupByLibrary.simpleMessage("护照"),
    "password": MessageLookupByLibrary.simpleMessage("密码"),
    "passwordMatching": MessageLookupByLibrary.simpleMessage("密码一致"),
    "passwordRequired": MessageLookupByLibrary.simpleMessage("请输入您要使用的密码"),
    "personToVerify": MessageLookupByLibrary.simpleMessage("我需要认证的人"),
    "personalInfo": MessageLookupByLibrary.simpleMessage("个人信息"),
    "phoneNotMatch": MessageLookupByLibrary.simpleMessage("手机号码不匹配。"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("电话号码"),
    "phoneNumberLabel": MessageLookupByLibrary.simpleMessage("电话号码"),
    "pleaseAddVerifier": MessageLookupByLibrary.simpleMessage("请至少添加一名验证人"),
    "pleaseCreateCertificate": MessageLookupByLibrary.simpleMessage(
      "请创建证书以继续。",
    ),
    "pleaseEnter": MessageLookupByLibrary.simpleMessage("请输入"),
    "pleaseEnterAccount": MessageLookupByLibrary.simpleMessage("请输入账号"),
    "pleaseEnterPassword": MessageLookupByLibrary.simpleMessage("请输入密码"),
    "pleaseEnterPhone": MessageLookupByLibrary.simpleMessage("请输入手机号码"),
    "pleaseEnterUsername": MessageLookupByLibrary.simpleMessage("请输入账号"),
    "pleaseFillAllFields": MessageLookupByLibrary.simpleMessage("请填写所有字段"),
    "pleaseRequestIdentityVerification": MessageLookupByLibrary.simpleMessage(
      "请请求下方申请人进行身份验证。",
    ),
    "pleaseSelectBank": MessageLookupByLibrary.simpleMessage("请选择银行"),
    "pleaseSelectIds": MessageLookupByLibrary.simpleMessage(
      "请从下方的ID中选择\n如果没有，请使用“消息”功能",
    ),
    "pleaseSelectIdsToSubmit": MessageLookupByLibrary.simpleMessage(
      "请选择要提交的ID",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("隐私政策"),
    "profile": MessageLookupByLibrary.simpleMessage("个人资料"),
    "qrCheckInOut": MessageLookupByLibrary.simpleMessage("QR 签到/签退"),
    "qrScanComplete": MessageLookupByLibrary.simpleMessage(
      "QR 扫描完成！\n请点击下方的连接",
    ),
    "qrScanOrUpload": MessageLookupByLibrary.simpleMessage("请扫描二维码或上传图片。"),
    "readAndAgree": MessageLookupByLibrary.simpleMessage("阅读并同意以下指南"),
    "redirectIdCreation": MessageLookupByLibrary.simpleMessage("跳转至ID创建步骤"),
    "refusal": MessageLookupByLibrary.simpleMessage("拒绝"),
    "refusalSuccess": MessageLookupByLibrary.simpleMessage("已拒绝"),
    "registerToFamilyTreeGuide": MessageLookupByLibrary.simpleMessage(
      "如果确认，此人将被登记到我的家谱中",
    ),
    "relationship": MessageLookupByLibrary.simpleMessage("关系"),
    "relatives": MessageLookupByLibrary.simpleMessage("亲属"),
    "reportContentLabel": MessageLookupByLibrary.simpleMessage("举报内容"),
    "reportProblem": MessageLookupByLibrary.simpleMessage("报告问题"),
    "reportProblemTitle": MessageLookupByLibrary.simpleMessage("报告问题"),
    "requestVerificationGuide": MessageLookupByLibrary.simpleMessage(
      "请向家人、亲戚或朋友\n请求验证\n(相互认证)",
    ),
    "requesterList": MessageLookupByLibrary.simpleMessage("申请人列表"),
    "requireBothUpAndLowerCase": MessageLookupByLibrary.simpleMessage(
      "包含大小写英文字母",
    ),
    "requireConfirmPassword": MessageLookupByLibrary.simpleMessage("请再次输入密码"),
    "requireSpecial": MessageLookupByLibrary.simpleMessage("包含特殊字符"),
    "requiredField": MessageLookupByLibrary.simpleMessage("必填"),
    "requiredFieldsNoticeHighlight": MessageLookupByLibrary.simpleMessage("必填"),
    "requiredFieldsNoticePrefix": MessageLookupByLibrary.simpleMessage(
      "所有空栏均为",
    ),
    "requiredFieldsNoticeSuffix": MessageLookupByLibrary.simpleMessage("项"),
    "resend": MessageLookupByLibrary.simpleMessage("重新发送"),
    "residenceCard": MessageLookupByLibrary.simpleMessage("居留证"),
    "residentNumber": MessageLookupByLibrary.simpleMessage("身份证号码"),
    "residentNumberFirstPartInvalid": MessageLookupByLibrary.simpleMessage(
      "身份证前6位必须正确 (YYMMDD)",
    ),
    "residentNumberSecondPartInvalid": MessageLookupByLibrary.simpleMessage(
      "身份证后7位必须正确",
    ),
    "ruler": MessageLookupByLibrary.simpleMessage("字 (表字)"),
    "save": MessageLookupByLibrary.simpleMessage("保存"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("扫描二维码"),
    "se": MessageLookupByLibrary.simpleMessage("世"),
    "select": MessageLookupByLibrary.simpleMessage("选择"),
    "selectCardType": MessageLookupByLibrary.simpleMessage("选择卡类型"),
    "selectFamilyRelationship": MessageLookupByLibrary.simpleMessage("请选择家庭关系"),
    "selectIdToSubmit": MessageLookupByLibrary.simpleMessage("请选择要提交的 ID (证件)"),
    "selectPortraitPhoto": MessageLookupByLibrary.simpleMessage("请选择肖像照片"),
    "self": MessageLookupByLibrary.simpleMessage("本人"),
    "self_id_created": MessageLookupByLibrary.simpleMessage("Self ID 已创建"),
    "sendButton": MessageLookupByLibrary.simpleMessage("发送"),
    "sendSms": MessageLookupByLibrary.simpleMessage("发送短信"),
    "sendTextMessage": MessageLookupByLibrary.simpleMessage("发送短信"),
    "serviceInterruption": MessageLookupByLibrary.simpleMessage("服务暂时中断"),
    "serviceTermsAddendumContent": MessageLookupByLibrary.simpleMessage(
      "1. 本条款自 [2026.02.01] 起施行。\n2. 本条款也适用于施行日前加入的会员（法律法规有限制的除外）。",
    ),
    "serviceTermsAddendumTitle": MessageLookupByLibrary.simpleMessage("附则"),
    "serviceTermsAgreeCheckbox": MessageLookupByLibrary.simpleMessage(
      "(本条) 同意使用条款",
    ),
    "serviceTermsArt10Content": MessageLookupByLibrary.simpleMessage(
      "用户不得进行以下行为：\n1. 盗用账户、盗用名义、冒充他人\n2. 发布违法信息、侵犯版权、淫秽/非法拍摄物相关行为\n3. 诱发服务或服务器过载或侵犯安全的行为\n4. 通过自动化手段未经授权收集/抓取/爬取（公司允许范围除外）\n5. 侵犯他人权利（肖像权、个人信息、名誉等）\n6. 其他违反法律法规或违背公序良俗的行为",
    ),
    "serviceTermsArt10Title": MessageLookupByLibrary.simpleMessage(
      "第10条（禁止行为）",
    ),
    "serviceTermsArt11Content": MessageLookupByLibrary.simpleMessage(
      "1. 会员违反本条款或运营政策时，公司可视违规程度采取警告、删除/屏蔽内容、限制功能、暂停使用、永久暂停使用（注销账户）等措施。\n2. 会员可随时通过服务内程序终止使用合同（注销会员）。\n3. 使用限制或终止后，根据相关法律法规及公司保管政策，部分信息可能会保存一定期限，具体遵循隐私政策。",
    ),
    "serviceTermsArt11Title": MessageLookupByLibrary.simpleMessage(
      "第11条（使用限制及合同终止）",
    ),
    "serviceTermsArt12Content": MessageLookupByLibrary.simpleMessage(
      "1. 付费服务的内容、资费、结算方式、提供期间、退款标准等遵循另行指南（服务画面/结算页面/退款政策）。\n2. 订阅型服务的自动续费、解约、退款条件可能同时适用结算手段及应用商店政策（如：App Store/Play Store）与公司政策。",
    ),
    "serviceTermsArt12Title": MessageLookupByLibrary.simpleMessage(
      "第12条（付费服务及结算）",
    ),
    "serviceTermsArt13Content": MessageLookupByLibrary.simpleMessage(
      "1. 因天灾、战争、停电、通信网故障、第三方服务故障等不可抗力导致无法提供服务时，公司不承担责任。\n2. 除非法律认定责任，公司对用户间纠纷、用户输入信息的准确性、相互认证结果的可靠性、内容的合法性不承担责任。\n3. 提供AI功能时，AI的输出仅供参考（可能存在错误），最终判断和责任由用户承担。",
    ),
    "serviceTermsArt13Title": MessageLookupByLibrary.simpleMessage(
      "第13条（免责及责任限制）",
    ),
    "serviceTermsArt14Content": MessageLookupByLibrary.simpleMessage(
      "1. 公司可通过会员注册的邮箱/手机号/App推送/服务内通知等合理方式进行通知。\n2. 因会员未保持联系方式最新导致未收到通知，由此产生的不利后果由会员承担。",
    ),
    "serviceTermsArt14Title": MessageLookupByLibrary.simpleMessage("第14条（通知）"),
    "serviceTermsArt15Content": MessageLookupByLibrary.simpleMessage(
      "关于个人信息的处理（收集、使用、提供、委托、销毁等）遵循隐私政策及相关同意程序。仅使用条款不代替个人信息同意。",
    ),
    "serviceTermsArt15Title": MessageLookupByLibrary.simpleMessage(
      "第15条（个人信息保护）",
    ),
    "serviceTermsArt16Content": MessageLookupByLibrary.simpleMessage(
      "1. 本条款根据大韩民国法律解释和适用。\n2. 关于服务使用发生纠纷时，优先通过当事人协商解决，协商不成时，首尔中央地方法院为专属管辖法院（或民事诉讼法上的管辖法院）。",
    ),
    "serviceTermsArt16Title": MessageLookupByLibrary.simpleMessage(
      "第16条（适用法律及管辖）",
    ),
    "serviceTermsArt1Content": MessageLookupByLibrary.simpleMessage(
      "本条款旨在规定公司与用户（包括会员）之间关于使用公司提供的Chon服务的权利、义务及责任事项、使用条件与程序以及其他必要事项。",
    ),
    "serviceTermsArt1Title": MessageLookupByLibrary.simpleMessage("第1条（目的）"),
    "serviceTermsArt2Content": MessageLookupByLibrary.simpleMessage(
      "1. 服务：指公司提供的Chon App/Web及相关各项服务。\n2. 用户：指访问服务并根据本条款使用公司提供服务的个人。\n3. 会员：指同意本条款、创建账户并使用服务的个人。\n4. 账户：指会员为识别身份及使用服务而设定的登录手段（邮箱/手机号/社交登录等）及其附带信息。\n5. 内容：指会员在服务内发布、注册、上传、传输的文字、图片、文档（含PDF）、链接、数据（含家谱/关系图/个人资料信息）及其他信息。\n6. 相互认证：指服务为确认和连接会员之间的特定关系（家人/朋友/组织等）而提供的认证程序或功能。\n7. 付费服务：指公司有偿提供的订阅、使用券、附加功能等（如适用）。",
    ),
    "serviceTermsArt2Title": MessageLookupByLibrary.simpleMessage("第2条（定义）"),
    "serviceTermsArt3Content": MessageLookupByLibrary.simpleMessage(
      "1. 本条款在服务画面（初始画面或连接画面）发布或以其他方式通知，并经会员同意后生效。\n2. 公司可在不违反相关法律法规的范围内修订本条款。\n3. 本条款未尽事宜及解释，遵循相关法律法规及公司另行制定的运营政策/指南、一般商业惯例。",
    ),
    "serviceTermsArt3Title": MessageLookupByLibrary.simpleMessage(
      "第3条（条款的效力及适用）",
    ),
    "serviceTermsArt4Content": MessageLookupByLibrary.simpleMessage(
      "1. 公司修订条款时，将在服务内公告生效日期、修订内容及修订理由。\n2. 对于重要变更或对用户不利的变更，公司将设定合理的期间（例如：至少30日前）进行公告，必要时进行单独通知。\n3. 不同意变更条款的会员，可在变更条款生效前终止使用合同（注销会员）。",
    ),
    "serviceTermsArt4Title": MessageLookupByLibrary.simpleMessage(
      "第4条（条款的变更及通知）",
    ),
    "serviceTermsArt5Content": MessageLookupByLibrary.simpleMessage(
      "1. 会员注册在用户同意条款并完成公司规定的程序（创建账户、实名认证等）后成立。\n2. 会员应保持账户信息的最新性，因提供虚假信息或盗用他人信息而产生的不利后果由会员承担。\n3. 会员有责任管理账户/密码（或认证手段），如怀疑被第三方使用，应立即通知公司。",
    ),
    "serviceTermsArt5Title": MessageLookupByLibrary.simpleMessage(
      "第5条（会员注册及账户管理）",
    ),
    "serviceTermsArt6Content": MessageLookupByLibrary.simpleMessage(
      "1. 未满14岁儿童的会员注册及个人信息相关程序遵循法定代理人同意等相关法律法规（根据服务政策可能限制注册）。\n2. 公司必要时可要求进行年龄验证或法定代理人同意。",
    ),
    "serviceTermsArt6Title": MessageLookupByLibrary.simpleMessage(
      "第6条（未成年人的使用）",
    ),
    "serviceTermsArt7Content": MessageLookupByLibrary.simpleMessage(
      "1. 公司可提供以下服务：\na. 基于相互认证的关系（家人/朋友/组织等）连接及管理功能\nb. 家谱/关系图创建、阅览、共享功能\nc. 个人资料/ID（身份/人脉）构成及显示功能\nd. 文档/图片上传及整理功能（含PDF）\ne. 基于AI的搜索/摘要/问答等附加功能（如适用）\n2. 公司可变更或中断全部或部分服务，并在重大变更或中断时提前公告。\n3. 公司可根据运营或技术需要进行维护，维护时间将在服务画面公告。",
    ),
    "serviceTermsArt7Title": MessageLookupByLibrary.simpleMessage(
      "第7条（服务提供及变更）",
    ),
    "serviceTermsArt8Content": MessageLookupByLibrary.simpleMessage(
      "1. 相互认证是辅助确认会员间关系的功能，公司不保证会员间实际关系的法律效力或真实性。\n2. 未经他人同意，会员不得输入或发布有关他人的敏感信息（如：身份证号等）。\n3. 关系数据（家谱/关系图）由会员输入及互动生成，由此产生的纠纷原则上由当事人之间解决。除非法律认定责任，公司无义务介入。",
    ),
    "serviceTermsArt8Title": MessageLookupByLibrary.simpleMessage(
      "第8条（相互认证及关系数据的特则）",
    ),
    "serviceTermsArt9Content": MessageLookupByLibrary.simpleMessage(
      "1. 内容的权利原则上归属于生成/注册该内容的会员。\n2. 会员授予公司非独家使用许可，允许公司在运营、提供、改进服务所需的范围内存储、复制、传输、转换（如：格式转换/搜索索引）及显示该内容。\n3. 会员保证对上传的文档、图片、文本等拥有合法权利或已获得使用许可。\n4. 公司如欲利用内容改进AI功能等，将履行相关法律法规要求的另行通知/同意程序（如必要）。",
    ),
    "serviceTermsArt9Title": MessageLookupByLibrary.simpleMessage(
      "第9条（内容的权利及使用许可）",
    ),
    "serviceTermsCompanyInfoContent": MessageLookupByLibrary.simpleMessage(
      "• 名称：Chon Inc.\n• 代表人：Shin Geun-young\n• 注册号：196-86-03544\n• 地址：309, 3F, 464 Gangnam-daero, Gangnam-gu, Seoul\n• 客服：010-3420-8691 / ops@chon.ai\n• CPO：Kim Nam-yul",
    ),
    "serviceTermsCompanyInfoTitle": MessageLookupByLibrary.simpleMessage(
      "公司信息",
    ),
    "serviceTermsHeaderContent": MessageLookupByLibrary.simpleMessage(
      "生效日期：2026.02.01\n版本：v1.0\n公司名称：Chon Inc. (“公司”)\n服务名称：Chon (“服务”)",
    ),
    "serviceTermsHeaderTitle": MessageLookupByLibrary.simpleMessage(
      "Chon 服务使用条款",
    ),
    "serviceTermsTitle": MessageLookupByLibrary.simpleMessage("Chon 使用条款"),
    "setting": MessageLookupByLibrary.simpleMessage("设置"),
    "settings": MessageLookupByLibrary.simpleMessage("设置"),
    "shootingGuide": MessageLookupByLibrary.simpleMessage(
      "请在深色背景下拍摄，调整角度以避免反光。",
    ),
    "siblings_brother_sister": MessageLookupByLibrary.simpleMessage("兄弟姐妹"),
    "siblings_child": MessageLookupByLibrary.simpleMessage("侄子/外甥"),
    "siblings_grand_child": MessageLookupByLibrary.simpleMessage("侄孙"),
    "signIn": MessageLookupByLibrary.simpleMessage("登录"),
    "signUp": MessageLookupByLibrary.simpleMessage("注册"),
    "sister": MessageLookupByLibrary.simpleMessage("姐妹"),
    "sister2": MessageLookupByLibrary.simpleMessage("姐妹"),
    "sister_in_law": MessageLookupByLibrary.simpleMessage("嫂子"),
    "son": MessageLookupByLibrary.simpleMessage("儿子"),
    "son2": MessageLookupByLibrary.simpleMessage("子"),
    "sonInLaw": MessageLookupByLibrary.simpleMessage("女婿"),
    "spouse": MessageLookupByLibrary.simpleMessage("配偶"),
    "subTier": MessageLookupByLibrary.simpleMessage("子级"),
    "subjectLabel": MessageLookupByLibrary.simpleMessage("标题"),
    "submit": MessageLookupByLibrary.simpleMessage("提交"),
    "success": MessageLookupByLibrary.simpleMessage("成功"),
    "surname": MessageLookupByLibrary.simpleMessage("姓"),
    "systemDefault": MessageLookupByLibrary.simpleMessage("系统默认"),
    "taekwondo": MessageLookupByLibrary.simpleMessage("跆拳道"),
    "taekwondoCertificate": MessageLookupByLibrary.simpleMessage("跆拳道证书"),
    "taekwondoOfCertificate": MessageLookupByLibrary.simpleMessage("跆拳道认证"),
    "termsAddendumContent": MessageLookupByLibrary.simpleMessage(
      "1. 本条款自 [2026.02.01] 起生效。\n2. 施行日前加入的会员也适用本条款。",
    ),
    "termsAddendumTitle": MessageLookupByLibrary.simpleMessage("附则"),
    "termsCheckboxMarketingOptional": MessageLookupByLibrary.simpleMessage(
      "(可选) 同意接收营销信息（邮件/短信/推送）",
    ),
    "termsCheckboxPrivacyRequired": MessageLookupByLibrary.simpleMessage(
      "(必选) 同意收集和使用个人信息",
    ),
    "termsCheckboxThirdPartyRequired": MessageLookupByLibrary.simpleMessage(
      "(必选) 同意向第三方提供个人信息（相互认证/家谱功能）",
    ),
    "termsConfirm": MessageLookupByLibrary.simpleMessage("确认"),
    "termsItemsContent": MessageLookupByLibrary.simpleMessage(
      "公司在服务所需的范围内收集以下信息：\n(A) 账户必需项目\n• 邮箱或手机号码\n• 密码（加密）或认证令牌\n• 显示名称（姓名/昵称）\n• 内部识别码 (UID)\n(B) 相互认证/家谱功能相关项目\n• 用户输入的关系信息\n• 认证信息（邀请码、令牌）\n• 公开的个人资料（照片、简介）\n(C) 自动收集项目\n• 访问日志、IP地址、设备信息、Cookie",
    ),
    "termsItemsTitle": MessageLookupByLibrary.simpleMessage("2) 收集与使用的个人信息项目"),
    "termsMainTitle": MessageLookupByLibrary.simpleMessage("Chon 使用条款"),
    "termsMarketingConsentDetailContent": MessageLookupByLibrary.simpleMessage(
      "不同意也可使用服务。\n• 目的：活动、促销、新功能通知\n• 项目：邮箱、手机号、推送令牌\n• 期间：直至撤回同意或注销",
    ),
    "termsMarketingConsentDetailTitle": MessageLookupByLibrary.simpleMessage(
      "[可选] 营销同意详情",
    ),
    "termsMarketingInfoContent": MessageLookupByLibrary.simpleMessage(
      "即使不同意此项，您仍可使用基本服务。\n生效日期：2026.02.01\n公司：Chon Inc.\n• 代表人：Shin Geun-young\n• 地址：309, 3F, 464 Gangnam-daero, Gangnam-gu, Seoul",
    ),
    "termsMarketingInfoTitle": MessageLookupByLibrary.simpleMessage(
      "5) 可选同意（营销）",
    ),
    "termsOfService": MessageLookupByLibrary.simpleMessage("使用条款"),
    "termsPrivacyConsentTitle": MessageLookupByLibrary.simpleMessage(
      "Chon 个人信息收集与使用同意书",
    ),
    "termsProvisionItemsContent": MessageLookupByLibrary.simpleMessage(
      "仅提供会员设置为公开/共享的信息：\n• 显示名称\n• 公开个人资料\n• 关系数据\n• 家谱数据\n※ 除非您主动共享，否则不会提供联系方式（电话/邮箱）。",
    ),
    "termsProvisionItemsTitle": MessageLookupByLibrary.simpleMessage("3) 提供项目"),
    "termsProvisionPurposeContent": MessageLookupByLibrary.simpleMessage(
      "• 执行相互认证及确认结果\n• 连接关系\n• 显示和阅览家谱",
    ),
    "termsProvisionPurposeTitle": MessageLookupByLibrary.simpleMessage(
      "2) 提供目的",
    ),
    "termsPurposeContent": MessageLookupByLibrary.simpleMessage(
      "Chon Inc.（以下简称“公司”）出于以下目的收集和使用个人信息：\n• 会员注册及账户管理（身份识别、实名认证、登录、防止欺诈）\n• 相互认证及关系（家人/朋友/组织等）连接、家谱创建与管理\n• 服务运营、安全保障、质量改进\n• 客户咨询与投诉处理",
    ),
    "termsPurposeTitle": MessageLookupByLibrary.simpleMessage("1) 收集与使用目的"),
    "termsRecipientContent": MessageLookupByLibrary.simpleMessage(
      "• 已建立相互认证的其他会员\n• 指定为家谱共享对象的会员",
    ),
    "termsRecipientRetentionContent": MessageLookupByLibrary.simpleMessage(
      "• 在关系连接或共享设置保持期间，接收方可以查阅和使用。\n• 如果关系被删除或取消共享，信息将停止显示。",
    ),
    "termsRecipientRetentionTitle": MessageLookupByLibrary.simpleMessage(
      "4) 接收方的保有期间",
    ),
    "termsRecipientTitle": MessageLookupByLibrary.simpleMessage("1) 接收方"),
    "termsRefusalContent": MessageLookupByLibrary.simpleMessage(
      "您有权拒绝同意。但如果拒绝必选项目，可能会限制服务使用（如注册、相互认证等）。",
    ),
    "termsRefusalTitle": MessageLookupByLibrary.simpleMessage("4) 拒绝权及不利影响"),
    "termsRetentionContent": MessageLookupByLibrary.simpleMessage(
      "原则上，个人信息将保留至会员注销为止。法律法规另有规定的除外。",
    ),
    "termsRetentionTitle": MessageLookupByLibrary.simpleMessage("3) 保有与使用期间"),
    "termsScrollDown": MessageLookupByLibrary.simpleMessage("向下滚动"),
    "termsThirdPartyContent": MessageLookupByLibrary.simpleMessage(
      "公司如下向第三方（包括其他会员）提供个人信息：",
    ),
    "termsThirdPartyRefusalContent": MessageLookupByLibrary.simpleMessage(
      "您可以拒绝向第三方提供信息。但这对于相互认证和家谱功能是必要的，拒绝将导致无法使用相关功能。",
    ),
    "termsThirdPartyRefusalTitle": MessageLookupByLibrary.simpleMessage(
      "5) 拒绝权（第三方提供）",
    ),
    "termsThirdPartyTitle": MessageLookupByLibrary.simpleMessage(
      "同意向第三方提供个人信息",
    ),
    "tier": MessageLookupByLibrary.simpleMessage("级"),
    "unVerifiedList": MessageLookupByLibrary.simpleMessage("未认证列表"),
    "uncle_aunt_husband": MessageLookupByLibrary.simpleMessage("姑父"),
    "uncle_father_older": MessageLookupByLibrary.simpleMessage("伯父"),
    "unverified": MessageLookupByLibrary.simpleMessage("未验证"),
    "update": MessageLookupByLibrary.simpleMessage("更新"),
    "updateFailed": MessageLookupByLibrary.simpleMessage("无法更新"),
    "uploadSizeLimitWarning": MessageLookupByLibrary.simpleMessage(
      "仅限上传300MB以下的文件。",
    ),
    "username": MessageLookupByLibrary.simpleMessage("账号"),
    "verificationPoint": MessageLookupByLibrary.simpleMessage("认证积分"),
    "verificationRequest": MessageLookupByLibrary.simpleMessage("认证请求"),
    "verificationRequestedBy": MessageLookupByLibrary.simpleMessage(
      "已发送\n确认请求",
    ),
    "verificationScore": MessageLookupByLibrary.simpleMessage("认证评分"),
    "verifiedList": MessageLookupByLibrary.simpleMessage("已认证列表"),
    "verifierForMe": MessageLookupByLibrary.simpleMessage("为我认证的人"),
    "verifyFinish": MessageLookupByLibrary.simpleMessage("双向认证已完成。"),
    "verifyRequest": MessageLookupByLibrary.simpleMessage("认证请求"),
    "verifycationRequest": MessageLookupByLibrary.simpleMessage("认证请求"),
    "viewFamilyTree": MessageLookupByLibrary.simpleMessage("查看家谱"),
    "visaType": MessageLookupByLibrary.simpleMessage("签证类型"),
    "wife": MessageLookupByLibrary.simpleMessage("妻子"),
  };
}
