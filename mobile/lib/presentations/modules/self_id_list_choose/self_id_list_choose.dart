import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/item.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/presentations/modules/self_id_list/cubit/self_id_list_cubit.dart';
import 'package:base_flutter/presentations/modules/request_verification/request_verification.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SelfIdListChoosePage extends StatefulWidget {
  const SelfIdListChoosePage({super.key});

  @override
  State<SelfIdListChoosePage> createState() => _SelfIdListChoosePageState();
}

class _SelfIdListChoosePageState extends State<SelfIdListChoosePage> {
  final appCubit = Injector.getIt<AppCubit>();
  final chatController = TextEditingController();

  int? selfId;
  int? eventId;
  SelfIdListChooseType type = SelfIdListChooseType.veriry;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final extra = GoRouterState.of(context).extra;
    if (extra is SelfIdListChooseType) {
      type = extra;
    } else if (extra is Map) {
      type = extra['type'] as SelfIdListChooseType;
      eventId = extra['eventId'] as int?;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = context.theme;

    return BlocProvider(
      create: (context) => SelfIdListCubit()
        ..init(status: type == SelfIdListChooseType.checkInOut),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(title: S.current.ownedIdList),
              SizedBox(height: 24.h),
              Text(
                S.current.selectIdToSubmit,
                style: theme.textTheme.titleLarge,
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: BlocBuilder<SelfIdListCubit, SelfIdListState>(
                  builder: (context, state) {
                    if (state.isLoading && state.cards.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.cards.isEmpty) {
                      return Center(child: Text(S.current.noCardsFound));
                    }

                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: state.cards.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 8.h),
                      itemBuilder: (context, index) {
                        final item = state.cards[index];
                        final isSelected = selfId == item.id;

                        return Item(
                          icon: Assets.icons.card.svg(),
                          title: '${item.name ?? 'ID'} #${item.id}',
                          subTitle: item.issuedDate != null
                              ? '(${S.current.info_issued_date(item.issuedDate!.replaceAll('-', '.'))})'
                              : '',
                          isSelected: isSelected,
                          onPress: () {
                            setState(() {
                              selfId = item.id;
                            });
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (selfId == null) {
                    return;
                  }

                  switch (type) {
                    case SelfIdListChooseType.veriry:
                      AppNavigator.push(
                        Routes.requestVerification,
                        {
                          'cardId': selfId,
                        },
                      );
                      return;

                    case SelfIdListChooseType.checkInOut:
                      AppNavigator.push(Routes.checkInOut, {
                        'cardId': selfId,
                        'eventId': eventId,
                      });
                      return;

                    case SelfIdListChooseType.contact:
                      AppNavigator.push(Routes.contactPicker, selfId);
                      return;
                  }
                },
                child: Text(S.current.submit),
              ),
              SafeArea(top: false, child: SizedBox(height: 4.h)),
            ],
          ),
        ),
      ),
    );
  }
}

enum SelfIdListChooseType {
  veriry,
  checkInOut,
  contact,
}
