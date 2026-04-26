import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/presentations/modules/family_tree/widgets/node_tree_cubit/node_tree_cubit.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'family_tree_state.dart';
part 'family_tree_cubit.freezed.dart';

class FamilyTreeCubit extends Cubit<FamilyTreeState> {
  FamilyTreeCubit() : super(FamilyTreeState());

  final nodeTreeCubit = NodeTreeCubit();

  final relationRepo = Injector.getIt<RelationRepo>();
  final selfIdRepo = Injector.getIt<SelfIdRepo>();

  late int cardId;

  bool get canChoose {
    return selectedNode != null &&
        selectedNode?.model.relationType != RelationType.owner;
  }

  bool get canDelete {
    final type = nodeTreeCubit.state.selectedNode?.model.relationType;
    final cantDelete = type == RelationType.grandfather ||
        type == RelationType.maternalGrandfather ||
        type == RelationType.father ||
        type == RelationType.mother ||
        type == RelationType.owner;
    return selectedNode != null && !cantDelete;
  }

  init(int cardId) {
    this.cardId = cardId;
    getRelationUser();
    getRelationType();
  }

  Future<void> getRelationUser({bool reset = true}) async {
    try {
      emit(state.copyWith(isLoading: true, messageError: ''));
      final result = await relationRepo.getRelationList(certOwnerId: cardId);
      final relationUserUpdatedOwnerName = result
          .map((e) => e.relationType == RelationType.owner
              ? e.copyWith(
                  certRelatedName: e.cardName,
                )
              : e)
          .toList();
      nodeTreeCubit.updateRootFromRelationUser(relationUserUpdatedOwnerName);
      if (reset) center();
      emit(state.copyWith(
        isLoading: false,
        relationUser: relationUserUpdatedOwnerName,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, messageError: e.toString()));
    }
  }

  void center() {
    nodeTreeCubit.fitToScreen();
  }

  Future<void> getRelationType() async {
    try {
      emit(state.copyWith(isLoading: true, messageError: ''));
      final result = await relationRepo.getListRelationType();
      emit(state.copyWith(
        isLoading: false,
        relationTypeList: result,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, messageError: e.toString()));
    }
  }

  void showDialogDelete() {
    if (!canDelete) return;
    AppUtils.showConfirmDialog(
      context: AppNavigator.context,
      content: S.current.confirmDelete,
      onConfirm: () {
        _deleteNode(nodeTreeCubit.state.selectedNode!);
        AppNavigator.pop();
      },
    );
  }

