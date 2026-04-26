import 'dart:ui';
import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_colors.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/flavors.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/contact_picker/cubit/contact_picker_cubit.dart';
import 'package:base_flutter/presentations/modules/family_tree/cubit/family_tree_cubit.dart';
import 'package:base_flutter/presentations/modules/family_tree/widgets/node_tree_cubit/node_tree_cubit.dart';
import 'package:base_flutter/presentations/modules/family_tree/widgets/node_tree_view.dart';
import 'package:base_flutter/presentations/modules/contact_picker/widgets/member_detail_dialog.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/safe_area_bottom.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ContactPickerPage extends StatefulWidget {
  const ContactPickerPage({super.key});

  @override
  State<ContactPickerPage> createState() => _ContactPickerPageState();
}

class _ContactPickerPageState extends State<ContactPickerPage> {
  final cubit = FamilyTreeCubit();
  final contact_cubit = ContactPickerCubit();

  final ValueNotifier<bool> _blurNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            final cardId = GoRouterState.of(context).extra as int?;
            if (cardId != null) {
              cubit.init(cardId);
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _blurNotifier.dispose();
    super.dispose();
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
            listenWhen: (previous, current) {
              return current.selectedNode != null &&
                  current.selectedNode != previous.selectedNode;
            },
            listener: (context, nodeState) async {
              if (mounted) {
                _blurNotifier.value = true;
              }
              if (mounted) {
                final imgPath = cubit.selectedNode?.model.imgPath;
                MemberDetailDialog.show(
                  cubit: contact_cubit,
                  context,
                  name: cubit.selectedNode?.model.certRelatedName ?? '',
                  relationship:
                      cubit.selectedNode?.model.relationType?.title ?? '',
                  phoneNumber: cubit.selectedNode?.model.certRelatedPhone ?? '',
                  avatar: imgPath != null ? F.imageUrl(imgPath) : '',
                ).then((_) {
                  if (mounted) {
                    _blurNotifier.value = false;
                    cubit.nodeTreeCubit.selectNode(null);
                  }
                });
              }
            },
            child: Stack(
              children: [
                Scaffold(
                  // floatingActionButton: _buildFloatingActionButton(colors),
                  // bottomNavigationBar: const _SharedBottomBar(),
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
                              horizontal: 32.h, vertical: 12.h),
                          decoration: BoxDecoration(
                            color: colors.lightYellow,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            S.current.hint_select_contact,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ClipRect(
                          child: RepaintBoundary(
                            child:
                                NodeTreeView(controller: cubit.nodeTreeCubit),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: _blurNotifier,
                  builder: (context, showBlur, child) {
                    if (!showBlur) return const SizedBox.shrink();

                    return Positioned.fill(
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: Container(
                                  color: Colors.black.withOpacity(0.1),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              color: colors.background,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Container(
                                height: 100.h,
                                alignment: const Alignment(1.0, 0.8),
                                child: Text(
                                  S.current.familyTree,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // const Positioned(
                          //   bottom: 0,
                          //   left: 0,
                          //   right: 0,
                          //   child: _SharedBottomBar(),
                          // ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFloatingActionButton(AppColors colors) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<NodeTreeCubit, NodeTreeState>(
          bloc: cubit.nodeTreeCubit,
          builder: (context, state) {
            return Column(
              children: [
                if (cubit.canCollapse)
                  FloatingActionButton.small(
                    heroTag: 'collapseOrExpand',
                    backgroundColor: colors.lightYellow,
                    onPressed: () {
                      cubit.collapseOrExpand();
                    },
                    child: Icon(
                      cubit.selectedNode?.model.isCollapsed == true
                          ? Icons.open_in_full
                          : Icons.close_fullscreen,
                      color: colors.secondaryText,
                    ),
                  ),
                if (cubit.selectedNode != null)
                  FloatingActionButton.small(
                    heroTag: 'info',
                    backgroundColor: colors.lightGreen,
                    onPressed: () {
                      if (mounted) {
                        _blurNotifier.value = true;
                      }
                      if (mounted) {
                        final imgPath = cubit.selectedNode?.model.imgPath;
                        MemberDetailDialog.show(
                          cubit: contact_cubit,
                          context,
                          name: cubit.selectedNode?.model.certRelatedName ?? '',
                          relationship:
                              cubit.selectedNode?.model.relationType?.title ??
                                  '',
                          phoneNumber:
                              cubit.selectedNode?.model.certRelatedPhone ?? '',
                          avatar: imgPath != null ? F.imageUrl(imgPath) : '',
                        ).then((_) {
                          if (mounted) {
                            _blurNotifier.value = false;
                          }
                        });
                      }
                    },
                    child: Icon(
                      Icons.info_outline,
                      color: colors.darkGreen,
                    ),
                  ),
              ],
            );
          },
        ),
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

class _SharedBottomBar extends StatelessWidget {
  const _SharedBottomBar();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SafeAreaBottom(
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color: colors.white,
          border: Border(
            top: BorderSide(color: const Color(0xFFEEEEEE)),
          ),
        ),
        child: Row(
          children: [
            _buildActionButton(
              context,
              icon: Assets.icons.phone.svg(
                colorFilter: ColorFilter.mode(colors.hintText, BlendMode.srcIn),
              ),
              label: S.current.groupCall,
              onTap: () {},
            ),
            _buildActionButton(
              context,
              icon: Assets.icons.chat.svg(
                colorFilter: ColorFilter.mode(colors.hintText, BlendMode.srcIn),
              ),
              label: S.current.groupChat,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required Widget icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final colors = context.colors;
    final theme = context.theme;

    return Expanded(
      child: Material(
        color: colors.background,
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20.sp, height: 20.sp, child: icon),
              SizedBox(height: 4.h),
              Text(
                label,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colors.hintText,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
