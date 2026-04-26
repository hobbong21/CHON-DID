import 'dart:convert';
import 'dart:io';

import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/id_generation_v2/cubit/id_generation_cubit.dart';
import 'package:base_flutter/presentations/modules/id_generation_v2/widgets/id_camera_capture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class IdGenerationV2Page extends StatelessWidget {
  const IdGenerationV2Page({super.key, required this.cubit});

  final IdGenerationCubit cubit;

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
          title: Text(S.current.chon_id_gen_title, style: ChonTextStyles.cardTitle()),
          leading: BlocBuilder<IdGenerationCubit, IdGenerationState>(
            builder: (context, state) => IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: state.stage == IdGenStage.start
                  ? () => Navigator.of(context).maybePop()
                  : cubit.back,
            ),
          ),
        ),
        body: BlocBuilder<IdGenerationCubit, IdGenerationState>(
          builder: (context, state) {
            switch (state.stage) {
              case IdGenStage.start:
                return _StartLeaf(onNext: cubit.next);
              case IdGenStage.personalInfo:
                return _PersonalInfoLeaf(state: state, cubit: cubit);
              case IdGenStage.verificationOk:
                return _VerificationLeaf(state: state, cubit: cubit);
              case IdGenStage.selectIdType:
                return _IdTypeLeaf(state: state, cubit: cubit);
              case IdGenStage.capturePrep:
                return _CapturePrepLeaf(onNext: cubit.next);
              case IdGenStage.captureFront:
                return IdCameraCapture(
                  instructionLabel: S.current.chon_id_gen_capture_front,
                  onCaptured: (file) async {
                    final bytes = await file.readAsBytes();
                    cubit.setFrontImage(base64Encode(bytes));
                    final secret = dotenv.env['OCR_SECRET'] ?? '';
                    if (secret.isNotEmpty) {
                      await cubit.runOcr(file: file, secretKey: secret);
                    }
                    cubit.next();
                  },
                );
              case IdGenStage.captureBack:
                return IdCameraCapture(
                  instructionLabel: S.current.chon_id_gen_capture_back,
                  onCaptured: (file) async {
                    final bytes = await file.readAsBytes();
                    cubit.setBackImage(base64Encode(bytes));
                    cubit.next();
                  },
                );
              case IdGenStage.ocrConfirm:
                return _OcrConfirmLeaf(state: state, cubit: cubit);
              case IdGenStage.review:
                return _ReviewLeaf(state: state, cubit: cubit);
              case IdGenStage.done:
                return _DoneLeaf(
                    onClose: () => Navigator.of(context).maybePop());
            }
          },
        ),
      ),
    );
  }
}

class _StartLeaf extends StatelessWidget {
  const _StartLeaf({required this.onNext});
  final VoidCallback onNext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 48),
          Container(
            width: 144,
            height: 144,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xFFFFE7B8),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.badge_outlined,
                size: 72, color: ChonColors.brandPrimary),
          ),
          const SizedBox(height: 24),
          Text(S.current.chon_id_gen_intro_title,
              textAlign: TextAlign.center,
              style: ChonTextStyles.cardTitle()),
          const SizedBox(height: 8),
          Text(
            S.current.chon_id_gen_intro_body,
            textAlign: TextAlign.center,
            style: ChonTextStyles.body(
                size: 14, color: ChonColors.textSecondary, height: 1.5),
          ),
          const Spacer(),
          _PrimaryButton(label: S.current.chon_action_start, onPressed: onNext),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _PersonalInfoLeaf extends StatefulWidget {
  const _PersonalInfoLeaf({required this.state, required this.cubit});
  final IdGenerationState state;
  final IdGenerationCubit cubit;
  @override
  State<_PersonalInfoLeaf> createState() => _PersonalInfoLeafState();
}

class _PersonalInfoLeafState extends State<_PersonalInfoLeaf> {
  late final _name = TextEditingController(text: widget.state.fullName);
  late final _id = TextEditingController(text: widget.state.idNumber);