  void addNode() {
    final selectedNode = nodeTreeCubit.state.selectedNode;
    if (selectedNode == null) {
      return;
    }
    final typeOfSelectedNode = selectedNode.model.relationType;
    final haveSpouse =
        selectedNode.fullSpouse != null || selectedNode.model.spouseId != null;
    final listType = <RelationAddType>[];

    if (typeOfSelectedNode != RelationType.grandfather &&
        typeOfSelectedNode != RelationType.maternalGrandfather &&
        (selectedNode.model.spouseId == null ||
            selectedNode.model.relationType == RelationType.mother)) {
      listType.addAll([
        RelationAddType.elderBrother,
        RelationAddType.littleBrother,
        RelationAddType.elderSister,
        RelationAddType.littleSister,
      ]);
    }
    if (!haveSpouse) {
      if (selectedNode.model.gender == GenderE.female) {
        listType.add(RelationAddType.husband);
      } else {
        listType.add(RelationAddType.wife);
      }
    }
    listType.addAll([
      RelationAddType.son,
      RelationAddType.daughter,
    ]);
    if (listType.isEmpty) {
      return;
    }
    showDialog(
      context: AppNavigator.context,
      builder: (context) {
        final columns = List.generate(
          (RelationAddType.values.length / 2).floor(),
          (index) {
            return [
              RelationAddType.values.elementAtOrNull(index * 2),
              RelationAddType.values.elementAtOrNull(index * 2 + 1),
            ];
          },
        );
        return Dialog(
          insetPadding: EdgeInsets.all(100.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final rows in columns) ...[
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (final t in rows) ...[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 2.h),
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Color(0xffFEF8E8),
                                  minimumSize: Size(71.r, 52.r),
                                ),
                                onPressed: listType.contains(t)
                                    ? () async {
                                        var type = RelationType.owner;
                                        int relationId = selectedNode.id;
                                        var gender = GenderE.male;
                                        if (t == RelationAddType.husband ||
                                            t == RelationAddType.wife) {
                                          gender = selectedNode.model.gender ==
                                                  GenderE.male
                                              ? GenderE.female
                                              : GenderE.male;
                                          type = typeOfSelectedNode!
                                              .spouse(gender);
                                        } else if (t ==
                                            RelationAddType.elderBrother) {
                                          gender = GenderE.male;
                                          type = typeOfSelectedNode!
                                              .elderSibling(gender);
                                          relationId =
                                              selectedNode.model.parentId ?? -1;
                                        } else if (t ==
                                            RelationAddType.littleBrother) {
                                          gender = GenderE.male;
                                          type = typeOfSelectedNode!
                                              .littleSibling(gender);
                                          relationId =
                                              selectedNode.model.parentId ?? -1;
                                        } else if (t ==
                                            RelationAddType.elderSister) {
                                          gender = GenderE.female;
                                          type = typeOfSelectedNode!
                                              .elderSibling(gender);
                                          relationId =
                                              selectedNode.model.parentId ?? -1;
                                        } else if (t ==
                                            RelationAddType.littleSister) {
                                          gender = GenderE.female;
                                          type = typeOfSelectedNode!
                                              .littleSibling(gender);
                                          relationId =
                                              selectedNode.model.parentId ?? -1;
                                        } else if (t == RelationAddType.son) {
                                          gender = GenderE.male;
                                          type =
                                              typeOfSelectedNode!.child(gender);
                                          if (selectedNode.model.spouseId !=
                                              null) {
                                            relationId =
                                                selectedNode.model.spouseId!;
                                          }
                                        } else if (t ==
                                            RelationAddType.daughter) {
                                          gender = GenderE.female;
                                          type =
                                              typeOfSelectedNode!.child(gender);
                                          if (selectedNode.model.spouseId !=
                                              null) {
                                            relationId =
                                                selectedNode.model.spouseId!;
                                          }
                                        }
                                        await _addNode(
                                          gender: gender,
                                          type: type,
                                          parentId:
                                              (t != RelationAddType.husband &&
                                                      t != RelationAddType.wife)
                                                  ? relationId
                                                  : null,
                                          spouseId:
                                              !(t != RelationAddType.husband &&
                                                      t != RelationAddType.wife)
                                                  ? relationId
                                                  : null,
                                        );
                                        AppNavigator.pop();
                                      }
                                    : null,
                                child: Text(t?.title ?? ''),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h),
                ]
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _deleteNode(PersonNode node) async {
    try {
      emit(state.copyWith(isLoading: true, messageError: ''));
      await relationRepo.deleteRelation(
        id: node.model.id,
      );
      emit(state.copyWith(isLoading: false));
      getRelationUser(reset: false);
    } catch (e) {
      emit(state.copyWith(isLoading: false, messageError: e.toString()));
    }
  }

  Future<void> _addNode({
    required RelationType type,
    required GenderE gender,
    int? parentId,
    int? spouseId,
  }) async {
    try {
      final types = state.relationTypeList.where((e) => e.type == type);
      final relationId = types.firstOrNull?.id;
      if (relationId == null) {
        return;
      }
      emit(state.copyWith(isLoading: true, messageError: ''));
      await relationRepo.createRelation(
        gender: gender,
        certOwnerId: cardId,
        relationId: relationId,
        parentId: parentId,
        spouseId: spouseId,
      );
      emit(state.copyWith(isLoading: false));
      getRelationUser(reset: false);
    } catch (e) {
      emit(state.copyWith(isLoading: false, messageError: e.toString()));
    }
  }

  PersonNode? get selectedNode => nodeTreeCubit.state.selectedNode;

  bool get canCollapse =>
      selectedNode != null &&
      selectedNode!.model.spouseId == null &&
      (selectedNode!.fullChildren.isNotEmpty ||
          selectedNode!.fullSpouse != null);

  collapseOrExpand() async {
    if (selectedNode == null) return;
    try {
      emit(state.copyWith(isLoading: true, messageError: ''));
      await relationRepo.updateRelation(
        id: selectedNode!.id,
        isCollapsed: !(selectedNode!.model.isCollapsed ?? false),
      );
      emit(state.copyWith(isLoading: false));
      await getRelationUser();
    } catch (e) {
      emit(state.copyWith(isLoading: false, messageError: e.toString()));
    }
  }
}

enum RelationAddType {
  father,
  mother,
  husband,
  wife,
  elderBrother,
  littleBrother,
  elderSister,
  littleSister,
  son,
  daughter,
}

extension RelationAddTypeExt on RelationAddType {
  String get title => switch (this) {
        RelationAddType.father => S.current.father_2,
        RelationAddType.mother => S.current.mother_2,
        RelationAddType.husband => S.current.husband,
        RelationAddType.wife => S.current.wife,
        RelationAddType.elderBrother => S.current.elder_brother,
        RelationAddType.littleBrother => S.current.little_brother,
        RelationAddType.elderSister => S.current.elder_sister,
        RelationAddType.littleSister => S.current.little_sister,
        RelationAddType.son => S.current.son2,
        RelationAddType.daughter => S.current.daughter2,
      };
}

// final fake = [
//   RelationUserModel(
//     id: 1,
//     gender: GenderE.male,
//     relationType: RelationType.grandfather,
//   ),
//   RelationUserModel(
//     id: 14,
//     gender: GenderE.female,
//     relationType: RelationType.grandma,
//     spouseId: 1,
//   ),
//   RelationUserModel(
//     id: 10,
//     gender: GenderE.male,
//     relationType: RelationType.uncle,
//     parentId: 1,
//   ),
//   RelationUserModel(
//     id: 19,
//     gender: GenderE.female,
//     relationType: RelationType.auntUncleWife,
//     spouseId: 10,
//   ),
//   RelationUserModel(
//     id: 24,
//     gender: GenderE.male,
//     relationType: RelationType.cousinBrother,
//     parentId: 10,
//   ),
//   RelationUserModel(
//     id: 25,
//     gender: GenderE.female,
//     relationType: RelationType.cousinSisterInLaw,
//     spouseId: 24,
//   ),
//   RelationUserModel(
//     id: 28,
//     gender: GenderE.male,
//     relationType: RelationType.secondCousin,
//     parentId: 24,
//   ),
//   RelationUserModel(
//     id: 29,
//     gender: GenderE.male,
//     relationType: RelationType.secondCousin,
//     parentId: 24,
//   ),
//   RelationUserModel(
//     id: 17,
//     gender: GenderE.female,
//     relationType: RelationType.cousinSister,
//     parentId: 10,
//   ),
//   RelationUserModel(
//     id: 18,
//     gender: GenderE.male,
//     relationType: RelationType.cousinBrotherInLaw,
//     spouseId: 17,
//   ),
//   RelationUserModel(
//     id: 20,
//     gender: GenderE.male,
//     relationType: RelationType.secondCousin,
//     parentId: 17,
//   ),
//   RelationUserModel(
//     id: 21,
//     gender: GenderE.female,
//     relationType: RelationType.secondCousin,
//     parentId: 17,
//   ),
//   RelationUserModel(
//     id: 2,
//     gender: GenderE.male,
//     relationType: RelationType.father,
//     parentId: 1,
//   ),
//   RelationUserModel(
//     id: 15,
//     gender: GenderE.female,
//     relationType: RelationType.mother,
//     spouseId: 2,
//   ),
//   RelationUserModel(
//     id: 7,
//     gender: GenderE.male,
//     relationType: RelationType.brother,
//     parentId: 2,
//   ),
//   RelationUserModel(
//     id: 3,
//     gender: GenderE.male,
//     relationType: RelationType.owner,
//     parentId: 2,
//   ),
//   RelationUserModel(
//     id: 26,
//     gender: GenderE.female,
//     relationType: RelationType.wife,
//     spouseId: 3,
//   ),
//   RelationUserModel(
//     id: 16,
//     gender: GenderE.female,
//     relationType: RelationType.sisterInLaw,
//     spouseId: 7,
//   ),
//   RelationUserModel(
//     id: 12,
//     gender: GenderE.male,
//     relationType: RelationType.nephew,
//     parentId: 7,
//   ),
//   RelationUserModel(
//     id: 27,
//     gender: GenderE.female,
//     relationType: RelationType.niece,
//     parentId: 7,
//   ),
//   RelationUserModel(
//     id: 4,
//     gender: GenderE.male,
//     relationType: RelationType.son,
//     parentId: 3,
//   ),
//   RelationUserModel(
//     id: 6,
//     gender: GenderE.female,
//     relationType: RelationType.daughter,
//     parentId: 3,
//   ),
// ];
