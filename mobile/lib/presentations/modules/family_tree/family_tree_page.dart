import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_colors.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/family_tree/cubit/family_tree_cubit.dart';
import 'package:base_flutter/presentations/modules/family_tree/widgets/node_tree_cubit/node_tree_cubit.dart';
import 'package:base_flutter/presentations/modules/verification_cross/input_conract/input_contact_cubit.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/safe_area_bottom.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'widgets/node_tree_view.dart';

class FamilyTreePage extends StatefulWidget {
  const FamilyTreePage({super.key});

  @override
  State<FamilyTreePage> createState() => _FamilyTreePageState();
}

class _FamilyTreePageState extends State<FamilyTreePage> {
  final cubit = FamilyTreeCubit();
  FamilyTreeParams? params;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (params?.cardId != null) {
          cubit.init(params!.cardId);
        }
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    params = GoRouterState.of(context).extra as FamilyTreeParams?;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = context.theme;
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<FamilyTreeCubit, FamilyTreeState>(
          listener: (context, state) {
            if (state.isLoading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
            if (state.messageError.isNotEmpty) {
              AppUtils.showSnackBarError(
                context: context,
                title: state.messageError,
              );
            }
          },
          bloc: cubit,
          builder: (context, state) {
            return BlocListener<NodeTreeCubit, NodeTreeState>(
              bloc: cubit.nodeTreeCubit,
              listener: (context, state) {},
              child: Scaffold(
                floatingActionButton: _buildFloatingActionButton(colors),
                bottomNavigationBar: SafeAreaBottom(
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 12.h, left: 16.w, right: 16.w),
                    decoration: BoxDecoration(
                      color: colors.background,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, -1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: BlocBuilder(
                        bloc: cubit.nodeTreeCubit,
                        builder: (context, _) {
                          return Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: cubit.canChoose
                                      ? () {
                                          final model = cubit.nodeTreeCubit
                                              .state.selectedNode?.model;
                                          if (model?.id != null &&
                                              model?.relationType != null &&
                                              model?.relationType !=
                                                  RelationType.owner) {
                                            if (model?.status !=
                                                StatusRelationE.unVerified) {
                                              AppUtils.showSnackBarError(
                                                context: context,
                                                title:
                                                    'Cannot update this node',
                                              );
                                            } else {
                                              params?.inputContactCubit
                                                  .updateRelationship(
                                                model!.id!,
                                                model.relationType!,
                                              );
                                              AppNavigator.pop();
                                            }
                                          }
                                        }
                                      : null,
                                  child: Text(S.current.select),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: cubit.canDelete
                                      ? () {
                                          cubit.showDialogDelete();
                                        }
                                      : null,
                                  child: Text(S.current.delete),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: cubit.selectedNode != null
                                      ? () {
                                          cubit.addNode();
                                        }
                                      : null,
                                  child: Text(S.current.add),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
                body: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Header(title: S.current.familyTree),
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.h,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: colors.lightYellow,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Colors.black12,
                                spreadRadius: 1,
                                offset: Offset(0, 2),
                              )
                            ]),
                        child: Text(
                          S.current.selectFamilyRelationship,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        S.current.familyEditInstruction,
                        style: theme.textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: NodeTreeView(controller: cubit.nodeTreeCubit),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _buildFloatingActionButton(AppColors colors) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // BlocBuilder<NodeTreeCubit, NodeTreeState>(
        //   bloc: cubit.nodeTreeCubit,
        //   builder: (context, state) {
        //     if (!cubit.canCollapse) {
        //       return SizedBox.shrink();
        //     }
        //     return FloatingActionButton.small(
        //       backgroundColor: colors.lightYellow,
        //       onPressed: () {
        //         cubit.collapseOrExpand();
        //       },
        //       child: Icon(
        //         cubit.selectedNode?.model.isCollapsed == true
        //             ? Icons.open_in_full
        //             : Icons.close_fullscreen,
        //         color: colors.secondaryText,
        //       ),
        //     );
        //   },
        // ),
        FloatingActionButton.small(
          backgroundColor: colors.lightBlue,
          heroTag: 'center',
          onPressed: () {
            cubit.center();
          },
          child: Icon(Icons.my_location, color: colors.darkBlue),
        ),
      ],
    );
  }
}

class FamilyTreeParams {
  final InputContactCubit inputContactCubit;
  final int cardId;

  const FamilyTreeParams(this.inputContactCubit, this.cardId);
}
