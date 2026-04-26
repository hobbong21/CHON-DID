// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
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
  String get localeName => 'ja';

  static String m0(relation) => "様が${relation}です。\nご確認ください。";

  static String m1(account, name) => "${account} ${name}";

  static String m2(date) => "${date} 発行";

  static String m3(name) => "${name}, ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "AN_ERROR_HAS_OCCURRED": MessageLookupByLibrary.simpleMessage("エラーが発生しました"),
    "BANK_ACCOUNT_NOT_EXIST": MessageLookupByLibrary.simpleMessage(
      "このIDの銀行口座が見つかりません",
    ),
    "CARD_INFO_EXISTED": MessageLookupByLibrary.simpleMessage("カード情報は既に存在します"),
    "CARD_INFO_NOT_EXIST": MessageLookupByLibrary.simpleMessage(
      "このユーザーのカードが見つかりません",
    ),
    "CLAN_EXISTED": MessageLookupByLibrary.simpleMessage("クランは既に存在します"),
    "CLAN_NOT_EXISTED": MessageLookupByLibrary.simpleMessage("クランが存在しません"),
    "CONFIRM_DID_FAIL": MessageLookupByLibrary.simpleMessage("DIDの確認に失敗しました。"),
    "DATA_NOT_MATCH": MessageLookupByLibrary.simpleMessage("データが一致しません"),
    "DID_GENERATE_FAIL": MessageLookupByLibrary.simpleMessage(
      "公開鍵からDIDを生成できません。",
    ),
    "ENROLL_DID_FAIL": MessageLookupByLibrary.simpleMessage("DIDの登録に失敗しました。"),
    "EVENT_CERTIFICATE_INVALID": MessageLookupByLibrary.simpleMessage(
      "証明書が無効です",
    ),
    "EVENT_CERTIFICATE_IS_NOT_CONFIRMED": MessageLookupByLibrary.simpleMessage(
      "証明書が確認されていません",
    ),
    "EVENT_MUST_BE_CHECK_IN_BEFORE": MessageLookupByLibrary.simpleMessage(
      "イベントは事前にチェックインする必要があります",
    ),
    "EVENT_NOT_EXISTED": MessageLookupByLibrary.simpleMessage("イベントが存在しません"),
    "FAMILY_TREE_HAS_BEEN_INITIATED": MessageLookupByLibrary.simpleMessage(
      "家系図が開始されました。",
    ),
    "GENDER_INVALID": MessageLookupByLibrary.simpleMessage(
      "性別は「男性」または「女性」である必要があります",
    ),
    "GENDER_NOT_NULL": MessageLookupByLibrary.simpleMessage("性別は必須です"),
    "ID_NUMBER_EXIST": MessageLookupByLibrary.simpleMessage("ID番号は既に存在します"),
    "ID_NUMBER_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "ID番号は数字のみ使用できます",
    ),
    "ID_NUMBER_NOT_EXISTED": MessageLookupByLibrary.simpleMessage(
      "ID番号が存在しません",
    ),
    "ID_NUMBER_NOT_NULL": MessageLookupByLibrary.simpleMessage("ID番号は必須です"),
    "IMG_BASE64_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "画像は有効なBase64形式である必要があります",
    ),
    "IMG_BASE64_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "imgBase64は必須です",
    ),
    "INPUT_EMPTY": MessageLookupByLibrary.simpleMessage("入力が空です"),
    "INPUT_INVALID": MessageLookupByLibrary.simpleMessage("無効な入力です"),
    "INTEGRATION_DID_FAIL": MessageLookupByLibrary.simpleMessage(
      "DIDの統合に失敗しました。",
    ),
    "INVALID_TOKEN": MessageLookupByLibrary.simpleMessage("無効なトークン"),
    "ISSUED_DATE_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "発行日は yyyy-MM-dd 形式である必要があります",
    ),
    "ISSUED_DATE_NOT_NULL": MessageLookupByLibrary.simpleMessage("発行日は必須です"),
    "LOGIN_ERROR_01": MessageLookupByLibrary.simpleMessage("メールアドレスは既に存在します"),
    "MESSAGE_TOO_LONG": MessageLookupByLibrary.simpleMessage(
      "メッセージは2000文字以内である必要があります",
    ),
    "NATIONALITY_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "国籍は文字とスペースのみ使用できます",
    ),
    "NATIONALITY_NOT_NULL": MessageLookupByLibrary.simpleMessage("国籍は必須です"),
    "NOT_FOUND": MessageLookupByLibrary.simpleMessage("見つかりません"),
    "OTP_EXPIRED": MessageLookupByLibrary.simpleMessage("OTPの有効期限が切れています"),
    "PASSWORD_NOT_MATCH": MessageLookupByLibrary.simpleMessage("パスワードが一致しません"),
    "PASSWORD_OR_ACCOUNT_IN_ACTIVE": MessageLookupByLibrary.simpleMessage(
      "パスワードまたはアカウントが正しくありません",
    ),
    "PHONE_NUMBER_EXISTED": MessageLookupByLibrary.simpleMessage(
      "電話番号は既に存在します",
    ),
    "PHONE_NUMBER_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "電話番号は国番号＋スペース＋8〜12桁の数字である必要があります",
    ),
    "PHONE_NUMBER_NOT_EXIST": MessageLookupByLibrary.simpleMessage(
      "電話番号が存在しません",
    ),
    "PHONE_NUMBER_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "連絡先電話番号は必須です",
    ),
    "REF_VISA_TYPE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "ビザタイプは必須です",
    ),
    "REQUEST_TIMEOUT": MessageLookupByLibrary.simpleMessage("リクエストがタイムアウトしました"),
    "SHARE_LINK_ERROR": MessageLookupByLibrary.simpleMessage("共有リンク生成エラー"),
    "SUBMIT_DID_FAIL": MessageLookupByLibrary.simpleMessage("DIDの送信に失敗しました。"),
    "SYSTEM_ERROR": MessageLookupByLibrary.simpleMessage("システムエラー"),
    "TAEKWONDO_EXISTED": MessageLookupByLibrary.simpleMessage("テコンドーは既に存在します"),
    "TAEKWONDO_NOT_EXISTED": MessageLookupByLibrary.simpleMessage(
      "テコンドーが存在しません",
    ),
    "THE_CONNECTION_ERRORED": MessageLookupByLibrary.simpleMessage(
      "サーバーメンテナンス中です",
    ),
    "UNAUTHORIZED": MessageLookupByLibrary.simpleMessage("セッションの有効期限が切れました"),
    "UNKNOWN": MessageLookupByLibrary.simpleMessage("不明なエラー"),
    "VALIDATE_BANK_ACCOUNT_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "銀行口座は必須です",
    ),
    "VALIDATE_BANK_ID_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "銀行IDは必須です",
    ),
    "VALIDATE_BANK_REF_BANK_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "参照銀行は必須です",
    ),
    "VALIDATE_CARD_CARD_ID_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "カードIDは必須です",
    ),
    "VALIDATE_CLAN_BIRTH_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "出生地は必須です",
    ),
    "VALIDATE_CLAN_CLAN_NAME_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "クラン名は必須です",
    ),
    "VALIDATE_CLAN_IMAGE_BASE64_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "画像は有効なBase64形式で、サイズは10MB以下である必要があります",
        ),
    "VALIDATE_CLAN_IMAGE_BASE64_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "画像Base64は必須です",
    ),
    "VALIDATE_CLAN_ORIGIN_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "出身は必須です",
    ),
    "VALIDATE_CLAN_PA_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Paは必須です",
    ),
    "VALIDATE_CLAN_PERSONAL_NAME_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("個人名は必須です"),
    "VALIDATE_CLAN_PHONE_NUMBER_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "電話番号は国番号（例：+81, +84）の後にスペースと8〜12桁の数字が必要です",
        ),
    "VALIDATE_CLAN_PHONE_NUMBER_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "電話番号は必須です",
    ),
    "VALIDATE_CLAN_SE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Seは必須です",
    ),
    "VALIDATE_EVENT_ACTION_TYPE_INVALID": MessageLookupByLibrary.simpleMessage(
      "イベント操作タイプは1（チェックイン）または2（チェックアウト）である必要があります",
    ),
    "VALIDATE_EVENT_ID_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "イベントIDは必須です",
    ),
    "VALIDATE_PUBLIC_KEY_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "公開鍵は必須です",
    ),
    "VALIDATE_RAW_DATA_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Rawデータは必須です",
    ),
    "VALIDATE_SIGNATURE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "署名は必須です",
    ),
    "VALIDATE_TEAKWONDO_ID_NUMBER_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("ID番号は必須です"),
    "VALIDATE_TEAKWONDO_IMAGE_BASE64_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "画像は有効なBase64形式で、サイズは10MB以下である必要があります",
        ),
    "VALIDATE_TEAKWONDO_IMAGE_BASE64_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("画像Base64は必須です"),
    "VALIDATE_TEAKWONDO_ISSUE_DATE_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage("発行日は yyyy-MM-dd 形式である必要があります"),
    "VALIDATE_TEAKWONDO_ISSUE_DATE_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("発行日は必須です"),
    "VALIDATE_TEAKWONDO_LEVEL_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "レベルは必須です",
    ),
    "VALIDATE_TEAKWONDO_LEVEL_NUMBER_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("レベル番号は必須です"),
    "VALIDATE_TEAKWONDO_NAME_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "名前は必須です",
    ),
    "VALIDATE_TEAKWONDO_NATIONALY_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("国籍は必須です"),
    "VERIFIED": MessageLookupByLibrary.simpleMessage("連絡先が確認されました"),
    "VERIFY_CONTACT_NOT_EXIST": MessageLookupByLibrary.simpleMessage(
      "連絡先が存在しません",
    ),
    "VERIFY_ERROR": MessageLookupByLibrary.simpleMessage("OTP認証エラー"),
    "account": MessageLookupByLibrary.simpleMessage("ID (メールアドレス)"),
    "accountInfoError": MessageLookupByLibrary.simpleMessage(
      "口座情報に誤りがあります。入力内容を確認してください。",
    ),
    "accountList": MessageLookupByLibrary.simpleMessage("口座リスト"),
    "accountRegisted": MessageLookupByLibrary.simpleMessage("口座が登録されました！"),
    "accountRegistration": MessageLookupByLibrary.simpleMessage("口座登録"),
    "accountRegistrationTerms": MessageLookupByLibrary.simpleMessage(
      "目的：会費・精算のための決済専用口座の登録\n\n本サービスは、利用者の正常な会費納付および精算手続きを行うために、銀行口座情報を登録し検証するプロセスを含みます。\n入力された情報は本人確認および精算処理のための必須項目であり、以下の目的に従って使用されます。\n\n1. 本人確認および実名認証\n利用者が本人名義の口座を登録したかを確認するため、金融機関を通じた実名認証手続きが行われます。これにより、他人名義の口座の不正使用や誤送金などの事故を防止します。\n\n2. 会費納付および精算処理\nサービス利用中に発生する会費、精算金、報奨金などの金銭取引を正確かつ安全に処理するために口座情報を活用します。精算過程で発生する入出金明細は利用者に透明に通知されます。\n\n3. 金融情報の最小限の収集および保管\n本サービスは精算目的に必要な最小限の金融情報のみを収集・利用し、法令で定められた期間のみ保管します。保管期間が経過した情報は、安全な手順を経て直ちに破棄されます。\n\n4. 法令遵守および紛争対応\n金融取引関連法令に基づき、取引記録および口座情報は税務・監査・紛争解決などの目的で関係機関に提出される場合があります。この場合でも、法的根拠がない限り第三者に任意提供されることはありません。\n\n収集されたすべての情報は「個人情報保護法」および関連規定に従い暗号化され、安全に管理されます。\nまた、利用者はいつでも情報提供への同意を撤回できますが、撤回した場合、その後の精算サービスの利用が制限される場合があります。",
    ),
    "accountVerificationCompleted": MessageLookupByLibrary.simpleMessage(
      "口座確認が\n完了しました",
    ),
    "achievements": MessageLookupByLibrary.simpleMessage("業績"),
    "action_delete": MessageLookupByLibrary.simpleMessage("削除"),
    "action_ok": MessageLookupByLibrary.simpleMessage("OK"),
    "action_select": MessageLookupByLibrary.simpleMessage("選択"),
    "add": MessageLookupByLibrary.simpleMessage("追加"),
    "addNewAccount": MessageLookupByLibrary.simpleMessage("新しい口座を追加"),
    "address": MessageLookupByLibrary.simpleMessage("住所"),
    "agreeAccountRealName": MessageLookupByLibrary.simpleMessage(
      "(必須) 口座実名照会への同意",
    ),
    "agreeAll": MessageLookupByLibrary.simpleMessage("すべての項目に同意する"),
    "agreeAndContinue": MessageLookupByLibrary.simpleMessage("同意して続ける"),
    "agreeFinancialInfoCollection": MessageLookupByLibrary.simpleMessage(
      "(必須) 金融情報の最小限の収集・保管",
    ),
    "agreeNotification": MessageLookupByLibrary.simpleMessage(
      "(任意) 領収書/精算通知の受信 (プッシュ/メール)",
    ),
    "album": MessageLookupByLibrary.simpleMessage("アルバム"),
    "appLanguage": MessageLookupByLibrary.simpleMessage("アプリの言語"),
    "approval": MessageLookupByLibrary.simpleMessage("承認"),
    "approvalSuccess": MessageLookupByLibrary.simpleMessage("承認しました"),
    "askForAnything": MessageLookupByLibrary.simpleMessage("何でも聞いてください"),
    "attachmentLabel": MessageLookupByLibrary.simpleMessage("添付ファイル"),
    "aunt_father_sister": MessageLookupByLibrary.simpleMessage("叔母/伯母"),
    "aunt_uncle_wife": MessageLookupByLibrary.simpleMessage("伯母"),
    "authRejected": MessageLookupByLibrary.simpleMessage("相互認証を拒否しました"),
    "authentication": MessageLookupByLibrary.simpleMessage("認証"),
    "authenticationRequest": MessageLookupByLibrary.simpleMessage(
      "受信した相互認証\nリクエスト一覧です",
    ),
    "back": MessageLookupByLibrary.simpleMessage("戻る"),
    "bankAccount": MessageLookupByLibrary.simpleMessage("銀行口座"),
    "bankAccountNumber": MessageLookupByLibrary.simpleMessage("銀行口座番号"),
    "bankInfo": MessageLookupByLibrary.simpleMessage("銀行情報"),
    "birth": MessageLookupByLibrary.simpleMessage("生年月日"),
    "birthYearSuffix": MessageLookupByLibrary.simpleMessage("年生まれ"),
    "blockHash": MessageLookupByLibrary.simpleMessage("ブロックハッシュ"),
    "brother": MessageLookupByLibrary.simpleMessage("男兄弟"),
    "brother2": MessageLookupByLibrary.simpleMessage("兄弟"),
    "brother_in_law": MessageLookupByLibrary.simpleMessage("義兄"),
    "cameraNotInitialized": MessageLookupByLibrary.simpleMessage(
      "カメラが初期化されていません",
    ),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "カメラへのアクセス権限が必要です",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("キャンセル"),
    "captureIdCard": MessageLookupByLibrary.simpleMessage("身分証を撮影"),
    "certification": MessageLookupByLibrary.simpleMessage("証明書"),
    "certifierList": MessageLookupByLibrary.simpleMessage("認証者リスト"),
    "change": MessageLookupByLibrary.simpleMessage("変更"),
    "changePhoneSuccess": MessageLookupByLibrary.simpleMessage(
      "電話番号の変更に成功しました",
    ),
    "char": MessageLookupByLibrary.simpleMessage("文字"),
    "chat": MessageLookupByLibrary.simpleMessage("チャット"),
    "checkAccount": MessageLookupByLibrary.simpleMessage("口座確認"),
    "checkIn": MessageLookupByLibrary.simpleMessage("チェックイン"),
    "checkInConfirmed": MessageLookupByLibrary.simpleMessage(
      "チェックインが\n確認されました",
    ),
    "checkOriginal": MessageLookupByLibrary.simpleMessage("原本確認"),
    "checkOut": MessageLookupByLibrary.simpleMessage("チェックアウト"),
    "checkOutConfirmed": MessageLookupByLibrary.simpleMessage("チェックアウト\n完了"),
    "children": MessageLookupByLibrary.simpleMessage("子供"),
    "chon_action_approve": MessageLookupByLibrary.simpleMessage("承認"),
    "chon_action_attach": MessageLookupByLibrary.simpleMessage("ファイル添付"),
    "chon_action_attached": MessageLookupByLibrary.simpleMessage("添付済み"),
    "chon_action_back": MessageLookupByLibrary.simpleMessage("戻る"),
    "chon_action_close": MessageLookupByLibrary.simpleMessage("閉じる"),
    "chon_action_confirm": MessageLookupByLibrary.simpleMessage("確認"),
    "chon_action_continue": MessageLookupByLibrary.simpleMessage("続ける"),
    "chon_action_finish": MessageLookupByLibrary.simpleMessage("完了"),
    "chon_action_next": MessageLookupByLibrary.simpleMessage("次へ"),
    "chon_action_recapture": MessageLookupByLibrary.simpleMessage("撮り直す"),
    "chon_action_reject": MessageLookupByLibrary.simpleMessage("拒否"),
    "chon_action_retry": MessageLookupByLibrary.simpleMessage("再試行"),
    "chon_action_save": MessageLookupByLibrary.simpleMessage("保存"),
    "chon_action_search_again": MessageLookupByLibrary.simpleMessage("再検索"),
    "chon_action_send": MessageLookupByLibrary.simpleMessage("送信"),
    "chon_action_skip": MessageLookupByLibrary.simpleMessage("スキップ"),
    "chon_action_start": MessageLookupByLibrary.simpleMessage("始める"),
    "chon_chat_empty_body": MessageLookupByLibrary.simpleMessage(
      "家族関係、本人確認、家系図について\n質問してください。",
    ),
    "chon_chat_empty_title": MessageLookupByLibrary.simpleMessage(
      "CHON AIに何でも聞いてください",
    ),
    "chon_chat_input_hint": MessageLookupByLibrary.simpleMessage("メッセージを入力"),
    "chon_chat_title": MessageLookupByLibrary.simpleMessage("CHON AI"),
    "chon_contact_completed": MessageLookupByLibrary.simpleMessage(
      "通話が終了しました。",
    ),
    "chon_contact_connecting": MessageLookupByLibrary.simpleMessage("接続中…"),
    "chon_contact_failed": MessageLookupByLibrary.simpleMessage("接続できません。"),
    "chon_contact_idle_prompt": MessageLookupByLibrary.simpleMessage(
      "連絡する家族を選択してください。",
    ),
    "chon_contact_title": MessageLookupByLibrary.simpleMessage("連絡"),
    "chon_ft_empty": MessageLookupByLibrary.simpleMessage("家族情報がありません。"),
    "chon_ft_title": MessageLookupByLibrary.simpleMessage("家系図"),
    "chon_home_banner": MessageLookupByLibrary.simpleMessage(
      "相互認証でCHON IDを作成しましょう。",
    ),
    "chon_home_input_label": MessageLookupByLibrary.simpleMessage("入力情報"),
    "chon_home_mutual_subtitle": MessageLookupByLibrary.simpleMessage(
      "家族・親族と\n相互確認",
    ),
    "chon_home_mutual_title": MessageLookupByLibrary.simpleMessage("相互認証"),
    "chon_home_q_contact": MessageLookupByLibrary.simpleMessage("連絡\n(家系図)"),
    "chon_home_q_edit_profile": MessageLookupByLibrary.simpleMessage(
      "プロフィール編集",
    ),
    "chon_home_q_qr": MessageLookupByLibrary.simpleMessage("QRコード"),
    "chon_home_q_support": MessageLookupByLibrary.simpleMessage("サポート"),
    "chon_home_tutorial_card": MessageLookupByLibrary.simpleMessage(
      "CHON DID\nチュートリアル",
    ),
    "chon_id_gen_capture_back": MessageLookupByLibrary.simpleMessage(
      "身分証の裏面をガイド内に合わせてください",
    ),
    "chon_id_gen_capture_front": MessageLookupByLibrary.simpleMessage(
      "身分証の表面をガイド内に合わせてください",
    ),
    "chon_id_gen_done": MessageLookupByLibrary.simpleMessage("CHON IDが発行されました"),
    "chon_id_gen_err_required": MessageLookupByLibrary.simpleMessage(
      "必須情報が不足しています。",
    ),
    "chon_id_gen_field_address": MessageLookupByLibrary.simpleMessage("住所"),
    "chon_id_gen_field_authority": MessageLookupByLibrary.simpleMessage("発行機関"),
    "chon_id_gen_field_id": MessageLookupByLibrary.simpleMessage(
      "住民登録番号/外国人登録番号",
    ),
    "chon_id_gen_field_id_label": MessageLookupByLibrary.simpleMessage("ID番号"),
    "chon_id_gen_field_issued": MessageLookupByLibrary.simpleMessage("発行日"),
    "chon_id_gen_field_name": MessageLookupByLibrary.simpleMessage("氏名"),
    "chon_id_gen_field_name_hint": MessageLookupByLibrary.simpleMessage(
      "身分証上の氏名",
    ),
    "chon_id_gen_intro_body": MessageLookupByLibrary.simpleMessage(
      "身分証情報の入力と撮影で\nCHON IDを作成しましょう。",
    ),
    "chon_id_gen_intro_title": MessageLookupByLibrary.simpleMessage(
      "CHON IDの発行を\n始めましょう",
    ),
    "chon_id_gen_ocr_err": MessageLookupByLibrary.simpleMessage(
      "身分証を認識できません。再撮影してください。",
    ),
    "chon_id_gen_ocr_no_result": MessageLookupByLibrary.simpleMessage(
      "自動認識結果がありません。",
    ),
    "chon_id_gen_ocr_title": MessageLookupByLibrary.simpleMessage(
      "認識結果を確認してください",
    ),
    "chon_id_gen_pick_type": MessageLookupByLibrary.simpleMessage(
      "発行するID種類を選択してください",
    ),
    "chon_id_gen_prep_start": MessageLookupByLibrary.simpleMessage("撮影開始"),
    "chon_id_gen_prep_tip1": MessageLookupByLibrary.simpleMessage(
      "暗い背景で撮影してください。",
    ),
    "chon_id_gen_prep_tip2": MessageLookupByLibrary.simpleMessage(
      "光が反射しないよう角度を調整してください。",
    ),
    "chon_id_gen_prep_tip3": MessageLookupByLibrary.simpleMessage(
      "身分証の角がガイド内に収まるようにしてください。",
    ),
    "chon_id_gen_prep_title": MessageLookupByLibrary.simpleMessage("撮影前にご確認"),
    "chon_id_gen_reenter": MessageLookupByLibrary.simpleMessage("再入力"),
    "chon_id_gen_review_finish": MessageLookupByLibrary.simpleMessage("発行する"),
    "chon_id_gen_review_title": MessageLookupByLibrary.simpleMessage(
      "確認して発行を完了してください",
    ),
    "chon_id_gen_title": MessageLookupByLibrary.simpleMessage("身分証発行"),
    "chon_id_gen_type_family": MessageLookupByLibrary.simpleMessage("家族関係証明書"),
    "chon_id_gen_type_resident": MessageLookupByLibrary.simpleMessage(
      "住民/外国人登録証",
    ),
    "chon_id_gen_type_taekwondo": MessageLookupByLibrary.simpleMessage(
      "テコンドー段証",
    ),
    "chon_id_gen_verified_fail": MessageLookupByLibrary.simpleMessage(
      "確認できません",
    ),
    "chon_id_gen_verified_ok": MessageLookupByLibrary.simpleMessage("確認されました"),
    "chon_mauth_off_intro": MessageLookupByLibrary.simpleMessage(
      "オフラインで互いの\nCHON IDを確認できます。",
    ),
    "chon_mauth_off_my_qr": MessageLookupByLibrary.simpleMessage("自分のQR"),
    "chon_mauth_off_no_payload": MessageLookupByLibrary.simpleMessage(
      "このカードにはQR情報がありません。",
    ),
    "chon_mauth_off_scan": MessageLookupByLibrary.simpleMessage("相手のQRをスキャン"),
    "chon_mauth_off_scan_prompt": MessageLookupByLibrary.simpleMessage(
      "QRを四角の中に合わせてください。",
    ),
    "chon_mauth_off_scan_sub": MessageLookupByLibrary.simpleMessage(
      "カメラで相手のQRを読み取ります。",
    ),
    "chon_mauth_off_scan_title": MessageLookupByLibrary.simpleMessage("QRスキャン"),
    "chon_mauth_off_show": MessageLookupByLibrary.simpleMessage("自分のQRを表示"),
    "chon_mauth_off_show_prompt": MessageLookupByLibrary.simpleMessage(
      "このQRを相手に見せてください。",
    ),
    "chon_mauth_off_show_sub": MessageLookupByLibrary.simpleMessage(
      "相手があなたのQRをスキャンします。",
    ),
    "chon_mauth_off_title": MessageLookupByLibrary.simpleMessage("オフライン相互認証"),
    "chon_mauth_off_verified": MessageLookupByLibrary.simpleMessage("認証完了"),
    "chon_mauth_off_verifying": MessageLookupByLibrary.simpleMessage("確認中…"),
    "chon_mauth_rcv_anonymous": MessageLookupByLibrary.simpleMessage("不明"),
    "chon_mauth_rcv_approved": MessageLookupByLibrary.simpleMessage("承認完了"),
    "chon_mauth_rcv_approving": MessageLookupByLibrary.simpleMessage("承認処理中…"),
    "chon_mauth_rcv_detail": MessageLookupByLibrary.simpleMessage("リクエスト詳細"),
    "chon_mauth_rcv_empty": MessageLookupByLibrary.simpleMessage(
      "リクエストはありません。",
    ),
    "chon_mauth_rcv_rejected": MessageLookupByLibrary.simpleMessage("拒否完了"),
    "chon_mauth_rcv_rejecting": MessageLookupByLibrary.simpleMessage("拒否処理中…"),
    "chon_mauth_rcv_title": MessageLookupByLibrary.simpleMessage("受信したリクエスト"),
    "chon_mauth_req_approved": MessageLookupByLibrary.simpleMessage("承認されました。"),
    "chon_mauth_req_awaiting": MessageLookupByLibrary.simpleMessage(
      "リクエストを送信しました。\n相手の応答をお待ちください。",
    ),
    "chon_mauth_req_confirm_q": MessageLookupByLibrary.simpleMessage(
      "この方で合っていますか?",
    ),
    "chon_mauth_req_done": MessageLookupByLibrary.simpleMessage("認証が完了しました。"),
    "chon_mauth_req_err_notfound": MessageLookupByLibrary.simpleMessage(
      "ユーザーが見つかりません。",
    ),
    "chon_mauth_req_err_phone": MessageLookupByLibrary.simpleMessage(
      "電話番号を入力してください。",
    ),
    "chon_mauth_req_phone_prompt": MessageLookupByLibrary.simpleMessage(
      "認証する家族の\n電話番号を入力してください。",
    ),
    "chon_mauth_req_rejected": MessageLookupByLibrary.simpleMessage("拒否されました。"),
    "chon_mauth_req_retry_msg": MessageLookupByLibrary.simpleMessage(
      "後ほど再試行してください。",
    ),
    "chon_mauth_req_send": MessageLookupByLibrary.simpleMessage("リクエスト送信"),
    "chon_mauth_req_sending": MessageLookupByLibrary.simpleMessage(
      "リクエストを送信中…",
    ),
    "chon_mauth_req_title": MessageLookupByLibrary.simpleMessage("相互認証"),
    "chon_nav_chon": MessageLookupByLibrary.simpleMessage("CHON"),
    "chon_nav_family_tree": MessageLookupByLibrary.simpleMessage("家系図"),
    "chon_nav_home": MessageLookupByLibrary.simpleMessage("ホーム"),
    "chon_nav_id_card": MessageLookupByLibrary.simpleMessage("身分証"),
    "chon_nav_mutual": MessageLookupByLibrary.simpleMessage("相互認証"),
    "chon_profile_edit_given": MessageLookupByLibrary.simpleMessage("名"),
    "chon_profile_edit_required": MessageLookupByLibrary.simpleMessage(
      "必須項目です。",
    ),
    "chon_profile_edit_surname": MessageLookupByLibrary.simpleMessage("姓"),
    "chon_profile_edit_title": MessageLookupByLibrary.simpleMessage("プロフィール編集"),
    "chon_report_empty": MessageLookupByLibrary.simpleMessage("過去の報告はありません。"),
    "chon_report_err_required": MessageLookupByLibrary.simpleMessage(
      "タイトルと内容を入力してください。",
    ),
    "chon_report_failed": MessageLookupByLibrary.simpleMessage("送信に失敗しました。"),
    "chon_report_field_content": MessageLookupByLibrary.simpleMessage("内容"),
    "chon_report_field_content_hint": MessageLookupByLibrary.simpleMessage(
      "発生した問題を詳しく記入してください。",
    ),
    "chon_report_field_title": MessageLookupByLibrary.simpleMessage("タイトル"),
    "chon_report_field_title_hint": MessageLookupByLibrary.simpleMessage(
      "報告のタイトルを入力してください。",
    ),
    "chon_report_new": MessageLookupByLibrary.simpleMessage("新規報告"),
    "chon_report_sending": MessageLookupByLibrary.simpleMessage("報告を送信中…"),
    "chon_report_submitted": MessageLookupByLibrary.simpleMessage(
      "報告を受け付けました。",
    ),
    "chon_report_submitted_sub": MessageLookupByLibrary.simpleMessage(
      "確認後、迅速にご返信いたします。",
    ),
    "chon_report_title": MessageLookupByLibrary.simpleMessage("問題を報告"),
    "chon_tutorial_s1_body": MessageLookupByLibrary.simpleMessage(
      "身分を家族・親族に\n確認してもらい、必要な場所で認証しましょう。",
    ),
    "chon_tutorial_s1_title": MessageLookupByLibrary.simpleMessage(
      "CHON DIDで\n本人確認",
    ),
    "chon_tutorial_s2_body": MessageLookupByLibrary.simpleMessage(
      "家族と相互に認証して\n関係を証明します。",
    ),
    "chon_tutorial_s2_title": MessageLookupByLibrary.simpleMessage("相互認証"),
    "chon_tutorial_s3_body": MessageLookupByLibrary.simpleMessage(
      "家族関係を可視化し\n家系図を安全に保管します。",
    ),
    "chon_tutorial_s3_title": MessageLookupByLibrary.simpleMessage(
      "家族とともに\n家系図",
    ),
    "chon_tutorial_s4_body": MessageLookupByLibrary.simpleMessage(
      "準備が整いました。\n今すぐご利用ください。",
    ),
    "chon_tutorial_s4_title": MessageLookupByLibrary.simpleMessage(
      "CHONを\n始めましょうか?",
    ),
    "clan": MessageLookupByLibrary.simpleMessage("氏族"),
    "clanOfCertificate": MessageLookupByLibrary.simpleMessage("氏族証明書"),
    "close": MessageLookupByLibrary.simpleMessage("閉じる"),
    "coating": MessageLookupByLibrary.simpleMessage("氏族"),
    "confirm": MessageLookupByLibrary.simpleMessage("確認"),
    "confirmCheckInOut": MessageLookupByLibrary.simpleMessage(
      "チェックイン/チェックアウト\nしますか？",
    ),
    "confirmDelete": MessageLookupByLibrary.simpleMessage("削除しますか？"),
    "confirmRelationSuffix": m0,
    "confirmed": MessageLookupByLibrary.simpleMessage("確認済み"),
    "connect": MessageLookupByLibrary.simpleMessage("接続"),
    "connectionError": MessageLookupByLibrary.simpleMessage(
      "接続エラーです。もう一度お試しください",
    ),
    "connectionInterrupted": MessageLookupByLibrary.simpleMessage(
      "接続が中断されました。もう一度お試しください",
    ),
    "contactAction": MessageLookupByLibrary.simpleMessage("連絡する"),
    "copied": MessageLookupByLibrary.simpleMessage("コピーしました"),
    "copy": MessageLookupByLibrary.simpleMessage("コピー"),
    "copyIdLink": MessageLookupByLibrary.simpleMessage("提出するIDリンクをコピーしてください"),
    "copyLink": MessageLookupByLibrary.simpleMessage("リンクをコピー"),
    "copyVerificationLink": MessageLookupByLibrary.simpleMessage("本人確認リンクをコピー"),
    "count": MessageLookupByLibrary.simpleMessage("世"),
    "cousin": MessageLookupByLibrary.simpleMessage("いとこ"),
    "cousin_brother": MessageLookupByLibrary.simpleMessage("いとこ(男)"),
    "cousin_brother_in_law": MessageLookupByLibrary.simpleMessage("いとこの夫"),
    "cousin_sister": MessageLookupByLibrary.simpleMessage("いとこ(女)"),
    "cousin_sister_in_law": MessageLookupByLibrary.simpleMessage("いとこの妻"),
    "cousins_child": MessageLookupByLibrary.simpleMessage("従甥/従姪"),
    "cousins_childs_child": MessageLookupByLibrary.simpleMessage("再従兄姉の子"),
    "create": MessageLookupByLibrary.simpleMessage("作成"),
    "createSelfId": MessageLookupByLibrary.simpleMessage("SelfIDを作成"),
    "createSelfIdTitle": MessageLookupByLibrary.simpleMessage(
      "Self ID(身分証)を作成",
    ),
    "dateOfIssue": MessageLookupByLibrary.simpleMessage("発行日"),
    "daughter": MessageLookupByLibrary.simpleMessage("娘"),
    "daughter2": MessageLookupByLibrary.simpleMessage("女"),
    "daughterInLaw": MessageLookupByLibrary.simpleMessage("義理の娘"),
    "delete": MessageLookupByLibrary.simpleMessage("削除"),
    "driverLicense": MessageLookupByLibrary.simpleMessage("運転免許証"),
    "duplicateNameSelectNumber": MessageLookupByLibrary.simpleMessage(
      "同名の人物がいます。番号を選択してください。",
    ),
    "editProfile": MessageLookupByLibrary.simpleMessage("プロフィール編集"),
    "elder_brother": MessageLookupByLibrary.simpleMessage("兄"),
    "elder_sister": MessageLookupByLibrary.simpleMessage("姉"),
    "emailExists": MessageLookupByLibrary.simpleMessage("このメールアドレスは既に登録されています"),
    "emailFormat": MessageLookupByLibrary.simpleMessage("メールアドレスの形式が正しくありません"),
    "emailLabel": MessageLookupByLibrary.simpleMessage("メールアドレス"),
    "emailRequired": MessageLookupByLibrary.simpleMessage("メールアドレスを入力してください"),
    "english": MessageLookupByLibrary.simpleMessage("英語"),
    "enter": MessageLookupByLibrary.simpleMessage("入力"),
    "enterAccountNumber": MessageLookupByLibrary.simpleMessage("口座番号を入力"),
    "enterInfoForIdCreation": MessageLookupByLibrary.simpleMessage(
      "ID作成に必要な\n個人情報を入力してください",
    ),
    "enterNameAndRelationship": MessageLookupByLibrary.simpleMessage(
      "名前を入力し、\n「関係」を設定してください",
    ),
    "enterWithoutHyphen": MessageLookupByLibrary.simpleMessage(
      "ハイフンなしで入力してください",
    ),
    "error": MessageLookupByLibrary.simpleMessage("エラー"),
    "errorPageNotLoading": MessageLookupByLibrary.simpleMessage("ページが表示されない"),
    "family": MessageLookupByLibrary.simpleMessage("家族"),
    "familyCertificate": MessageLookupByLibrary.simpleMessage("家族証明書"),
    "familyEditInstruction": MessageLookupByLibrary.simpleMessage(
      "家族アイコンをタップし、「追加/削除」ボタンを押して編集します。",
    ),
    "familyTree": MessageLookupByLibrary.simpleMessage("家系図"),
    "father": MessageLookupByLibrary.simpleMessage("父"),
    "father_2": MessageLookupByLibrary.simpleMessage("父"),
    "female": MessageLookupByLibrary.simpleMessage("女性"),
    "field_given_name": MessageLookupByLibrary.simpleMessage("名"),
    "field_surname": MessageLookupByLibrary.simpleMessage("姓"),
    "fillAllRequiredFields": MessageLookupByLibrary.simpleMessage(
      "必須項目をすべて入力してください",
    ),
    "finishSigup": MessageLookupByLibrary.simpleMessage("会員登録が完了しました！"),
    "firstTimeChon": MessageLookupByLibrary.simpleMessage(
      "Chonは初めてですか？\n今すぐ作成しましょう",
    ),
    "gender": MessageLookupByLibrary.simpleMessage("性別"),
    "goToHome": MessageLookupByLibrary.simpleMessage("ホームへ戻る"),
    "grandfather": MessageLookupByLibrary.simpleMessage("祖父"),
    "grandmother": MessageLookupByLibrary.simpleMessage("祖母"),
    "greenOnion": MessageLookupByLibrary.simpleMessage("派"),
    "groupCall": MessageLookupByLibrary.simpleMessage("グループ通話"),
    "groupChat": MessageLookupByLibrary.simpleMessage("グループチャット"),
    "guidanceAndAgreement": MessageLookupByLibrary.simpleMessage("案内および同意"),
    "hello": MessageLookupByLibrary.simpleMessage("こんにちは"),
    "hint_ask_anything": MessageLookupByLibrary.simpleMessage("何でも聞いてください"),
    "hint_select_contact": MessageLookupByLibrary.simpleMessage("連絡先を選択してください"),
    "history": MessageLookupByLibrary.simpleMessage("履歴"),
    "home": MessageLookupByLibrary.simpleMessage("ホーム"),
    "howCanIhelpYou": MessageLookupByLibrary.simpleMessage("どのようなご用件でしょうか？"),
    "howToCreateSelfId": MessageLookupByLibrary.simpleMessage(
      "どの方法でSelf ID (身分証)を\n作成しますか？",
    ),
    "husband": MessageLookupByLibrary.simpleMessage("夫"),
    "idCardAreaGuide": MessageLookupByLibrary.simpleMessage(
      "表示された枠内に身分証を合わせてください.",
    ),
    "idCardTypes": MessageLookupByLibrary.simpleMessage("モバイルID、身分証明書、運転免許証"),
    "idCheckCompleted": MessageLookupByLibrary.simpleMessage(
      "ID (身分証) の確認が\n完了しました",
    ),
    "idList": MessageLookupByLibrary.simpleMessage("IDリスト"),
    "idNumber": MessageLookupByLibrary.simpleMessage("ID番号"),
    "idVerificationCompleted": MessageLookupByLibrary.simpleMessage(
      "身分証の確認が\n完了しました",
    ),
    "identityCard": MessageLookupByLibrary.simpleMessage("身分証明書"),
    "image": MessageLookupByLibrary.simpleMessage("写真"),
    "infoRequired": MessageLookupByLibrary.simpleMessage("情報を入力してください"),
    "info_account_holder": m1,
    "info_issued_date": m2,
    "information": MessageLookupByLibrary.simpleMessage("情報"),
    "inputInfoTitle": MessageLookupByLibrary.simpleMessage("入力情報"),
    "inquiryTitle": MessageLookupByLibrary.simpleMessage("お問い合わせ"),
    "issueNumber": MessageLookupByLibrary.simpleMessage("があります。ご確認ください。"),
    "issued": MessageLookupByLibrary.simpleMessage("発行済み"),
    "issuedDate": MessageLookupByLibrary.simpleMessage("発行日"),
    "issuer": MessageLookupByLibrary.simpleMessage("発行元"),
    "korean": MessageLookupByLibrary.simpleMessage("韓国語"),
    "label_aptitude_test": MessageLookupByLibrary.simpleMessage("適性検査"),
    "label_content": MessageLookupByLibrary.simpleMessage("コンテンツ"),
    "label_expiration_date": MessageLookupByLibrary.simpleMessage("有効期限"),
    "label_license_number": MessageLookupByLibrary.simpleMessage("免許証番号"),
    "language": MessageLookupByLibrary.simpleMessage("言語"),
    "languageOption": MessageLookupByLibrary.simpleMessage("言語"),
    "level": MessageLookupByLibrary.simpleMessage("段"),
    "levelNumber": MessageLookupByLibrary.simpleMessage("段位番号"),
    "like": MessageLookupByLibrary.simpleMessage("号 (ごう)"),
    "little_brother": MessageLookupByLibrary.simpleMessage("弟"),
    "little_sister": MessageLookupByLibrary.simpleMessage("妹"),
    "logOut": MessageLookupByLibrary.simpleMessage("ログアウト"),
    "loginSessionExpired": MessageLookupByLibrary.simpleMessage(
      "ログインセッションの有効期限が切れました",
    ),
    "makeCall": MessageLookupByLibrary.simpleMessage("電話をかける"),
    "male": MessageLookupByLibrary.simpleMessage("男性"),
    "manualInput": MessageLookupByLibrary.simpleMessage("直接入力"),
    "maternalGrandfather": MessageLookupByLibrary.simpleMessage("母方の祖父"),
    "maternalGrandmother": MessageLookupByLibrary.simpleMessage("母方の祖母"),
    "membershipCard": MessageLookupByLibrary.simpleMessage("会員証"),
    "menuTitle": MessageLookupByLibrary.simpleMessage("メニュー"),
    "message": MessageLookupByLibrary.simpleMessage("メッセージ"),
    "mobileNumber": MessageLookupByLibrary.simpleMessage("携帯電話番号"),
    "mobilePhoneNumber": MessageLookupByLibrary.simpleMessage("電話番号"),
    "mother": MessageLookupByLibrary.simpleMessage("母"),
    "mother_2": MessageLookupByLibrary.simpleMessage("母"),
    "mutualAuthDesc": MessageLookupByLibrary.simpleMessage(
      "家族、親戚、知人と\nお互いに身元確認",
    ),
    "mutualAuthTitle": MessageLookupByLibrary.simpleMessage("相互認証"),
    "mutualAuthentication": MessageLookupByLibrary.simpleMessage("相互認証"),
    "myInfo": MessageLookupByLibrary.simpleMessage("私の情報"),
    "myInformation": MessageLookupByLibrary.simpleMessage("私の情報"),
    "myReportHistoryTitle": MessageLookupByLibrary.simpleMessage("私の報告履歴"),
    "name": MessageLookupByLibrary.simpleMessage("氏名"),
    "nameLabel": MessageLookupByLibrary.simpleMessage("氏名"),
    "nationality": MessageLookupByLibrary.simpleMessage("国籍"),
    "nephew": MessageLookupByLibrary.simpleMessage("孫息子"),
    "nephewInLaw": MessageLookupByLibrary.simpleMessage("姪の夫"),
    "next": MessageLookupByLibrary.simpleMessage("次へ"),
    "niece": MessageLookupByLibrary.simpleMessage("孫娘"),
    "nieceInLaw": MessageLookupByLibrary.simpleMessage("甥の嫁"),
    "niece_nephew": MessageLookupByLibrary.simpleMessage("甥/姪"),
    "noCard": MessageLookupByLibrary.simpleMessage("現在保有している\nIDがありません"),
    "noCardsFound": MessageLookupByLibrary.simpleMessage("カードがありません"),
    "noContact": MessageLookupByLibrary.simpleMessage("連絡先情報が見つかりません。"),
    "noRequest": MessageLookupByLibrary.simpleMessage("認証リクエストが存在しません。"),
    "origin": MessageLookupByLibrary.simpleMessage("本貫"),
    "other": MessageLookupByLibrary.simpleMessage("その他"),
    "other_grand": MessageLookupByLibrary.simpleMessage("甥孫/姪孫"),
    "otpRequired": MessageLookupByLibrary.simpleMessage(
      "メールに送信された4桁の認証コードを入力してください",
    ),
    "ownedIdList": MessageLookupByLibrary.simpleMessage("保有IDリスト"),
    "ownerName": m3,
    "pa": MessageLookupByLibrary.simpleMessage("派"),
    "passport": MessageLookupByLibrary.simpleMessage("パスポート"),
    "password": MessageLookupByLibrary.simpleMessage("パスワード"),
    "passwordMatching": MessageLookupByLibrary.simpleMessage("パスワードが一致しました"),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "使用するパスワードを入力してください",
    ),
    "personToVerify": MessageLookupByLibrary.simpleMessage("私が認証する人"),
    "personalInfo": MessageLookupByLibrary.simpleMessage("個人情報"),
    "phoneNotMatch": MessageLookupByLibrary.simpleMessage("電話番号が一致しません。"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("電話番号"),
    "phoneNumberLabel": MessageLookupByLibrary.simpleMessage("電話番号"),
    "pleaseAddVerifier": MessageLookupByLibrary.simpleMessage(
      "少なくとも1人の認証者を追加してください",
    ),
    "pleaseCreateCertificate": MessageLookupByLibrary.simpleMessage(
      "続けるには証明書を作成してください。",
    ),
    "pleaseEnter": MessageLookupByLibrary.simpleMessage("入力してください"),
    "pleaseEnterAccount": MessageLookupByLibrary.simpleMessage("口座番号を入力してください"),
    "pleaseEnterPassword": MessageLookupByLibrary.simpleMessage(
      "パスワードを入力してください",
    ),
    "pleaseEnterPhone": MessageLookupByLibrary.simpleMessage("携帯電話番号を入力してください"),
    "pleaseEnterUsername": MessageLookupByLibrary.simpleMessage(
      "アカウントを入力してください",
    ),
    "pleaseFillAllFields": MessageLookupByLibrary.simpleMessage(
      "すべての項目を入力してください",
    ),
    "pleaseRequestIdentityVerification": MessageLookupByLibrary.simpleMessage(
      "以下の申請者に対して本人確認をリクエストしてください。",
    ),
    "pleaseSelectBank": MessageLookupByLibrary.simpleMessage("銀行を選択してください"),
    "pleaseSelectIds": MessageLookupByLibrary.simpleMessage(
      "以下のIDから選択してください。\nない場合は「メッセージ」をご利用ください",
    ),
    "pleaseSelectIdsToSubmit": MessageLookupByLibrary.simpleMessage(
      "提出するIDを選択してください",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("プライバシーポリシー"),
    "profile": MessageLookupByLibrary.simpleMessage("プロフィール"),
    "qrCheckInOut": MessageLookupByLibrary.simpleMessage("QRチェックイン/チェックアウト"),
    "qrScanComplete": MessageLookupByLibrary.simpleMessage(
      "QRスキャン完了！\n下の「接続」を押してください",
    ),
    "qrScanOrUpload": MessageLookupByLibrary.simpleMessage(
      "QRコードをスキャンするか、画像をアップロードしてください。",
    ),
    "readAndAgree": MessageLookupByLibrary.simpleMessage("以下の案内を読み、同意する"),
    "redirectIdCreation": MessageLookupByLibrary.simpleMessage("ID作成段階へ移動します"),
    "refusal": MessageLookupByLibrary.simpleMessage("拒否"),
    "refusalSuccess": MessageLookupByLibrary.simpleMessage("拒否しました"),
    "registerToFamilyTreeGuide": MessageLookupByLibrary.simpleMessage(
      "確認すると、私の家系図に登録されます",
    ),
    "relationship": MessageLookupByLibrary.simpleMessage("関係"),
    "relatives": MessageLookupByLibrary.simpleMessage("親戚"),
    "reportContentLabel": MessageLookupByLibrary.simpleMessage("報告内容"),
    "reportProblem": MessageLookupByLibrary.simpleMessage("問題を報告"),
    "reportProblemTitle": MessageLookupByLibrary.simpleMessage("問題を報告する"),
    "requestVerificationGuide": MessageLookupByLibrary.simpleMessage(
      "家族、親戚、知人に\n確認をリクエストしてください\n(相互認証)",
    ),
    "requesterList": MessageLookupByLibrary.simpleMessage("申請者リスト"),
    "requireBothUpAndLowerCase": MessageLookupByLibrary.simpleMessage(
      "英大文字と小文字を含む",
    ),
    "requireConfirmPassword": MessageLookupByLibrary.simpleMessage(
      "パスワードを再入力してください",
    ),
    "requireSpecial": MessageLookupByLibrary.simpleMessage("特殊文字を含む"),
    "requiredField": MessageLookupByLibrary.simpleMessage("必須"),
    "requiredFieldsNoticeHighlight": MessageLookupByLibrary.simpleMessage("必須"),
    "requiredFieldsNoticePrefix": MessageLookupByLibrary.simpleMessage(
      "すべての空欄は",
    ),
    "requiredFieldsNoticeSuffix": MessageLookupByLibrary.simpleMessage("です"),
    "resend": MessageLookupByLibrary.simpleMessage("再送信"),
    "residenceCard": MessageLookupByLibrary.simpleMessage("在留カード"),
    "residentNumber": MessageLookupByLibrary.simpleMessage("住民登録番号"),
    "residentNumberFirstPartInvalid": MessageLookupByLibrary.simpleMessage(
      "IDの最初の部分は6桁である必要があります (YYMMDD)",
    ),
    "residentNumberSecondPartInvalid": MessageLookupByLibrary.simpleMessage(
      "IDの最後の部分は7桁である必要があります",
    ),
    "ruler": MessageLookupByLibrary.simpleMessage("字 (あざな)"),
    "save": MessageLookupByLibrary.simpleMessage("保存"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("QRコードスキャン"),
    "se": MessageLookupByLibrary.simpleMessage("世"),
    "select": MessageLookupByLibrary.simpleMessage("選択"),
    "selectCardType": MessageLookupByLibrary.simpleMessage("カードの種類を選択"),
    "selectFamilyRelationship": MessageLookupByLibrary.simpleMessage(
      "家族関係を選択してください",
    ),
    "selectIdToSubmit": MessageLookupByLibrary.simpleMessage(
      "提出するID (身分証) を選択してください",
    ),
    "selectPortraitPhoto": MessageLookupByLibrary.simpleMessage("顔写真を選択してください"),
    "self": MessageLookupByLibrary.simpleMessage("本人"),
    "self_id_created": MessageLookupByLibrary.simpleMessage("Self IDが作成されました"),
    "sendButton": MessageLookupByLibrary.simpleMessage("送信"),
    "sendSms": MessageLookupByLibrary.simpleMessage("SMSを送る"),
    "sendTextMessage": MessageLookupByLibrary.simpleMessage("メッセージ送信"),
    "serviceInterruption": MessageLookupByLibrary.simpleMessage(
      "サービスが一時的に中断されています",
    ),
    "serviceTermsAddendumContent": MessageLookupByLibrary.simpleMessage(
      "1. 本規約は [2026.02.01] から施行されます。\n2. 本規約施行以前に加入した会員に対しても本規約が適用されます（ただし、関連法令上の制限がある場合は例外）。",
    ),
    "serviceTermsAddendumTitle": MessageLookupByLibrary.simpleMessage("附則"),
    "serviceTermsAgreeCheckbox": MessageLookupByLibrary.simpleMessage(
      "(本条) 利用規約に同意",
    ),
    "serviceTermsArt10Content": MessageLookupByLibrary.simpleMessage(
      "利用者は以下の各号の行為をしてはなりません。\n1. 他人のアカウント盗用、名義盗用、なりすまし\n2. 違法情報の掲示、著作権侵害、わいせつ物/違法撮影物関連の行為\n3. サービスまたはサーバーに過負荷を誘発したりセキュリティを侵害する行為\n4. 自動化手段による無断収集/スクレイピング/クローリング（当社許容範囲を除く）\n5. 他人の権利（肖像権、個人情報、名誉等）の侵害\n6. その他法令または善良な風俗・社会秩序に反する行為",
    ),
    "serviceTermsArt10Title": MessageLookupByLibrary.simpleMessage(
      "第10条（禁止行為）",
    ),
    "serviceTermsArt11Content": MessageLookupByLibrary.simpleMessage(
      "1. 当社は、会員が本規約または運営ポリシーに違反した場合、違反の程度に応じて警告、コンテンツ削除/非公開、機能制限、利用停止、永久利用停止（アカウント解約）等の措置をとることができます。\n2. 会員はいつでもサービス内の手続きを通じて利用契約を解約（会員退会）することができます。\n3. 利用制限または解約後も、関連法令および当社の保管ポリシーに従い一部の情報は一定期間保管される場合があり、詳細は個人情報処理方針に従います。",
    ),
    "serviceTermsArt11Title": MessageLookupByLibrary.simpleMessage(
      "第11条（利用制限および契約解約）",
    ),
    "serviceTermsArt12Content": MessageLookupByLibrary.simpleMessage(
      "1. 有料サービスの内容、料金、決済方法、提供期間、払戻基準等は別途案内（サービス画面/決済ページ/払戻ポリシー）に従います。\n2. サブスクリプション型サービスの自動更新、解約、払戻条件は、決済手段およびストアポリシー（例：App Store/Play Store）と当社ポリシーが共に適用される場合があります。",
    ),
    "serviceTermsArt12Title": MessageLookupByLibrary.simpleMessage(
      "第12条（有料サービスおよび決済）",
    ),
    "serviceTermsArt13Content": MessageLookupByLibrary.simpleMessage(
      "1. 当社は、天災地変、戦争、停電、通信網障害、第三者サービス障害など不可抗力によりサービスを提供できない場合、責任を負いません。\n2. 当社は、利用者間の紛争、利用者が入力した情報の正確性、相互認証結果の信頼性、コンテンツの適法性について、法令上責任が認められる場合を除き、責任を負いません。\n3. AI機能が提供される場合、AIの出力は参考用であり（エラーの可能性あり）、最終判断と責任は利用者にあります。",
    ),
    "serviceTermsArt13Title": MessageLookupByLibrary.simpleMessage(
      "第13条（免責および責任制限）",
    ),
    "serviceTermsArt14Content": MessageLookupByLibrary.simpleMessage(
      "1. 当社は、会員が登録したメール/携帯番号/アプリプッシュ/サービス内通知など合理的な方法で通知することができます。\n2. 会員が連絡先を最新に維持せず通知を受け取れなかった場合、それに伴う不利益は会員にあります。",
    ),
    "serviceTermsArt14Title": MessageLookupByLibrary.simpleMessage("第14条（通知）"),
    "serviceTermsArt15Content": MessageLookupByLibrary.simpleMessage(
      "個人情報の処理（収集・利用・提供・委託・破棄等）に関する事項は、個人情報処理方針および関連する同意手続きに従います。利用規約のみで個人情報同意を代替するものではありません。",
    ),
    "serviceTermsArt15Title": MessageLookupByLibrary.simpleMessage(
      "第15条（個人情報保護）",
    ),
    "serviceTermsArt16Content": MessageLookupByLibrary.simpleMessage(
      "1. 本規約は、大韓民国法令に従って解釈・適用されます。\n2. サービス利用に関して紛争が発生した場合、当事者間の協議による解決を優先し、協議が不成立の場合、ソウル中央地方法院を専属管轄裁判所とします（または民事訴訟法上の管轄裁判所）。",
    ),
    "serviceTermsArt16Title": MessageLookupByLibrary.simpleMessage(
      "第16条（準拠法および管轄）",
    ),
    "serviceTermsArt1Content": MessageLookupByLibrary.simpleMessage(
      "本規約は、当社が提供するChonサービスの利用に関し、当社と利用者（会員を含む）との間の権利義務および責任事項、利用条件および手続き、その他必要な事項を規定することを目的とします。",
    ),
    "serviceTermsArt1Title": MessageLookupByLibrary.simpleMessage("第1条（目的）"),
    "serviceTermsArt2Content": MessageLookupByLibrary.simpleMessage(
      "1. サービス: 当社が提供するChonアプリ/ウェブおよび関連する諸般のサービスをいいます。\n2. 利用者: サービスに接続し、本規約に従って当社が提供するサービスを利用する者をいいます。\n3. 会員: 本規約に同意し、アカウントを作成してサービスを利用する者をいいます。\n4. アカウント: 会員識別およびサービス利用のために会員が設定したログイン手段（メール/携帯番号/ソーシャルログイン等）およびそれに付随する情報をいいます。\n5. コンテンツ: 会員がサービス内に掲示・登録・アップロード・送信する文字、画像、文書（PDF含む）、リンク、データ（家系図/関係図/プロフィール情報含む）およびその他の情報をいいます。\n6. 相互認証: 会員間の特定の関係（家族/友人/組織等）を確認・連携するためにサービスが提供する認証手続きまたは機能をいいます。\n7. 有料サービス: 当社が有償で提供する購読、利用券、付加機能等をいいます（該当する場合）。",
    ),
    "serviceTermsArt2Title": MessageLookupByLibrary.simpleMessage("第2条（定義）"),
    "serviceTermsArt3Content": MessageLookupByLibrary.simpleMessage(
      "1. 本規約は、サービス画面（初期画面またはリンク画面）に掲示するか、その他の方法で告知し、会員がこれに同意することで効力が発生します。\n2. 当社は、関連法令に違反しない範囲で本規約を改定することができます。\n3. 本規約に定めのない事項および解釈については、関連法令および当社が別途定めた運営ポリシー/ガイド、一般的な商慣習に従います。",
    ),
    "serviceTermsArt3Title": MessageLookupByLibrary.simpleMessage(
      "第3条（規約の効力および適用）",
    ),
    "serviceTermsArt4Content": MessageLookupByLibrary.simpleMessage(
      "1. 当社が規約を改定する場合、適用日、改定内容、改定理由を明示してサービス内に告知します。\n2. 重要な変更または利用者に不利な変更の場合、当社は合理的な期間を置いて（例：少なくとも30日前）告知し、必要に応じて個別に通知します。\n3. 規約変更に同意しない会員は、変更規約の適用前まで利用契約を解約（会員退会）することができます。",
    ),
    "serviceTermsArt4Title": MessageLookupByLibrary.simpleMessage(
      "第4条（規約の変更および告知）",
    ),
    "serviceTermsArt5Content": MessageLookupByLibrary.simpleMessage(
      "1. 会員登録は、利用者が規約に同意した後、当社が定めた手続き（アカウント作成、本人確認等）を完了することで成立します。\n2. 会員はアカウント情報の最新性を維持しなければならず、虚偽情報の提供または他人の情報の盗用による不利益は会員の責任となります。\n3. 会員はアカウント・パスワード（または認証手段）の管理責任を負い、第三者の使用が疑われる場合、直ちに当社に通知しなければなりません。",
    ),
    "serviceTermsArt5Title": MessageLookupByLibrary.simpleMessage(
      "第5条（会員登録およびアカウント管理）",
    ),
    "serviceTermsArt6Content": MessageLookupByLibrary.simpleMessage(
      "1. 満14歳未満の児童の会員登録および個人情報関連の手続きは、法定代理人の同意など関連法令に従います（サービスポリシーにより登録が制限される場合があります）。\n2. 当社は必要に応じて年齢確認または法定代理人の同意を要請することができます。",
    ),
    "serviceTermsArt6Title": MessageLookupByLibrary.simpleMessage(
      "第6条（未成年者の利用）",
    ),
    "serviceTermsArt7Content": MessageLookupByLibrary.simpleMessage(
      "1. 当社は以下のサービスを提供することができます。\na. 相互認証に基づく関係（家族/友人/組織等）の連携および管理機能\nb. 家系図/関係図の作成・閲覧・共有機能\nc. プロフィール/ID（身分・人脈）構成および表示機能\nd. 文書/画像のアップロードおよび整理機能（PDF含む）\ne. AIベースの検索・要約・Q&A等の付加機能（該当時）\n2. 当社はサービスの全部または一部を変更・中断することができ、重大な変更・中断時は事前に告知します。\n3. 当社は運営上・技術上の必要に応じて点検を実施することができ、点検時間はサービス画面に告知します。",
    ),
    "serviceTermsArt7Title": MessageLookupByLibrary.simpleMessage(
      "第7条（サービスの提供および変更）",
    ),
    "serviceTermsArt8Content": MessageLookupByLibrary.simpleMessage(
      "1. 相互認証は会員間の関係確認を支援する機能であり、当社は会員間の実際の関係の法的効力や真実性を保証しません。\n2. 会員は他人の同意なしに他人に関する機微な情報（例：住民登録番号等）を入力・掲示してはなりません。\n3. 関係データ（家系図/関係図）は会員の入力および相互作用により生成され、それに起因する紛争は当事者間での解決を原則とします。当社は法令上責任が認められる場合を除き、介入する義務を負いません。",
    ),
    "serviceTermsArt8Title": MessageLookupByLibrary.simpleMessage(
      "第8条（相互認証および関係データの特則）",
    ),
    "serviceTermsArt9Content": MessageLookupByLibrary.simpleMessage(
      "1. コンテンツに関する権利は、原則としてこれを生成・登録した会員に帰属します。\n2. 会員は、サービスを運営・提供・改善するために必要な範囲で、当社が当該コンテンツを保存、複製、送信、変換（例：形式変換/検索インデックス）、表示できるように非独占的利用許諾を当社に付与します。\n3. 会員は、アップロードする文書・画像・テキスト等について適法な権利を保有しているか、利用許諾を受けていることを保証します。\n4. 当社がAI機能改善等のためにコンテンツを活用しようとする場合、関連法令が要求する別途の告知/同意手続きを経ます（必要な場合）。",
    ),
    "serviceTermsArt9Title": MessageLookupByLibrary.simpleMessage(
      "第9条（コンテンツの権利および利用許諾）",
    ),
    "serviceTermsCompanyInfoContent": MessageLookupByLibrary.simpleMessage(
      "• 商号: 株式会社Chon\n• 代表者: Shin Geun-young\n• 事業者登録番号: 196-86-03544\n• 住所: 309, 3F, 464 Gangnam-daero, Gangnam-gu, Seoul\n• 顧客センター: 010-3420-8691 / ops@chon.ai\n• CPO: Kim Nam-yul",
    ),
    "serviceTermsCompanyInfoTitle": MessageLookupByLibrary.simpleMessage(
      "会社情報",
    ),
    "serviceTermsHeaderContent": MessageLookupByLibrary.simpleMessage(
      "施行日: 2026.02.01\nバージョン: v1.0\n会社名: 株式会社Chon（「当社」）\nサービス名: Chon（「サービス」）",
    ),
    "serviceTermsHeaderTitle": MessageLookupByLibrary.simpleMessage(
      "Chon サービス利用規約",
    ),
    "serviceTermsTitle": MessageLookupByLibrary.simpleMessage("Chon 利用規約"),
    "setting": MessageLookupByLibrary.simpleMessage("設定"),
    "settings": MessageLookupByLibrary.simpleMessage("設定"),
    "shootingGuide": MessageLookupByLibrary.simpleMessage(
      "暗い背景で撮影してください。光が反射しないように角度を調整してください。",
    ),
    "siblings_brother_sister": MessageLookupByLibrary.simpleMessage("男兄弟/女姉妹"),
    "siblings_child": MessageLookupByLibrary.simpleMessage("甥/姪"),
    "siblings_grand_child": MessageLookupByLibrary.simpleMessage("大甥/大姪"),
    "signIn": MessageLookupByLibrary.simpleMessage("ログイン"),
    "signUp": MessageLookupByLibrary.simpleMessage("会員登録"),
    "sister": MessageLookupByLibrary.simpleMessage("女姉妹"),
    "sister2": MessageLookupByLibrary.simpleMessage("姉妹"),
    "sister_in_law": MessageLookupByLibrary.simpleMessage("義姉"),
    "son": MessageLookupByLibrary.simpleMessage("息子"),
    "son2": MessageLookupByLibrary.simpleMessage("子"),
    "sonInLaw": MessageLookupByLibrary.simpleMessage("義理の息子"),
    "spouse": MessageLookupByLibrary.simpleMessage("配偶者"),
    "subTier": MessageLookupByLibrary.simpleMessage("サブ段階"),
    "subjectLabel": MessageLookupByLibrary.simpleMessage("件名"),
    "submit": MessageLookupByLibrary.simpleMessage("送信"),
    "success": MessageLookupByLibrary.simpleMessage("成功"),
    "surname": MessageLookupByLibrary.simpleMessage("姓"),
    "systemDefault": MessageLookupByLibrary.simpleMessage("システムのデフォルト"),
    "taekwondo": MessageLookupByLibrary.simpleMessage("テコンドー"),
    "taekwondoCertificate": MessageLookupByLibrary.simpleMessage("テコンドー認定証"),
    "taekwondoOfCertificate": MessageLookupByLibrary.simpleMessage("テコンドー証明書"),
    "termsAddendumContent": MessageLookupByLibrary.simpleMessage(
      "1. 本規約は [2026.02.01] から施行されます。\n2. 施行日以前に加入した会員にも本規約が適用されます。",
    ),
    "termsAddendumTitle": MessageLookupByLibrary.simpleMessage("附則"),
    "termsCheckboxMarketingOptional": MessageLookupByLibrary.simpleMessage(
      "(任意) マーケティング情報の受信同意（メール/SMS/プッシュ通知）",
    ),
    "termsCheckboxPrivacyRequired": MessageLookupByLibrary.simpleMessage(
      "(必須) 個人情報の収集・利用への同意",
    ),
    "termsCheckboxThirdPartyRequired": MessageLookupByLibrary.simpleMessage(
      "(必須) 個人情報の第三者提供への同意（相互認証・家系図機能）",
    ),
    "termsConfirm": MessageLookupByLibrary.simpleMessage("確認"),
    "termsItemsContent": MessageLookupByLibrary.simpleMessage(
      "当社は、サービス提供に必要な範囲で以下の個人情報を収集・利用します。\n(A) 会員登録/アカウント管理に必須の項目\n• メールアドレスまたは携帯電話番号\n• パスワード（暗号化）または認証トークン\n• 表示名（名前/ニックネーム）\n• 内部識別子（UIDなど）\n(B) 相互認証/家系図機能に関する項目\n• ユーザーが入力した関係情報\n• 認証情報（招待コード、トークン）\n• 公開プロフィール情報（写真、自己紹介）\n(C) 自動的に収集される項目\n• アクセスログ、IPアドレス、端末情報、Cookie",
    ),
    "termsItemsTitle": MessageLookupByLibrary.simpleMessage(
      "2) 収集・利用する個人情報の項目",
    ),
    "termsMainTitle": MessageLookupByLibrary.simpleMessage("Chon 利用規約"),
    "termsMarketingConsentDetailContent": MessageLookupByLibrary.simpleMessage(
      "同意されなくてもサービス利用は可能です。\n• 目的: イベント、プロモーション、新機能の案内\n• 項目: メール、携帯電話番号、プッシュトークン\n• 保有期間: 同意撤回または退会時まで",
    ),
    "termsMarketingConsentDetailTitle": MessageLookupByLibrary.simpleMessage(
      "[任意] マーケティング情報の受信同意詳細",
    ),
    "termsMarketingInfoContent": MessageLookupByLibrary.simpleMessage(
      "本項目に同意されなくても、基本サービスはご利用いただけます。\n施行日: 2026.02.01\n個人情報処理者: 株式会社Chon\n• 代表者: Shin Geun-young\n• 住所: 309, 3F, 464 Gangnam-daero, Gangnam-gu, Seoul",
    ),
    "termsMarketingInfoTitle": MessageLookupByLibrary.simpleMessage(
      "5) 選択同意（マーケティング）",
    ),
    "termsOfService": MessageLookupByLibrary.simpleMessage("利用規約"),
    "termsPrivacyConsentTitle": MessageLookupByLibrary.simpleMessage(
      "Chon 個人情報の収集・利用への同意",
    ),
    "termsProvisionItemsContent": MessageLookupByLibrary.simpleMessage(
      "会員が公開/共有範囲に設定した情報に限られます。\n• 表示名\n• 公開プロフィール情報\n• 関係情報\n• 家系図データ\n※ 連絡先（電話番号/メール）は、会員が別途共有を選択しない限り提供されません。",
    ),
    "termsProvisionItemsTitle": MessageLookupByLibrary.simpleMessage(
      "3) 提供される項目",
    ),
    "termsProvisionPurposeContent": MessageLookupByLibrary.simpleMessage(
      "• 相互認証の実施および結果確認\n• 関係の連携\n• 家系図の表示・閲覧および履歴管理",
    ),
    "termsProvisionPurposeTitle": MessageLookupByLibrary.simpleMessage(
      "2) 提供の目的",
    ),
    "termsPurposeContent": MessageLookupByLibrary.simpleMessage(
      "株式会社Chon（以下「当社」といいます）は、以下の目的のために個人情報を収集・利用します。\n• 会員登録およびアカウント管理（本人確認、ログイン、不正利用防止）\n• 相互認証および関係（家族/友人/組織など）の連携、家系図の作成・表示・管理\n• サービスの運営、セキュリティ、品質向上\n• カスタマーサポートおよび問い合わせ対応",
    ),
    "termsPurposeTitle": MessageLookupByLibrary.simpleMessage("1) 収集・利用の目的"),
    "termsRecipientContent": MessageLookupByLibrary.simpleMessage(
      "• 相互認証が成立した相手方の会員\n• 家系図の共有対象として指定された会員",
    ),
    "termsRecipientRetentionContent": MessageLookupByLibrary.simpleMessage(
      "• 関係連携または共有設定が維持されている間、閲覧・利用可能です。\n• 関係が削除または共有解除された場合、表示は停止されます。",
    ),
    "termsRecipientRetentionTitle": MessageLookupByLibrary.simpleMessage(
      "4) 提供を受ける者の保有・利用期間",
    ),
    "termsRecipientTitle": MessageLookupByLibrary.simpleMessage("1) 提供を受ける者"),
    "termsRefusalContent": MessageLookupByLibrary.simpleMessage(
      "個人情報の収集・利用を拒否する権利があります。ただし、必須項目への同意を拒否された場合、サービス利用（会員登録/相互認証など）が制限されることがあります。",
    ),
    "termsRefusalTitle": MessageLookupByLibrary.simpleMessage(
      "4) 同意を拒否する権利および不利益",
    ),
    "termsRetentionContent": MessageLookupByLibrary.simpleMessage(
      "原則として、会員退会時まで個人情報を保有・利用します。ただし、法令により保管義務がある場合はこれに従います。",
    ),
    "termsRetentionTitle": MessageLookupByLibrary.simpleMessage("3) 保有・利用期間"),
    "termsScrollDown": MessageLookupByLibrary.simpleMessage("下にスクロール"),
    "termsThirdPartyContent": MessageLookupByLibrary.simpleMessage(
      "当社は、以下のように個人情報を第三者（他の会員を含む）に提供します。",
    ),
    "termsThirdPartyRefusalContent": MessageLookupByLibrary.simpleMessage(
      "第三者提供への同意を拒否することができます。ただし、これは相互認証および家系図機能に必要であるため、拒否された場合、当該機能の利用が制限されます。",
    ),
    "termsThirdPartyRefusalTitle": MessageLookupByLibrary.simpleMessage(
      "5) 同意を拒否する権利（第三者提供）",
    ),
    "termsThirdPartyTitle": MessageLookupByLibrary.simpleMessage(
      "個人情報の第三者提供への同意",
    ),
    "tier": MessageLookupByLibrary.simpleMessage("段階"),
    "unVerifiedList": MessageLookupByLibrary.simpleMessage("未認証リスト"),
    "uncle_aunt_husband": MessageLookupByLibrary.simpleMessage("叔父"),
    "uncle_father_older": MessageLookupByLibrary.simpleMessage("伯父"),
    "unverified": MessageLookupByLibrary.simpleMessage("未認証"),
    "update": MessageLookupByLibrary.simpleMessage("更新"),
    "updateFailed": MessageLookupByLibrary.simpleMessage("更新できません"),
    "uploadSizeLimitWarning": MessageLookupByLibrary.simpleMessage(
      "300MB以下のファイルのみアップロード可能です。",
    ),
    "username": MessageLookupByLibrary.simpleMessage("アカウント"),
    "verificationPoint": MessageLookupByLibrary.simpleMessage("認証ポイント"),
    "verificationRequest": MessageLookupByLibrary.simpleMessage("認証リクエスト"),
    "verificationRequestedBy": MessageLookupByLibrary.simpleMessage(
      "さんが\n確認をリクエストしました",
    ),
    "verificationScore": MessageLookupByLibrary.simpleMessage("認証スコア"),
    "verifiedList": MessageLookupByLibrary.simpleMessage("認証済みリスト"),
    "verifierForMe": MessageLookupByLibrary.simpleMessage("私を認証してくれる人"),
    "verifyFinish": MessageLookupByLibrary.simpleMessage("相互認証が完了しました。"),
    "verifyRequest": MessageLookupByLibrary.simpleMessage("認証リクエスト"),
    "verifycationRequest": MessageLookupByLibrary.simpleMessage("認証リクエスト"),
    "viewFamilyTree": MessageLookupByLibrary.simpleMessage("家系図を見る"),
    "visaType": MessageLookupByLibrary.simpleMessage("ビザの種類"),
    "wife": MessageLookupByLibrary.simpleMessage("妻"),
  };
}
