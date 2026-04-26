import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/family_tree_node.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'family_tree_state.dart';
part 'family_tree_cubit.freezed.dart';

/// Cubit for the v2 Family Tree screens (Figma section 7).
///
/// Loads raw [RelationUserModel] rows from the API and converts them into
/// the [FamilyTreeNode] forest used by the renderer.
class FamilyTreeCubit extends Cubit<FamilyTreeState> {
  FamilyTreeCubit({required RelationRepo relationRepo})
      : _relationRepo = relationRepo,
        super(FamilyTreeState());

  final RelationRepo _relationRepo;

  /// Load relations for a given cert owner. Pass either [certOwnerId] or
  /// [phoneNumber] — the underlying API accepts either.
  Future<void> load({int? certOwnerId, String? phoneNumber}) async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));
    try {
      final list = await _relationRepo.getRelationList(
        certOwnerId: certOwnerId,
        phoneNumber: phoneNumber,
      );
      final roots = FamilyTreeNode.buildForest(list);
      emit(state.copyWith(
        isLoading: false,
        rawList: list,
        roots: roots,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  /// Toggle selection of a node. Passing the currently selected id clears
  /// the selection.
  void selectNode(int id) {
    if (state.selectedId == id) {
      emit(state.copyWith(selectedId: null));
    } else {
      emit(state.copyWith(selectedId: id));
    }
  }

  void clearSelection() {
    if (state.selectedId == null) return;
    emit(state.copyWith(selectedId: null));
  }
}