  @override
  void dispose() {
    _name.dispose();
    _id.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _SimpleField(
            label: S.current.chon_id_gen_field_name,
            hint: S.current.chon_id_gen_field_name_hint,
            controller: _name,
            onChanged: (v) =>
                widget.cubit.onPersonalInfoChanged(fullName: v),
          ),
          const SizedBox(height: 16),
          _SimpleField(
            label: S.current.chon_id_gen_field_id,
            hint: '예: 900101-1234567',
            controller: _id,
            onChanged: (v) =>
                widget.cubit.onPersonalInfoChanged(idNumber: v),
          ),
          if (widget.state.errorMessage.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(widget.state.errorMessage,
                style: ChonTextStyles.body(size: 13)
                    .copyWith(color: const Color(0xFFE24B4A))),
          ],
          const SizedBox(height: 32),
          _PrimaryButton(label: S.current.chon_action_next, onPressed: widget.cubit.next),
        ],
      ),
    );
  }
}

class _SimpleField extends StatelessWidget {
  const _SimpleField({
    required this.label,
    required this.hint,
    required this.controller,
    required this.onChanged,
  });
  final String label;
  final String hint;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: ChonTextStyles.sectionLabel()),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: ChonColors.bgSurface,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

class _VerificationLeaf extends StatelessWidget {
  const _VerificationLeaf({required this.state, required this.cubit});
  final IdGenerationState state;
  final IdGenerationCubit cubit;
  @override
  Widget build(BuildContext context) {
    final failed = state.verificationFailed;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 48),
          Icon(
            failed ? Icons.cancel_outlined : Icons.check_circle_outline,
            size: 96,
            color:
                failed ? const Color(0xFFE24B4A) : ChonColors.brandPrimary,
          ),
          const SizedBox(height: 24),
          Text(
            failed ? S.current.chon_id_gen_verified_fail : S.current.chon_id_gen_verified_ok,
            textAlign: TextAlign.center,
            style: ChonTextStyles.cardTitle(),
          ),
          const Spacer(),
          if (failed)
            _PrimaryButton(
              label: S.current.chon_id_gen_reenter,
              onPressed: () => cubit.goTo(IdGenStage.personalInfo),
            )
          else
            _PrimaryButton(label: S.current.chon_action_continue, onPressed: cubit.next),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// ID type picker — Figma node `301:6519` (`ID Gen_03_02_01`).
///
/// Layout (Figma):
/// - 28px Pretendard Bold heading "신분증 스캔을 위한 / 촬영 방법을 선택해 주세요"
///   (line-height 1.08, letter-spacing -0.56) at top=92, left=24
/// - 2×2 grid of 160×100 cards with 8px gap, radius 20, padding 13/8.
///   Selected = `#FFA000` background + white 18px Bold label;
///   Unselected = white background + `#1A1A1A` 18px Bold label.
/// - Grid origin top=257, centered horizontally.
///
/// Figma also includes a 4th "기타" tile that has no equivalent in the
/// `IdGenType` enum (mobile distinguishes output-card-type, Figma is
/// scan-source picker). We render only the 3 enum values; if the 기타
/// tile becomes a real product flow, add a `IdGenType.other` value and a
/// 4th label here.
class _IdTypeLeaf extends StatelessWidget {
  const _IdTypeLeaf({required this.state, required this.cubit});
  final IdGenerationState state;
  final IdGenerationCubit cubit;

  String _label(IdGenType t) {
    switch (t) {
      case IdGenType.selfId:
        return S.current.chon_id_gen_type_resident;
      case IdGenType.cardFamily:
        return S.current.chon_id_gen_type_family;
      case IdGenType.cardTaekwondo:
        return S.current.chon_id_gen_type_taekwondo;
    }
  }

  @override
  Widget build(BuildContext context) {
    final types = IdGenType.values;
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading — 28px Bold, 2 lines, line-height 1.08.
          Text(
            S.current.chon_id_gen_pick_type,
            style: ChonTextStyles.cardTitle().copyWith(
              fontSize: 28,
              height: 1.08,
              letterSpacing: -0.56,
            ),
          ),
          const SizedBox(height: 24),
          // 2-column grid, 160×100 each, 8px gap.
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 160 / 100,
            children: [
              for (final t in types)
                _IdTypeTile(
                  label: _label(t),
                  selected: state.idType == t,
                  onTap: () => cubit.setIdType(t),
                ),
            ],
          ),
          const Spacer(),
          _PrimaryButton(
              label: S.current.chon_action_next, onPressed: cubit.next),
        ],
      ),
    );
  }
}

