import 'dart:io';

import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/core/utils/datetime_utils.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/presentations/modules/ocr_id/cubit/resolve_korean_data.dart';
import 'package:base_flutter/presentations/modules/self_id_creater/cubit/self_id_creater_cubit.dart';
import 'package:base_flutter/presentations/widgets/coutry_picker.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/image_picker.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SelfIdCreaterPage extends StatefulWidget {
  final KoreanIdCard? card;
  const SelfIdCreaterPage({super.key, this.card});

  @override
  State<SelfIdCreaterPage> createState() => _SelfIdCreaterPageState();
}

class _SelfIdCreaterPageState extends State<SelfIdCreaterPage> {
  final cubit = SelfIdCreaterCubit();
  final appCubit = Injector.getIt<AppCubit>();

  @override
  void initState() {
    super.initState();
    cubit.init(widget.card);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    final colors = context.colors;
    final currentAccessToken = appCubit.state.loginModel?.accessToken;

    // Bọc BlocProvider và BlocConsumer để xử lý logic
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<SelfIdCreaterCubit, SelfIdCreaterState>(
        listener: (context, state) {
          if (state.isLoading) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
          if (state.errorMessage.isNotEmpty) {
            AppUtils.showSnackBarError(
              context: context,
              title: state.errorMessage,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12.h),
                          Text(
                            S.current.enterInfoForIdCreation,
                            style: textTheme.titleLarge,
                          ),
                          SizedBox(height: 12.h),

                          // --- GIỮ NGUYÊN FORMAT CŨ CỦA LEADER ---
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text: S.current.requiredFieldsNoticePrefix),
                            TextSpan(
                              text: S.current.requiredFieldsNoticeHighlight,
                              style: textTheme.bodyMedium
                                  ?.copyWith(color: colors.red),
                            ),
                            TextSpan(
                              text: S.current.requiredFieldsNoticeSuffix,
                            ),
                          ])),
                          // ----------------------------------------

