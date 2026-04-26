import 'package:base_flutter/app.dart';
import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/data/models/self_id/verifier_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/domain/repositories/verify_repo.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/presentations/modules/verification_finish/verification_finish_page.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'confirm_relationship_state.dart';
part 'confirm_relationship_cubit.freezed.dart';

class ConfirmRelationshipCubit extends Cubit<ConfirmRelationshipState> {
  ConfirmRelationshipCubit() : super(const ConfirmRelationshipState());

  final vefifyRepo = Injector.getIt<VerifyRepo>();
  final selfIdRepo = Injector.getIt<SelfIdRepo>();
  final relationRepo = Injector.getIt<RelationRepo>();
  final appCubit = Injector.getIt<AppCubit>();

  String? _token;

  Future<void> load(String token) async {
    emit(state.copyWith(isLoading: true));
    await Future.wait([
      getCardInfoDetail(token),
      getCardOwner(),
    ]);
    await getRelationUser();
    emit(state.copyWith(isLoading: false));
  }

  Future<void> getCardInfoDetail(String token) async {
    try {
      _token = token;
      emit(state.copyWith(messageError: ''));
      final result = await vefifyRepo.getCardInfoVerify(token: token);
      emit(state.copyWith(info: result));
    } catch (e) {
      emit(state.copyWith(messageError: e.toString()));
    }
  }

  Future<void> getCardOwner() async {
    try {
      final response = await selfIdRepo.getListCardInfo(
        body: ListCardInfoRequest(page: 1, size: 10),
      );

      emit(state.copyWith(
        owner: response.list?.firstOrNull,
      ));
    } catch (e) {
      emit(state.copyWith(messageError: e.toString()));
    }
  }

  Future<void> getRelationUser() async {
    try {
      if (state.info?.id == null ||
          state.owner?.phoneNumber?.isNotEmpty != true) {
        return;
      }
      emit(state.copyWith(messageError: ''));
      final result = await relationRepo.getRelationList(
        certOwnerId: state.info!.id,
        // phoneNumber: state.owner!.phoneNumber,
      );
      emit(state.copyWith(
        relation: result
            .where(
              (e) =>
                  e.certRelatedPhone?.replaceAll(' ', '') ==
                  state.owner!.phoneNumber?.replaceAll(' ', ''),
            )
            .firstOrNull,
      ));
    } catch (e) {
      emit(state.copyWith(messageError: e.toString()));
    }
  }

  Future<void> onTapRefusal() async {
    try {
      emit(state.copyWith(isLoading: true, messageError: ''));
      await vefifyRepo.rejectVerify(
        verifyType: VerifyTypeE.selfId.index,
        refVerifyId: state.info!.id!,
      );
      emit(state.copyWith(isLoading: false));
      appCubit.needRefreshHome = true;
      showDialogRefusalSuccess();
    } catch (e) {
      emit(state.copyWith(isLoading: false, messageError: e.toString()));
    }
  }

  Future<void> onTapApproval() async {
    try {
      emit(state.copyWith(isLoadingBlock: true, messageError: ''));
      await vefifyRepo.confirmVerify(
        verifyType: VerifyTypeE.selfId.index,
        refVerifyId: state.info!.id!,
      );
      await Future.wait([
        updateRelation(),
        Future.delayed(Duration(seconds: 1)),
      ]);
      appCubit.needRefreshHome = true;
      if (_token != null) {
        final result = await vefifyRepo.getCardInfoVerify(token: _token!);
        AppNavigator.replace(Routes.verificationFinish, {
          'type': VerificationFinishType.auth,
          'txId': result.txId,
          'onConfirm': () {
            AppNavigator.replace(Routes.requestVerification, {
              'cardId': state.owner?.id,
              'isViewFamily': true,
            });
          }
        });
      } else {
        AppNavigator.replace(Routes.requestVerification, {
          'cardId': state.owner?.id,
          'isViewFamily': true,
        });
        AppUtils.showSnackBarSuccess(
          context: AppNavigator.context,
          title: S.current.success,
        );
      }
      emit(state.copyWith(isLoadingBlock: false));
    } catch (e) {
      emit(state.copyWith(isLoadingBlock: false, messageError: e.toString()));
    }
  }

  Future<void> updateRelation() async {
    if (state.relation?.id == null || state.owner?.id == null) {
      return;
    }
    try {
      emit(state.copyWith(messageError: ''));
      await relationRepo.updateRelation(
        id: state.relation?.id,
        certRelatedId: state.owner?.id,
      );
    } catch (e) {
      emit(state.copyWith(messageError: e.toString()));
    }
  }

  showDialogRefusalSuccess() {
    showDialog(
      context: AppNavigator.context,
      builder: (context) {
        final colors = context.colors;
        return Dialog(
          backgroundColor: colors.lightYellow,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 24.w),
            child: Text(
              S.current.authRejected,
              style: context.theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    ).then(
      (value) {
        AppNavigator.pop();
      },
    );
  }
}