/// 160×100 picker tile per Figma node `301:6505` / `301:6486` etc.
class _IdTypeTile extends StatelessWidget {
  const _IdTypeTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? ChonColors.brandPrimary : ChonColors.bgSurface,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
          alignment: Alignment.center,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: ChonTextStyles.cardTitle().copyWith(
              fontSize: 18,
              height: 1.1,
              letterSpacing: -0.27,
              color:
                  selected ? ChonColors.textInverse : const Color(0xFF1A1A1A),
            ),
          ),
        ),
      ),
    );
  }
}

class _CapturePrepLeaf extends StatelessWidget {
  const _CapturePrepLeaf({required this.onNext});
  final VoidCallback onNext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 32),
          const Icon(Icons.camera_alt_outlined,
              size: 96, color: ChonColors.brandPrimary),
          const SizedBox(height: 24),
          Text(S.current.chon_id_gen_prep_title,
              textAlign: TextAlign.center,
              style: ChonTextStyles.cardTitle()),
          const SizedBox(height: 16),
          _Tip(text: S.current.chon_id_gen_prep_tip1),
          _Tip(text: S.current.chon_id_gen_prep_tip2),
          _Tip(text: S.current.chon_id_gen_prep_tip3),
          const Spacer(),
          _PrimaryButton(label: S.current.chon_id_gen_prep_start, onPressed: onNext),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _Tip extends StatelessWidget {
  const _Tip({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle,
              size: 18, color: ChonColors.brandPrimary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text,
                style: ChonTextStyles.body(
                    size: 14,
                    color: ChonColors.textSecondary,
                    height: 1.5)),
          ),
        ],
      ),
    );
  }
}

/// OCR confirm form — Figma node `301:25075` (`ID Gen_03_02_01_03`).
///
/// Differs from the previous read-only display in two ways:
///   1. Each field is an editable [TextField] styled per Figma `input_Y`
///      (grey #F5F5F5 background, 1.5px #D9D9D9 border, 12 radius). The
///      grey background communicates "data is here, edit if wrong".
///   2. The header is a 28px Pretendard Bold two-line title plus a 16px
///      subtitle with an inline `#EF700F` highlight on "수정".
///
/// We use local `TextEditingController`s so the cubit's freezed state is
/// not bombarded with per-keystroke updates; the values are flushed back
/// on Next via [IdGenerationCubit.onPersonalInfoChanged].
class _OcrConfirmLeaf extends StatefulWidget {
  const _OcrConfirmLeaf({required this.state, required this.cubit});
  final IdGenerationState state;
  final IdGenerationCubit cubit;
  @override
  State<_OcrConfirmLeaf> createState() => _OcrConfirmLeafState();
}

class _OcrConfirmLeafState extends State<_OcrConfirmLeaf> {
  late final _name = TextEditingController(text: widget.state.fullName);
  late final _id = TextEditingController(text: widget.state.idNumber);
  late final _address = TextEditingController(text: widget.state.address);
  late final _authority =
      TextEditingController(text: widget.state.issuingAuthority);
  late final _issued = TextEditingController(text: widget.state.issuedDate);

  @override
  void dispose() {
    _name.dispose();
    _id.dispose();
    _address.dispose();
    _authority.dispose();
    _issued.dispose();
    super.dispose();
  }

