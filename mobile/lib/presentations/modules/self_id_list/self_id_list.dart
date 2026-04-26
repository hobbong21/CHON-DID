import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/presentations/modules/chat_bot/widgets/input_chat.dart';
import 'package:base_flutter/presentations/modules/self_id_list/cubit/self_id_list_cubit.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/item.dart';
import 'package:base_flutter/presentations/widgets/safe_area_bottom.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // 👇 Import Bloc
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelfIdList extends StatefulWidget {
  const SelfIdList({super.key});

  @override
  State<SelfIdList> createState() => _SelfIdListState();
}

class _SelfIdListState extends State<SelfIdList> {
  final appCubit = Injector.getIt<AppCubit>();
  final chatController = TextEditingController();
  final cubit = SelfIdListCubit();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocProvider(
      create: (context) => cubit..init(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<SelfIdListCubit, SelfIdListState>(
            builder: (context, state) {
              if (state.isLoading && state.cards.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.cards.isEmpty) {
                return Center(child: Text(S.current.noCardsFound));
              }
              return Column(
                children: [
                  Header(title: S.current.ownedIdList),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.only(top: 24.h),
                      itemCount: state.cards.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 8.h),
                      itemBuilder: (context, index) {
                        final item = state.cards[index];

                        return Item(
                          isSelected: state.cardsSelected.contains(item),
                          icon: Assets.icons.card.svg(),
                          title: '${item.name ?? 'Self ID'} #${item.id}',
                          subTitle: item.issuedDate != null
                              ? '(${S.current.info_issued_date(item.issuedDate!.replaceAll('-', '.'))})'
                              : '',
                          onPress: () {
                            if (state.selectMode) {
                              cubit.selectItem(item);
                            } else {
                              AppNavigator.push(Routes.requestVerification, {
                                'cardId': item.id,
                                'isViewFamily': true,
                              });
                            }
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            cubit.changeSelectMode(!state.selectMode);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: !state.selectMode
                                ? colors.primary
                                : colors.lightYellow,
                            foregroundColor: !state.selectMode
                                ? colors.white
                                : ChonColors.textSecondary,
                          ),
                          child: Text(!state.selectMode
                              ? S.current.action_select
                              : S.current.cancel),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              if (!state.selectMode ||
                                  state.cardsSelected.isEmpty) {
                                return;
                              }
                              cubit.showDialogDelete();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: state.selectMode
                                  ? colors.primary
                                  : colors.lightYellow,
                              foregroundColor: state.selectMode
                                  ? colors.white
                                  : ChonColors.textSecondary,
                            ),
                            child: Text(
                              !state.selectMode
                                  ? S.current.action_delete
                                  : '${S.current.action_delete} (${state.cardsSelected.length})',
                            )),
                      ),
                    ],
                  ),
                  SafeAreaBottom(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
