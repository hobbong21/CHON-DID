import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/family_tree/family_tree_page.dart';
import 'package:base_flutter/presentations/modules/verification_cross/cubit/verification_cross_cubit.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'input_contact_cubit.dart';

class InputContact extends StatefulWidget {
  final RelationUserModel relation;
  const InputContact({super.key, required this.relation});

  @override
  State<InputContact> createState() => _InputContactState();
}

class _InputContactState extends State<InputContact> {
  late final InputContactCubit cubit;
  late VerificationCrossCubit verificationCross;

  @override
  void initState() {
    super.initState();
    cubit = InputContactCubit(widget.relation, context.read());
    cubit.nameController.text = widget.relation.certRelatedName ?? '';
    verificationCross = context.read<VerificationCrossCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocConsumer<InputContactCubit, InputContactState>(
        listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            AppUtils.showSnackBarError(
                context: context, title: state.errorMessage);
            cubit.clearMessage();
          }
        },
        bloc: cubit,
        builder: (context, state) {
          final isDupPhone = cubit.searchContracts.isNotEmpty;
          final hasErr = isDupPhone ||
              (state.relation.certRelatedName?.isNotEmpty == true &&
                  (state.relation.certRelatedPhone?.isEmpty ?? true));
          final borderColor = state.relation.status == StatusRelationE.agree
              ? colors.darkGreen
              : state.relation.status == StatusRelationE.disagree
                  ? colors.darkYellow
                  : hasErr
                      ? colors.red
                      : colors.primary;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: ScreenUtil().screenWidth * 0.3,
                    child: TextField(
                      controller: cubit.nameController,
                      onChanged: (value) {
                        cubit.updateName(value);
                        cubit.searchContract(verificationCross.contracts);
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        enabled:
                            state.relation.status == StatusRelationE.unVerified,
                        hintText: S.current.enter,
                        fillColor: colors.background,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: borderColor, width: 3),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: borderColor, width: 3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: borderColor, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide:
                                BorderSide(color: borderColor, width: 3)),
                      ),
                      onEditingComplete: () {
                        // cubit.searchContract(verificationCross.contracts);
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                  SizedBox(width: 8.w),
                  ElevatedButton(
                    onPressed: () {
                      AppNavigator.push(
                          Routes.familyTree,
                          FamilyTreeParams(
                            cubit,
                            verificationCross.cardId,
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100.w, 58.r),
                      backgroundColor: cubit.state.relation.relationType != null
                          ? colors.primary
                          : colors.darkYellow,
                      foregroundColor: cubit.state.relation.relationType != null
                          ? colors.white
                          : colors.secondaryText,
                      overlayColor: colors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r)),
                    ),
                    child: Text(cubit.state.relation.relationType != null
                        ? cubit.state.relation.relationType!.title
                        : S.current.relationship),
                  ),
                  SizedBox(width: 8.w),
                  if (state.isLoading)
                    CircularProgressIndicator(color: colors.primary),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (state.relation.certRelatedPhone?.isNotEmpty == true)
                          SizedBox(
                            height: 58.r,
                            child: Center(
                                child: Text(
                                    state.relation.certRelatedPhone ?? '')),
                          ),
                        for (final dupContact in cubit.searchContracts) ...[
                          GestureDetector(
                            onTap: () {
                              cubit.nameController.text =
                                  dupContact.displayName;
                              cubit.updateName(dupContact.displayName);
                              cubit.updatePhoneNumber(
                                  dupContact.phones[0].number);
                              FocusScope.of(context).unfocus();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 58.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(58.r),
                                border: Border.all(color: colors.red, width: 3),
                              ),
                              child: Text(dupContact.phones[0].number),
                            ),
                          ),
                          SizedBox(height: 8.h),
                        ]
                      ],
                    ),
                  ),
                ],
              ),
              if (isDupPhone)
                Row(
                  children: [
                    Assets.icons.required.svg(width: 20.r),
                    SizedBox(width: 12.w),
                    Expanded(child: Text(S.current.duplicateNameSelectNumber)),
                  ],
                ),
            ],
          );
        });
  }
}

class Verifier {
  String? name;
  String? relationship;
  String? phoneNumber;
}
