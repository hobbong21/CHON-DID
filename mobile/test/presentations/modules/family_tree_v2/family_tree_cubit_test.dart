import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/cubit/family_tree_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRelationRepo extends Mock implements RelationRepo {}

void main() {
  late _MockRelationRepo repo;

  setUp(() {
    repo = _MockRelationRepo();
  });

  group('FamilyTreeCubit.load', () {
    blocTest<FamilyTreeCubit, FamilyTreeState>(
      'success → loading then roots',
      build: () {
        when(() => repo.getRelationList(
              certOwnerId: any(named: 'certOwnerId'),
              phoneNumber: any(named: 'phoneNumber'),
            )).thenAnswer((_) async => const [
              RelationUserModel(id: 1, cardName: 'P'),
              RelationUserModel(id: 2, parentId: 1, cardName: 'C'),
            ]);
        return FamilyTreeCubit(relationRepo: repo);
      },
      act: (c) => c.load(certOwnerId: 7),
      expect: () => [
        isA<FamilyTreeState>().having((s) => s.isLoading, 'isLoading', true),
        isA<FamilyTreeState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.rawList.length, 'rawList', 2)
            .having((s) => s.roots.length, 'roots', 1)
            .having((s) => s.roots.first.children.length, 'roots[0].children',
                1),
      ],
      verify: (_) {
        verify(() => repo.getRelationList(certOwnerId: 7, phoneNumber: null))
            .called(1);
      },
    );

    blocTest<FamilyTreeCubit, FamilyTreeState>(
      'failure → error message, empty roots',
      build: () {
        when(() => repo.getRelationList(
              certOwnerId: any(named: 'certOwnerId'),
              phoneNumber: any(named: 'phoneNumber'),
            )).thenThrow(Exception('network'));
        return FamilyTreeCubit(relationRepo: repo);
      },
      act: (c) => c.load(phoneNumber: '01000000000'),
      expect: () => [
        isA<FamilyTreeState>().having((s) => s.isLoading, 'isLoading', true),
        isA<FamilyTreeState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.errorMessage, 'errorMessage', contains('network'))
            .having((s) => s.roots, 'roots', isEmpty),
      ],
    );
  });

  group('selectNode / clearSelection', () {
    blocTest<FamilyTreeCubit, FamilyTreeState>(
      'selectNode sets selectedId',
      build: () => FamilyTreeCubit(relationRepo: repo),
      act: (c) => c.selectNode(42),
      expect: () => [
        isA<FamilyTreeState>().having((s) => s.selectedId, 'selectedId', 42),
      ],
    );

    blocTest<FamilyTreeCubit, FamilyTreeState>(
      'selecting the same node again clears selection',
      build: () => FamilyTreeCubit(relationRepo: repo),
      seed: () => FamilyTreeState(selectedId: 42),
      act: (c) => c.selectNode(42),
      expect: () => [
        isA<FamilyTreeState>().having((s) => s.selectedId, 'selectedId', null),
      ],
    );

    blocTest<FamilyTreeCubit, FamilyTreeState>(
      'clearSelection is a no-op when nothing is selected',
      build: () => FamilyTreeCubit(relationRepo: repo),
      act: (c) => c.clearSelection(),
      expect: () => [],
    );

    blocTest<FamilyTreeCubit, FamilyTreeState>(
      'clearSelection clears when selected',
      build: () => FamilyTreeCubit(relationRepo: repo),
      seed: () => FamilyTreeState(selectedId: 42),
      act: (c) => c.clearSelection(),
      expect: () => [
        isA<FamilyTreeState>().having((s) => s.selectedId, 'selectedId', null),
      ],
    );
  });
}
