import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/image_picker.dart';
import 'package:base_flutter/presentations/widgets/input_decoration_app.dart';
import 'package:base_flutter/presentations/widgets/safe_area_bottom.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'cubit/profile_edit_cubit.dart';

class ProfileEditPage extends StatefulWidget {
  final CardInfoItem? card;
  const ProfileEditPage({super.key, this.card});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final cubit = ProfileEditCubit();

  @override
  void initState() {
    super.initState();
    List<String> parts = (widget.card?.name ?? '').split(' ');
    String firstWord = parts.first;
    String rest = parts.skip(1).join(' ');
    cubit.nameController.text = firstWord;
    cubit.surnameController.text = rest;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = context.theme;
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<ProfileEditCubit, ProfileEditState>(
          listener: (context, state) {
        if (state.isLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
        if (state.messageError.isNotEmpty) {
          AppUtils.showSnackBarError(
              context: context, title: state.messageError);
        }
      }, builder: (context, state) {
        return Scaffold(
          body: Form(
            key: cubit.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(title: S.current.editProfile),
                  SizedBox(height: 24.h, width: double.infinity),
                  Center(
                    child: ImagePickerCustom(
                      width: 120.h,
                      height: 120.h * 4 / 3,
                      initUrl: widget.card?.imgPath,
                      onImageSelected: cubit.fileToBase64,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Text(S.current.nameLabel, style: theme.textTheme.titleLarge),
                  SizedBox(height: 8.h),
                  TextFormField(
                    controller: cubit.surnameController,
                    decoration: InputDecorationApp.secondary(colors).copyWith(
                      hintText: S.current.field_surname,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  TextFormField(
                    controller: cubit.nameController,
                    decoration: InputDecorationApp.secondary(colors).copyWith(
                      hintText: S.current.field_given_name,
                    ),
                    validator: (value) =>
                        cubit.nameController.text.trim().isEmpty ? '' : null,
                  ),
                  Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        FocusManager.instance.rootScope.unfocus();
                        cubit.update(widget.card);
                      },
                      child: Text(S.current.save)),
                  SafeAreaBottom(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
