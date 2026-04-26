import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_receive/cubit/mutual_auth_receive_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Mutual Auth Receive page (Figma section 5).
///
/// Shows a list of pending requests; tap one to open a detail sheet
/// with Approve / Reject actions. Once the user acts, the cubit moves
/// the request out of the list and shows a success/failure card.
class MutualAuthReceivePage extends StatelessWidget {
  const MutualAuthReceivePage({
    super.key,
    required this.cubit,
  });

  final MutualAuthReceiveCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        backgroundColor: ChonColors.bgPage,
        appBar: AppBar(
          backgroundColor: ChonColors.bgPage,
          foregroundColor: ChonColors.textPrimary,
          elevation: 0,
          centerTitle: true,
          title: Text(S.current.chon_mauth_rcv_title, style: ChonTextStyles.cardTitle()),
        ),
        body: BlocBuilder<MutualAuthReceiveCubit, MutualAuthReceiveState>(
          builder: (context, state) {
            if (state.isLoading && state.requests.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                    color: ChonColors.brandPrimary),
              );
            }

            return Stack(
              children: [
                _RequestList(state: state, cubit: cubit),
                if (state.selected != null)
                  _DetailSheet(state: state, cubit: cubit),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _RequestList extends StatelessWidget {
  const _RequestList({required this.state, required this.cubit});
  final MutualAuthReceiveState state;
  final MutualAuthReceiveCubit cubit;

  @override
  Widget build(BuildContext context) {
    if (state.requests.isEmpty) {
      return Center(
        child: Text(
          state.errorMessage.isNotEmpty
              ? state.errorMessage
              : S.current.chon_mauth_rcv_empty,
          style: ChonTextStyles.body(
              size: 14, color: ChonColors.textSecondary),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      itemCount: state.requests.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, i) {
        final r = state.requests[i];
        return _RequestRow(
          request: r,
          onTap: () => cubit.selectRequest(r),
        );
      },
    );
  }
}

class _RequestRow extends StatelessWidget {
  const _RequestRow({required this.request, required this.onTap});
  final RelationUserModel request;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ChonColors.bgSurface,
      borderRadius: BorderRadius.circular(ChonShape.radiusCard),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(ChonShape.radiusCard),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFFFFE7B8),
                child: Icon(Icons.person_outline,
                    color: ChonColors.textPrimary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      request.certOwnerName ?? S.current.chon_mauth_rcv_anonymous,
                      style: ChonTextStyles.cardTitle().copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      request.certOwnerPhone ?? '-',
                      style: ChonTextStyles.body(
                          size: 13, color: ChonColors.textSecondary),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: ChonColors.textTertiary),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailSheet extends StatelessWidget {
  const _DetailSheet({required this.state, required this.cubit});
  final MutualAuthReceiveState state;
  final MutualAuthReceiveCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Material(
        color: ChonColors.bgSurface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _title(state),
                      style: ChonTextStyles.cardTitle()
                          .copyWith(fontSize: 18),
                    ),
                  ),
                  IconButton(
                    onPressed: cubit.dismiss,
                    icon: const Icon(Icons.close,
                        color: ChonColors.textSecondary),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                state.selected?.certOwnerName ?? '-',
                style: ChonTextStyles.body(size: 14),
              ),
              Text(
                state.selected?.certOwnerPhone ?? '-',
                style: ChonTextStyles.body(
                    size: 13, color: ChonColors.textSecondary),
              ),
              if (state.errorMessage.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  state.errorMessage,
                  style: ChonTextStyles.body(size: 13)
                      .copyWith(color: const Color(0xFFE24B4A)),
                ),
              ],
              const SizedBox(height: 16),
              if (state.stage == MutualAuthReceiveStage.idle)
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: cubit.reject,
                        child: Text(S.current.chon_action_reject),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: cubit.approve,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ChonColors.brandPrimary,
                          foregroundColor: ChonColors.textInverse,
                        ),
                        child: Text(S.current.chon_action_approve),
                      ),
                    ),
                  ],
                )
              else if (state.stage == MutualAuthReceiveStage.approving ||
                  state.stage == MutualAuthReceiveStage.rejecting)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: CircularProgressIndicator(
                        color: ChonColors.brandPrimary),
                  ),
                )
              else
                ElevatedButton(
                  onPressed: cubit.dismiss,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ChonColors.brandPrimary,
                    foregroundColor: ChonColors.textInverse,
                  ),
                  child: Text(S.current.chon_action_confirm),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _title(MutualAuthReceiveState s) {
    switch (s.stage) {
      case MutualAuthReceiveStage.approved:
        return S.current.chon_mauth_rcv_approved;
      case MutualAuthReceiveStage.rejected:
        return S.current.chon_mauth_rcv_rejected;
      case MutualAuthReceiveStage.approving:
        return S.current.chon_mauth_rcv_approving;
      case MutualAuthReceiveStage.rejecting:
        return S.current.chon_mauth_rcv_rejecting;
      case MutualAuthReceiveStage.idle:
        return S.current.chon_mauth_rcv_detail;
    }
  }
}
