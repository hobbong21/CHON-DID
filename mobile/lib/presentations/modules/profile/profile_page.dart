import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/storage/app_shared_preferences.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/presentations/modules/chat_bot/widgets/input_chat.dart';
import 'package:base_flutter/presentations/modules/profile/cubit/profile_cubit.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/item.dart';
import 'package:base_flutter/presentations/widgets/safe_area_bottom.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ProfilePage extends StatefulWidget {
  final int? cardId;
  const ProfilePage({super.key, this.cardId});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final appCubit = Injector.getIt<AppCubit>();
  final cubit = ProfileCubit();
  final chatController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        cubit.loadData(widget.cardId);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = context.theme;

    return BlocProvider(
      create: (context) => cubit,
      child:
          BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
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
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Header(title: S.current.menuTitle),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 24.h),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            width: 120.h,
                            height: 120.h * 4 / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Image.network(
                              state.firstCard?.imgPath ?? '',
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                    color: colors.grey.withAlpha(40));
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (state.firstCard != null)
                            Positioned(
                              bottom: -14.r,
                              right: -14.r,
                              child: IconButton(
                                onPressed: () {
                                  AppNavigator.push(
                                    Routes.profileEdit,
                                    state.firstCard,
                                  ).then(
                                    (value) {
                                      if (value == true) {
                                        cubit.loadData();
                                      }
                                    },
                                  );
                                },
                                style: IconButton.styleFrom(
                                  backgroundColor: colors.white,
                                ),
                                icon: Assets.icons.pen.svg(width: 20.r),
                              ),
                            )
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(state.firstCard?.name ?? ''),
                      SizedBox(height: 24.h),
                      Item(
                        icon: Assets.icons.userGroup2.svg(),
                        title: S.current.ownedIdList,
                        onPress: () {
                          AppNavigator.push(Routes.selfIdList);
                        },
                      ),
                      SizedBox(height: 8.h),
                      Item(
                        icon: Assets.icons.lang.svg(),
                        title: S.current.languageOption,
                        subTitle: LanguageSetting.values
                            .byName(appCubit.state.locale)
                            .getTitle(),
                        onPress: () {
                          showLangPopup(theme);
                        },
                      ),
                      SizedBox(height: 8.h),
                      Item(
                        icon: Assets.icons.terms.svg(),
                        title: S.current.termsOfService,
                        onPress: () {
                          AppNavigator.push(Routes.termService);
                        },
                      ),
                      SizedBox(height: 8.h),
                      Item(
                        icon: Assets.icons.lock.svg(),
                        title: S.current.privacyPolicy,
                        onPress: () {
                          AppNavigator.push(Routes.privacyPolicy);
                        },
                      ),
                      SizedBox(height: 8.h),
                      Item(
                        icon: Assets.icons.report.svg(),
                        title: S.current.reportProblem,
                        onPress: () {
                          AppNavigator.push(Routes.reportPage);
                        },
                      ),
                    ],
                  ),
                ),
                InputChat(
                  controller: chatController,
                  onTapSend: () {
                    AppNavigator.push(Routes.chat, chatController.text);
                    chatController.clear();
                  },
                ),
                SafeAreaBottom(),
              ],
            ),
          ),
        );
      }),
    );
  }

  showLangPopup(ThemeData theme) {
    final colors = context.colors;
    showDialog(
      context: context,
      builder: (context) {
        String? langCode = AppSP.get(AppSP.languageLocale);
        LanguageSetting? lang =
            langCode != null ? LanguageSetting.values.byName(langCode) : null;
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(S.current.appLanguage,
                      style: theme.textTheme.titleMedium),
                ),
                SizedBox(height: 12.h),
                Divider(height: 1),
                SizedBox(height: 12.h),
                CheckboxListTile(
                  value: lang == null,
                  onChanged: (v) {
                    setState(() {
                      lang = null;
                    });
                  },
                  activeColor: colors.primary,
                  checkColor: Colors.white,
                  side: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  title: Text(S.current.systemDefault),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                for (final l in LanguageSetting.values) ...[
                  SizedBox(height: 12.h),
                  CheckboxListTile(
                    value: lang?.name == l.name,
                    onChanged: (v) {
                      setState(() {
                        lang = l;
                      });
                    },
                    activeColor: colors.primary,
                    checkColor: Colors.white,
                    side: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    title: Text(l.getTitle()),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ],
                SizedBox(height: 12.h),
                Divider(height: 1),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: () {
                          appCubit.onChangeLanguage(lang);
                          AppNavigator.pop();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(120.r, 44.r),
                        ),
                        child: Text(S.current.confirm)),
                  ),
                ),
                SizedBox(height: 12.h),
              ],
            ),
          );
        });
      },
    );
  }
}
