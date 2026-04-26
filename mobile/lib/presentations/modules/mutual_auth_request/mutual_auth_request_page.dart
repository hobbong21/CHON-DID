import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_request/cubit/mutual_auth_request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Stage-driven shell for the Mutual Auth Request flow.
///
/// Render decision is made entirely off [MutualAuthRequestState.stage]. Each
/// stage maps to one of the Figma frames (column 4):
///
/// | Stage      | Figma             | Status           |
/// |------------|-------------------|------------------|
/// | search     | `MutualAuthReq_01` (`312:19987`) | implemented (`_SearchStep`) |
/// | confirm    | `MutualAuthReq_02` (`312:20097`) | implemented (`_ConfirmStep`)|
/// | sending    | `MutualAuthReq_03` (`312:20291`) | placeholder, see TODO        |
/// | awaiting   | `MutualAuthReq_04` (`312:20242`) | placeholder, see TODO        |
/// | responded  | `MutualAuthReq_05` (`312:20366`) | placeholder, see TODO        |
/// | done       | `MutualAuthReq_06` (`473:29905`) | placeholder, see TODO        |
///
/// The placeholder steps render the right title/CTA and call into the
/// cubit so the flow is exercisable end-to-end. Replace each with the
/// Figma-pixel design when its layer is selected and `get_design_context`
/// can produce reference code.
class MutualAuthRequestPage extends StatelessWidget {
  const MutualAuthRequestPage({super.key, required this.cubit});

  final MutualAuthRequestCubit cubit;

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
          title: Text(S.current.chon_mauth_req_title, style: ChonTextStyles.cardTitle()),
          centerTitle: true,
        ),
        body: SafeArea(
          child: BlocBuilder<MutualAuthRequestCubit, MutualAuthRequestState>(
            builder: (context, state) {
              switch (state.stage) {
                case MutualAuthRequestStage.search:
                  return _SearchStep(state: state, cubit: cubit);
                case MutualAuthRequestStage.confirm:
                  return _ConfirmStep(state: state, cubit: cubit);
                case MutualAuthRequestStage.sending:
                  return _LoadingStep(label: S.current.chon_mauth_req_sending);
                case MutualAuthRequestStage.awaiting:
                  return _AwaitingStep(cubit: cubit);
                case MutualAuthRequestStage.responded:
                  return _RespondedStep(state: state, cubit: cubit);
                case MutualAuthRequestStage.done:
                  return _DoneStep(state: state);
              }
            },
          ),
        ),
      ),
    );
  }
}

class _SearchStep extends StatefulWidget {
  const _SearchStep({required this.state, required this.cubit});
  final MutualAuthRequestState state;
  final MutualAuthRequestCubit cubit;

  @override
  State<_SearchStep> createState() => _SearchStepState();
}

class _SearchStepState extends State<_SearchStep> {
  late final _controller =
      TextEditingController(text: widget.state.phoneInput);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ChonShape.pagePaddingX),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 24.h),
          Text(
            S.current.chon_mauth_req_phone_prompt,
            style: ChonTextStyles.cardTitle(),
          ),
          SizedBox(height: 24.h),
          TextField(
            key: const Key('mutualAuth.phoneField'),
            controller: _controller,
            keyboardType: TextInputType.phone,
            onChanged: widget.cubit.onPhoneChanged,
            decoration: InputDecoration(
              hintText: '01012345678',
              filled: true,
              fillColor: ChonColors.bgSurface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            ),
          ),
          if (widget.state.errorMessage.isNotEmpty) ...[
            SizedBox(height: 8.h),
            Text(
              widget.state.errorMessage,
              style: ChonTextStyles.body(size: 14)
                  .copyWith(color: const Color(0xFFE24B4A)),
            ),
          ],
          const Spacer(),
          _PrimaryButton(
            key: const Key('mutualAuth.search.next'),
            label: S.current.chon_action_next,
            onPressed:
                widget.state.isLoading ? null : () => widget.cubit.search(),
            isLoading: widget.state.isLoading,
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

class _ConfirmStep extends StatelessWidget {
  const _ConfirmStep({required this.state, required this.cubit});
  final MutualAuthRequestState state;
  final MutualAuthRequestCubit cubit;

  @override
  Widget build(BuildContext context) {
    final t = state.target;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ChonShape.pagePaddingX),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 24.h),
          Text(S.current.chon_mauth_req_confirm_q, style: ChonTextStyles.cardTitle()),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: ChonColors.bgSurface,
              borderRadius: BorderRadius.circular(ChonShape.radiusCard),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t?.certRelatedName ?? '-',
                    style: ChonTextStyles.cardTitle()
                        .copyWith(fontSize: 18.sp)),
                SizedBox(height: 8.h),
                Text(
                  t?.certRelatedPhone ?? state.phoneInput,
                  style: ChonTextStyles.body(
                      size: 14, color: ChonColors.textSecondary),
                ),
              ],
            ),
          ),
          if (state.errorMessage.isNotEmpty) ...[
            SizedBox(height: 8.h),
            Text(
              state.errorMessage,
              style: ChonTextStyles.body(size: 14)
                  .copyWith(color: const Color(0xFFE24B4A)),
            ),
          ],
          const Spacer(),
          _PrimaryButton(
            label: S.current.chon_mauth_req_send,
            onPressed: () => cubit.sendRequest(
              gender: GenderE.male,
              certOwnerId: t?.certOwnerId ?? 0,
            ),
          ),
          SizedBox(height: 8.h),
          TextButton(
            onPressed: cubit.reset,
            child: Text(S.current.chon_action_search_again,
                style: ChonTextStyles.body(
                    size: 14, color: ChonColors.textTertiary)),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

class _LoadingStep extends StatelessWidget {
  const _LoadingStep({required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(color: ChonColors.brandPrimary),
          SizedBox(height: 16.h),
          Text(label,
              style: ChonTextStyles.body(
                  size: 14, color: ChonColors.textSecondary)),
        ],
      ),
    );
  }
}

