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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          Text(S.current.chon_id_gen_pick_type,
              style: ChonTextStyles.cardTitle().copyWith(fontSize: 18)),
          const SizedBox(height: 16),
          ...IdGenType.values.map((t) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Material(
                  color: ChonColors.bgSurface,
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    onTap: () => cubit.setIdType(t),
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: state.idType == t
                              ? ChonColors.brandPrimary
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(_label(t),
                                style: ChonTextStyles.cardTitle()
                                    .copyWith(fontSize: 16)),
                          ),
                          Icon(
                            state.idType == t
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: state.idType == t
                                ? ChonColors.brandPrimary
                                : ChonColors.iconDisabledStrong,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
          const Spacer(),
          _PrimaryButton(label: S.current.chon_action_next, onPressed: cubit.next),
          const SizedBox(height: 16),
        ],
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

class _OcrConfirmLeaf extends StatelessWidget {
  const _OcrConfirmLeaf({required this.state, required this.cubit});
  final IdGenerationState state;
  final IdGenerationCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(S.current.chon_id_gen_ocr_title,
              style: ChonTextStyles.cardTitle().copyWith(fontSize: 18)),
          const SizedBox(height: 16),
          if (state.isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(
                child: CircularProgressIndicator(
                    color: ChonColors.brandPrimary),
              ),
            )
          else
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ChonColors.bgSurface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _Row(label: S.current.chon_id_gen_field_name, value: state.fullName),
                  _Row(label: S.current.chon_id_gen_field_id_label, value: state.idNumber),
                  if (state.address.isNotEmpty)
                    _Row(label: S.current.chon_id_gen_field_address, value: state.address),
                  if (state.issuedDate.isNotEmpty)
                    _Row(label: S.current.chon_id_gen_field_issued, value: state.issuedDate),
                  if (state.issuingAuthority.isNotEmpty)
                    _Row(label: S.current.chon_id_gen_field_authority, value: state.issuingAuthority),
                ],
              ),
            ),
          if (state.errorMessage.isNotEmpty && !state.isLoading) ...[
            const SizedBox(height: 12),
            Text(state.errorMessage,
                style: ChonTextStyles.body(
                    size: 13, color: ChonColors.textTertiary)),
          ],
          const Spacer(),
          OutlinedButton(
            onPressed: () => cubit.goTo(IdGenStage.captureFront),
            child: Text(S.current.chon_action_recapture),
          ),
          const SizedBox(height: 8),
          _PrimaryButton(label: S.current.chon_action_confirm, onPressed: cubit.next),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _ReviewLeaf extends StatelessWidget {
  const _ReviewLeaf({required this.state, required this.cubit});
  final IdGenerationState state;
  final IdGenerationCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(S.current.chon_id_gen_review_title,
              style: ChonTextStyles.cardTitle().copyWith(fontSize: 18)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ChonColors.bgSurface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Row(label: S.current.chon_id_gen_field_name, value: state.fullName),
                _Row(label: S.current.chon_id_gen_field_id_label, value: state.idNumber),
                if (state.address.isNotEmpty)
                  _Row(label: S.current.chon_id_gen_field_address, value: state.address),
              ],
            ),
          ),
          if (state.errorMessage.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(state.errorMessage,
                style: ChonTextStyles.body(size: 13)
                    .copyWith(color: const Color(0xFFE24B4A))),
          ],
          const Spacer(),
          _PrimaryButton(
              label: S.current.chon_id_gen_review_finish,
              onPressed: state.isLoading ? null : cubit.submit,
              isLoading: state.isLoading),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.label, required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(label,
                style: ChonTextStyles.body(
                    size: 13, color: ChonColors.textTertiary)),
          ),
          Expanded(
            child: Text(value.isEmpty ? '-' : value,
                style: ChonTextStyles.body(size: 14)),
          ),
        ],
      ),
    );
  }
}

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