  void _flushAndNext() {
    widget.cubit.onPersonalInfoChanged(
      fullName: _name.text.trim(),
      idNumber: _id.text.trim(),
      address: _address.text.trim(),
      issuedDate: _issued.text.trim(),
      issuingAuthority: _authority.text.trim(),
    );
    widget.cubit.next();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: ChonColors.brandPrimary),
      );
    }
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header (28px Bold, 2 lines + 16px subtitle with highlight).
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 20),
            child: _OcrFormHeader(
              title: S.current.chon_id_gen_ocr_form_title,
              subtitlePrefix: S.current.chon_id_gen_ocr_form_subtitle_prefix,
              subtitleHighlight: S.current.chon_id_gen_ocr_form_subtitle_edit,
              subtitleSuffix: S.current.chon_id_gen_ocr_form_subtitle_suffix,
            ),
          ),
          // White form card with input_Y fields.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: ChonColors.bgSurface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 98×116 portrait placeholder (Figma `301:10277`).
                  // Real face crop from OCR result will replace this once
                  // the OCR pipeline returns a portrait region.
                  Center(
                    child: Container(
                      width: 98,
                      height: 116,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFFD9D9D9), width: 1),
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF5F5F5),
                      ),
                      child: const Icon(Icons.person_outline,
                          size: 56, color: Color(0xFFBFBFBF)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _FigmaFormField(
                    label: S.current.chon_id_gen_field_name,
                    controller: _name,
                  ),
                  const SizedBox(height: 16),
                  _FigmaFormField(
                    label: S.current.chon_id_gen_field_id_label,
                    controller: _id,
                  ),
                  const SizedBox(height: 16),
                  _FigmaFormField(
                    label: S.current.chon_id_gen_field_address,
                    controller: _address,
                  ),
                  const SizedBox(height: 16),
                  _FigmaFormField(
                    label: S.current.chon_id_gen_field_authority,
                    controller: _authority,
                  ),
                  const SizedBox(height: 16),
                  _FigmaFormField(
                    label: S.current.chon_id_gen_field_issued,
                    controller: _issued,
                  ),
                ],
              ),
            ),
          ),
          if (widget.state.errorMessage.isNotEmpty) ...[
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(widget.state.errorMessage,
                  style: ChonTextStyles.body(
                      size: 13, color: const Color(0xFFE24B4A))),
            ),
          ],
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OutlinedButton(
              onPressed: () => widget.cubit.goTo(IdGenStage.captureFront),
              child: Text(S.current.chon_action_recapture),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _PrimaryButton(
                label: S.current.chon_action_next, onPressed: _flushAndNext),
          ),
        ],
      ),
    );
  }
}

/// Review form — Figma node `301:25205` (`ID Gen_03_02_01_04`).
///
/// Same form card as `_OcrConfirmLeaf` plus an additional **전화번호** input
/// rendered with white background (Figma `input_N`) — the white state
/// signals "this field has not been filled yet, please type it in" to the
/// user. Bottom CTA submits via [IdGenerationCubit.submit] once the phone
/// number is captured.
///
/// **Phone number** is held in a local controller and not yet persisted to
/// the cubit's state — adding `phoneNumber` to the freezed state would
/// require regenerating `id_generation_cubit.freezed.dart` (77 references).
/// Instead we pass the value to a new submit overload `submit(phone: ...)`
/// on the cubit when it's added; for now the controller value is logged
/// and submit fires without it. See the TODO inside `_submit`.
class _ReviewLeaf extends StatefulWidget {
  const _ReviewLeaf({required this.state, required this.cubit});
  final IdGenerationState state;
  final IdGenerationCubit cubit;
  @override
  State<_ReviewLeaf> createState() => _ReviewLeafState();
}

class _ReviewLeafState extends State<_ReviewLeaf> {
  late final _name = TextEditingController(text: widget.state.fullName);
  late final _id = TextEditingController(text: widget.state.idNumber);
  late final _address = TextEditingController(text: widget.state.address);
  late final _authority =
      TextEditingController(text: widget.state.issuingAuthority);
  late final _issued = TextEditingController(text: widget.state.issuedDate);
  // Local-only — Figma `input_N` (white bg) for additional info.
  late final _phone = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _id.dispose();
    _address.dispose();
    _authority.dispose();
    _issued.dispose();
    _phone.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    widget.cubit.onPersonalInfoChanged(
      fullName: _name.text.trim(),
      idNumber: _id.text.trim(),
      address: _address.text.trim(),
      issuedDate: _issued.text.trim(),
      issuingAuthority: _authority.text.trim(),
    );
    // TODO(phone): once `phoneNumber` is added to `IdGenerationState` (and
    // `CreateCardRequest` accepts it), pass `_phone.text.trim()` through
    // here. Tracking node: Figma `301:25205` (input_N for 전화번호).
    await widget.cubit.submit();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 20),
            child: Text(
              S.current.chon_id_gen_review_form_title,
              style: ChonTextStyles.cardTitle().copyWith(
                fontSize: 28,
                height: 1.08,
                letterSpacing: -0.56,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: ChonColors.bgSurface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 98,
                      height: 116,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFFD9D9D9), width: 1),
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF5F5F5),
                      ),
                      child: const Icon(Icons.person_outline,
                          size: 56, color: Color(0xFFBFBFBF)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _FigmaFormField(
                    label: S.current.chon_id_gen_field_name,
                    controller: _name,
                  ),
                  const SizedBox(height: 16),
                  _FigmaFormField(
                    label: S.current.chon_id_gen_field_id_label,
                    controller: _id,
                  ),
                  const SizedBox(height: 16),
                  _FigmaFormField(
                    label: S.current.chon_id_gen_field_address,
                    controller: _address,
                  ),
                  const SizedBox(height: 16),
                  _FigmaFormField(
                    label: S.current.chon_id_gen_field_authority,
                    controller: _authority,
                  ),
                  const SizedBox(height: 16),
                  _FigmaFormField(
                    label: S.current.chon_id_gen_field_issued,
                    controller: _issued,
                  ),
                  const SizedBox(height: 16),
                  // input_N variant (white bg) — additional info to fill in.
                  _FigmaFormField(
                    label: S.current.chon_id_gen_field_phone,
                    controller: _phone,
                    filled: false,
                  ),
                ],
              ),
            ),
          ),
          if (widget.state.errorMessage.isNotEmpty) ...[
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(widget.state.errorMessage,
                  style: ChonTextStyles.body(size: 13)
                      .copyWith(color: const Color(0xFFE24B4A))),
            ),
          ],
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _PrimaryButton(
              label: S.current.chon_id_gen_review_finish,
              onPressed: widget.state.isLoading ? null : _submit,
              isLoading: widget.state.isLoading,
            ),
          ),
        ],
      ),
    );
  }
}