                          SizedBox(height: 12.h),
                          Container(
                            padding: EdgeInsets.all(16.r),
                            decoration: BoxDecoration(
                              color: colors.white,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Column(
                              children: [
                                ImagePickerCustom(
                                  key: ValueKey(state.resetKey),
                                  width: 114.h,
                                  height: 114.h * 4 / 3,
                                  onImageSelected: (File file) {
                                    cubit.onImageSelected(file);
                                  },
                                ),
                                SizedBox(height: 16.h),

                                // TÊN
                                Row(
                                  children: [
                                    SizedBox(
                                        width: 88.r,
                                        child: Text(S.current.name)),
                                    SizedBox(width: 12.w),
                                    Expanded(
                                      child: TextFormField(
                                        controller: cubit
                                            .nameController, // Gắn Controller
                                        textAlign: TextAlign.end,
                                        textInputAction: TextInputAction.next,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12.h),

                                Row(
                                  children: [
                                    SizedBox(
                                        width: 88.r,
                                        child: Text(S.current.residentNumber)),
                                    SizedBox(width: 12.w),
                                    Expanded(
                                      child: TextFormField(
                                        controller: cubit.idPart1Controller,
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.end,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(6),
                                        ],
                                        textInputAction: TextInputAction.next,
                                      ),
                                    ),
                                    if (!cubit.isPassport) ...[
                                      Text(' - '),
                                      Expanded(
                                        child: TextFormField(
                                          controller: cubit.idPart2Controller,
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.end,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(7),
                                          ],
                                          textInputAction: TextInputAction.next,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                                SizedBox(height: 12.h),

                                // NUM DRIVER
                                if (cubit.isDriverLicense) ...[
                                  Row(
                                    children: [
                                      SizedBox(
                                          width: 88.r, child: Text(S.current.label_license_number)),
                                      SizedBox(width: 12.w),
                                      Expanded(
                                        child: TextFormField(
                                          controller: cubit
                                              .licenseNumberController, // Gắn Controller
                                          textAlign: TextAlign.end,
                                          textInputAction: TextInputAction.next,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12.h),
                                ],

                                // ĐỊA CHỈ
                                Row(
                                  children: [
                                    SizedBox(
                                        width: 88.r,
                                        child: Text(S.current.address)),
                                    SizedBox(width: 12.w),
                                    Expanded(
                                      child: TextFormField(
                                        controller: cubit.addressController,
                                        textAlign: TextAlign.end,
                                        minLines: 1,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12.h),

                                Row(
                                  children: [
                                    SizedBox(
                                        width: 88.r,
                                        child: Text(S.current.issuer)),
                                    SizedBox(width: 12.w),
                                    Expanded(
                                      child: TextFormField(
                                        controller: cubit.issuerController,
                                        textAlign: TextAlign.end,
                                        textInputAction: TextInputAction.next,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12.h),

                                Row(
                                  children: [
                                    SizedBox(
                                        width: 88.r,
                                        child: Text(S.current.dateOfIssue)),
                                    SizedBox(width: 12.w),
                                    Expanded(
                                      child: TextFormField(
                                        controller: cubit.dateController,
                                        readOnly: true,
                                        textAlign: TextAlign.end,
                                        onTap: () {
                                          _showDatePicker(cubit.dateController);
                                        },
                                        textInputAction: TextInputAction.next,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12.h),

                                // Expiration Date PASSPORT
                                if (cubit.isPassport) ...[
                                  Row(
                                    children: [
                                      SizedBox(width: 88.r, child: Text(S.current.label_expiration_date)),
                                      SizedBox(width: 12.w),
                                      Expanded(
                                        child: TextFormField(
                                          controller:
                                              cubit.expirationDateController,
                                          readOnly: true,
                                          textAlign: TextAlign.end,
                                          onTap: () {
                                            _showDatePicker(
                                                cubit.expirationDateController);
                                          },
                                          textInputAction: TextInputAction.next,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12.h),
                                ],

                                // License Validity DRIVER
                                if (cubit.isDriverLicense) ...[
                                  Row(
                                    children: [
                                      SizedBox(
                                          width: 88.r, child: Text(S.current.label_aptitude_test)),
                                      SizedBox(width: 12.w),
                                      Expanded(
                                        child: TextFormField(
                                          controller: cubit
                                              .licenseValidityController, // Gắn Controller
                                          textAlign: TextAlign.end,
                                          textInputAction: TextInputAction.next,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12.h),
                                ],

                                if (currentAccessToken?.isEmpty ?? true)
                                  Row(
                                    children: [
                                      SizedBox(
                                          width: 88.r,
                                          child:
                                              Text(S.current.phoneNumberLabel)),
                                      SizedBox(width: 12.w),
                                      Expanded(
                                        child: TextFormField(
                                          controller: cubit.phoneController,
                                          keyboardType: TextInputType.phone,
                                          textAlign: TextAlign.end,
                                          maxLength: 10,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            TextInputFormatter.withFunction(
                                                (oldValue, newValue) {
                                              if (newValue.text.length <
                                                  oldValue.text.length) {
                                                return newValue;
                                              }

                                              final text = newValue.text
                                                  .replaceFirst(
                                                      RegExp(r'^0+'), '');
                                              return newValue.copyWith(
                                                text: text,
                                                selection:
                                                    TextSelection.collapsed(
                                                        offset: text.length),
                                              );
                                            }),
                                          ],
                                          decoration: InputDecoration(
                                            counterText: '',
                                            prefix: CoutryPicker(
                                              countryController:
                                                  cubit.countryController,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    top: false,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 4.h),
                      child: ElevatedButton(
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            cubit.createCard();
                          },
                          child: Text(S.current.create)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _showDatePicker(TextEditingController c) async {
    final date = await showDatePicker(
      locale: Locale(appCubit.state.locale),
      context: context,
      initialDate: DateTimeUtils.convertStringToDate(
        c.text,
        'yyyy.MM.dd',
      ),
      firstDate: DateTime(1945),
      lastDate: DateTime(2999),
    );
    c.text = DateTimeUtils.convertDateToString(date, 'yyyy.MM.dd');
  }
}
