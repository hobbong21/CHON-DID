import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/presentations/modules/id_generation_v2/cubit/id_generation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Shell page for ID Generation v2 — Figma section 3.
///
/// Phase-driven view dispatch. Most phases are simple stub leaves
/// today; pixel-perfect Figma rendering comes via `get_design_context`
/// for each frame. See `docs/figma/section_3_id_gen_handoff.md`.
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
          title: Text('신분증 발급', style: ChonTextStyles.cardTitle()),
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
                return _StubLeaf(
                  title: '카메라 준비',
                  caption: 'Figma `ID Gen_03_01` 픽셀 정밀 변환 대기.',
                  onNext: cubit.next,
                );
              case IdGenStage.captureFront:
                return _StubLeaf(
                  title: '신분증 앞면 촬영',
                  caption:
                      'Figma `ID Gen_03_02_01_NN` 픽셀 정밀 변환 대기. '
                      '실제로는 `mobile_scanner` / `camera` 패키지 사용.',
                  onNext: () {
                    cubit.setFrontImage('stub-front-base64');
                    cubit.next();
                  },
                );
              case IdGenStage.captureBack:
                return _StubLeaf(
                  title: '신분증 뒷면 촬영',
                  caption: 'Figma `ID Gen_03_02_02` 픽셀 정밀 변환 대기.',
                  onNext: () {
                    cubit.setBackImage('stub-back-base64');
                    cubit.next();
                  },
                );
              case IdGenStage.ocrConfirm:
                return _StubLeaf(
                  title: 'OCR 결과 확인',
                  caption:
                      'Figma `ID Gen_03_02_03` 픽셀 정밀 변환 대기. '
                      '기존 `ocr_id` 모듈에 OCR 호출 + 결과 파싱 로직이 있음.',
                  onNext: cubit.next,
                );
              case IdGenStage.review:
                return _ReviewLeaf(state: state, cubit: cubit);
              case IdGenStage.done:
                return _DoneLeaf(onClose: () => Navigator.of(context).maybePop());
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
          Text('CHON ID 발급을 시작할게요',
              textAlign: TextAlign.center,
              style: ChonTextStyles.cardTitle()),
          const SizedBox(height: 8),
          Text(
            '신분증 정보 입력과 촬영을 통해\n나의 CHON ID를 만들어 보세요.',
            textAlign: TextAlign.center,
            style: ChonTextStyles.body(
                size: 14, color: ChonColors.textSecondary, height: 1.5),
          ),
          const Spacer(),
          _PrimaryButton(label: '시작하기', onPressed: onNext),
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
  late final _name =
      TextEditingController(text: widget.state.fullName);
  late final _id =
      TextEditingController(text: widget.state.idNumber);

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
            label: '성명',
            hint: '신분증 상의 이름',
            controller: _name,
            onChanged: (v) =>
                widget.cubit.onPersonalInfoChanged(fullName: v),
          ),
          const SizedBox(height: 16),
          _SimpleField(
            label: '주민등록번호 / 외국인등록번호',
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
          _PrimaryButton(label: '다음', onPressed: widget.cubit.next),
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
            hintStyle: ChonTextStyles.body(
                size: 14, color: ChonColors.textTertiary),
            filled: true,
            fillColor: ChonColors.bgSurface,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: ChonColors.brandPrimary,
                width: 1.5,
              ),
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
            color: failed
                ? const Color(0xFFE24B4A)
                : ChonColors.brandPrimary,
          ),
          const SizedBox(height: 24),
          Text(
            failed ? '확인할 수 없어요' : '확인되었어요',
            textAlign: TextAlign.center,
            style: ChonTextStyles.cardTitle(),
          ),
          const Spacer(),
          if (failed) ...[
            _PrimaryButton(
              label: '다시 입력',
              onPressed: () => cubit.goTo(IdGenStage.personalInfo),
            ),
          ] else ...[
            _PrimaryButton(label: '계속', onPressed: cubit.next),
          ],
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          Text(
            '발급할 ID 종류를 선택해주세요',
            style: ChonTextStyles.cardTitle().copyWith(fontSize: 18),
          ),
          const SizedBox(height: 16),
          ...IdGenType.values.map((t) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _TypeCard(
                  type: t,
                  selected: state.idType == t,
                  onTap: () => cubit.setIdType(t),
                ),
              )),
          const Spacer(),
          _PrimaryButton(label: '다음', onPressed: cubit.next),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _TypeCard extends StatelessWidget {
  const _TypeCard({
    required this.type,
    required this.selected,
    required this.onTap,
  });
  final IdGenType type;
  final bool selected;
  final VoidCallback onTap;

  String get _label {
    switch (type) {
      case IdGenType.selfId:
        return '주민/외국인등록증';
      case IdGenType.cardFamily:
        return '가족관계증명서';
      case IdGenType.cardTaekwondo:
        return '태권도 단증';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ChonColors.bgSurface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected
                  ? ChonColors.brandPrimary
                  : Colors.transparent,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  _label,
                  style: ChonTextStyles.cardTitle().copyWith(fontSize: 16),
                ),
              ),
              Icon(
                selected ? Icons.radio_button_checked : Icons.radio_button_off,
                color: selected
                    ? ChonColors.brandPrimary
                    : ChonColors.iconDisabledStrong,
              ),
            ],
          ),
        ),
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
          Text('확인하시고 발급을 완료하세요',
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
                _Row(label: '성명', value: state.fullName),
                _Row(label: 'ID 번호', value: state.idNumber),
                if (state.address.isNotEmpty)
                  _Row(label: '주소', value: state.address),
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
              label: '발급하기',
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
          Text('CHON ID가 발급되었어요',
              textAlign: TextAlign.center,
              style: ChonTextStyles.cardTitle()),
          const Spacer(),
          _PrimaryButton(label: '확인', onPressed: onClose),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _StubLeaf extends StatelessWidget {
  const _StubLeaf({
    required this.title,
    required this.caption,
    required this.onNext,
  });
  final String title;
  final String caption;
  final VoidCallback onNext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 48),
          Text(title,
              textAlign: TextAlign.center,
              style: ChonTextStyles.cardTitle()),
          const SizedBox(height: 12),
          Text(caption,
              textAlign: TextAlign.center,
              style: ChonTextStyles.body(
                  size: 13, color: ChonColors.textTertiary, height: 1.5)),
          const Spacer(),
          _PrimaryButton(label: '계속', onPressed: onNext),
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