/// Header for `_OcrConfirmLeaf` — 28px Bold title (2 lines) + 16px Regular
/// subtitle with an inline `#EF700F` highlight on the action verb (수정).
class _OcrFormHeader extends StatelessWidget {
  const _OcrFormHeader({
    required this.title,
    required this.subtitlePrefix,
    required this.subtitleHighlight,
    required this.subtitleSuffix,
  });
  final String title;
  final String subtitlePrefix;
  final String subtitleHighlight;
  final String subtitleSuffix;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: ChonTextStyles.cardTitle().copyWith(
            fontSize: 28,
            height: 1.08,
            letterSpacing: -0.56,
          ),
        ),
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            style: ChonTextStyles.body(size: 16, height: 1.3),
            children: [
              TextSpan(text: subtitlePrefix),
              TextSpan(
                text: subtitleHighlight,
                style: const TextStyle(color: Color(0xFFEF700F)),
              ),
              TextSpan(text: subtitleSuffix),
            ],
          ),
        ),
      ],
    );
  }
}

/// Figma `input_Y` / `input_N` styled text field.
///
/// `filled = true` (default) renders the grey-filled `input_Y` variant used
/// for OCR-prefilled fields. `filled = false` renders the white `input_N`
/// variant used for additional-info fields the user has yet to fill in.
class _FigmaFormField extends StatelessWidget {
  const _FigmaFormField({
    required this.label,
    required this.controller,
    this.filled = true,
  });
  final String label;
  final TextEditingController controller;
  final bool filled;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: ChonTextStyles.body(
            size: 14,
            color: ChonColors.textSecondary,
            height: 1.0,
            letterSpacing: -0.21,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          style: ChonTextStyles.body(
            size: 16,
            height: 1.0,
            letterSpacing: -0.24,
          ),
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor:
                filled ? const Color(0xFFF5F5F5) : ChonColors.bgSurface,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  color: Color(0xFFD9D9D9), width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  color: Color(0xFFD9D9D9), width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  color: ChonColors.brandPrimary, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

// `_Row` (read-only label/value list) removed 2026-04-26 — `_OcrConfirmLeaf`
// and `_ReviewLeaf` now use editable `_FigmaFormField` per Figma 301:25075 /
// 301:25205. Restore from git history if a read-only display is needed
// elsewhere.

class _DoneLeaf extends StatelessWidget {
  const _DoneLeaf({required this.onClose});
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 64),
          const Icon(Icons.celebration_outlined,
              size: 96, color: ChonColors.brandPrimary),
          const SizedBox(height: 24),
          Text(S.current.chon_id_gen_done,
              textAlign: TextAlign.center,
              style: ChonTextStyles.cardTitle()),
          const Spacer(),
          _PrimaryButton(label: S.current.chon_action_confirm, onPressed: onClose),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({
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
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ChonColors.brandPrimary,
          foregroundColor: ChonColors.textInverse,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: ChonColors.textInverse,
                  strokeWidth: 2,
                ),
              )
            : Text(label,
                style: ChonTextStyles.actionLabel(
                        color: ChonColors.textInverse)
                    .copyWith(fontSize: 16, height: 1.0)),
      ),
    );
  }
}
