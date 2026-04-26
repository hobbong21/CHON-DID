import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

part 'contact_picker_state.dart';
part 'contact_picker_cubit.freezed.dart';

class ContactPickerCubit extends Cubit<ContactPickerState> {
  ContactPickerCubit() : super(const ContactPickerState());

  final msg = TextEditingController();

  Future<void> makePhoneCall(String phoneNumber) async {
    if (phoneNumber.isEmpty) return;
    final cleanPhone = phoneNumber.replaceAll(' ', '').replaceAll('-', '');
    final Uri launchUri = Uri(scheme: 'tel', path: cleanPhone);

    try {
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      }
    } catch (e) {
      debugPrint('Lỗi gọi điện: $e');
    }
  }

  Future<void> sendSms(BuildContext context, String phoneNumber) async {
    if (phoneNumber.isEmpty) return;

    final phones = [phoneNumber];

    final cleanPhones =
        phones.map((e) => e.replaceAll(RegExp(r'[^\d+]'), '')).join(',');

    final message = Uri.encodeComponent(msg.text);

    try {
      final uri = Uri.parse(
        'sms:$cleanPhones?body=$message',
      );

      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      debugPrint('Lỗi gửi SMS: $e');
    }

    // showInputMessageButtomSheet(
    //   context,
    //   () async {
    //     final phones = [phoneNumber];

    //     final cleanPhones =
    //         phones.map((e) => e.replaceAll(RegExp(r'[^\d+]'), '')).join(',');

    //     final message = Uri.encodeComponent(msg.text);

    //     try {
    //       final uri = Uri.parse(
    //         'sms:$cleanPhones?body=$message',
    //       );

    //       await launchUrl(
    //         uri,
    //         mode: LaunchMode.externalApplication,
    //       );
    //     } catch (e) {
    //       debugPrint('Lỗi gửi SMS: $e');
    //     }
    //   },
    // );
  }

  Future<void> shareContactInfo(
    BuildContext context,
    String phone,
  ) async {
    if (phone.isEmpty) return;

    await SharePlus.instance.share(ShareParams(text: 'hello'));

    // showInputMessageButtomSheet(
    //   context,
    //   () async {
    //     await SharePlus.instance.share(ShareParams(text: msg.text));
    //   },
    // );
  }

  showInputMessageButtomSheet(BuildContext context, VoidCallback onSubmit) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: 16.h,
              bottom: MediaQuery.of(context).viewInsets.bottom + 12.h,
              left: 16.w,
              right: 16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(S.current.label_content,
                    style: context.theme.textTheme.titleMedium),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: msg,
                        minLines: 1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: S.current.label_content,
                          border: OutlineInputBorder(),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 12.r),
                            child: InkWell(
                              onTap: () {
                                onSubmit();
                              },
                              child: Assets.images.icSend.image(width: 24.r),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