class _AwaitingStep extends StatelessWidget {
  const _AwaitingStep({required this.cubit});
  final MutualAuthRequestCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ChonShape.pagePaddingX),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 80.h),
          Icon(Icons.hourglass_empty,
              size: 80.r, color: ChonColors.brandPrimary),
          SizedBox(height: 16.h),
          Text(
            S.current.chon_mauth_req_awaiting,
            textAlign: TextAlign.center,
            style: ChonTextStyles.cardTitle().copyWith(fontSize: 18.sp),
          ),
          const Spacer(),
          // In production, the counterparty's response would come from a
          // socket / push event. We expose two manual triggers so QA can
          // exercise the result flows from inside the app.
          _PrimaryButton(
            label: '(QA) 승인 처리됨으로 간주',
            onPressed: () => cubit.onCounterpartyResponded(approved: true),
          ),
          SizedBox(height: 8.h),
          OutlinedButton(
            onPressed: () => cubit.onCounterpartyResponded(approved: false),
            child: const Text('(QA) 거절 처리됨으로 간주'),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

class _RespondedStep extends StatelessWidget {
  const _RespondedStep({required this.state, required this.cubit});
  final MutualAuthRequestState state;
  final MutualAuthRequestCubit cubit;
  @override
  Widget build(BuildContext context) {
    final approved = state.wasApproved == true;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ChonShape.pagePaddingX),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 80.h),
          Icon(
            approved ? Icons.check_circle_outline : Icons.cancel_outlined,
            size: 80.r,
            color: approved
                ? const Color(0xFF1D9E75)
                : const Color(0xFFE24B4A),
          ),
          SizedBox(height: 16.h),
          Text(
            approved ? S.current.chon_mauth_req_approved : S.current.chon_mauth_req_rejected,
            textAlign: TextAlign.center,
            style: ChonTextStyles.cardTitle().copyWith(fontSize: 18.sp),
          ),
          const Spacer(),
          _PrimaryButton(label: S.current.chon_action_confirm, onPressed: cubit.finish),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

class _DoneStep extends StatelessWidget {
  const _DoneStep({required this.state});
  final MutualAuthRequestState state;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ChonShape.pagePaddingX),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.celebration_outlined,
                size: 96, color: ChonColors.brandPrimary),
            SizedBox(height: 16.h),
            Text(
              state.wasApproved == true ? S.current.chon_mauth_req_done : S.current.chon_mauth_req_retry_msg,
              textAlign: TextAlign.center,
              style: ChonTextStyles.cardTitle().copyWith(fontSize: 18.sp),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ChonColors.brandPrimary,
          foregroundColor: ChonColors.textInverse,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ChonShape.radiusPill),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                width: 24.r,
                height: 24.r,
                child: const CircularProgressIndicator(
                  color: ChonColors.textInverse,
                  strokeWidth: 2,
                ),
              )
            : Text(
                label,
                style: ChonTextStyles.actionLabel(
                        color: ChonColors.textInverse)
                    .copyWith(fontSize: 16.sp, height: 1.0),
              ),
      ),
    );
  }
}
