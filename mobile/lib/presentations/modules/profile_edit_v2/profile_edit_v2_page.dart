import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/presentations/modules/profile_edit/cubit/profile_edit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Figma-faithful Edit Profile page — section 10
/// (`Edit profile_01` `602:44564`).
///
/// Reuses the legacy [ProfileEditCubit] (which already wires the
/// SelfIdRepo update + base64 image flow) but renders with the
/// CHON design tokens. Form layout follows Figma:
///
/// ```
/// ┌────────────────────────────────┐
/// │ AppBar — S.current.chon_profile_edit_title            │
/// ├────────────────────────────────┤
/// │   [ avatar / file picker ]      │
/// │                                  │
/// │ Label: 성                        │
/// │ ─── input ───                    │
/// │ Label: 이름                      │
/// │ ─── input ───                    │
/// │ ...                              │
/// │                                  │
/// │ [        저장하기        ]        │
/// └────────────────────────────────┘
/// ```
class ProfileEditV2Page extends StatefulWidget {
  const ProfileEditV2Page({
    super.key,
    required this.cubit,
    required this.card,
  });

  final ProfileEditCubit cubit;
  final CardInfoItem? card;

  @override
  State<ProfileEditV2Page> createState() => _ProfileEditV2PageState();
}

class _ProfileEditV2PageState extends State<ProfileEditV2Page> {
  @override
  void initState() {
    super.initState();
    final card = widget.card;
    if (card != null) {
      final fullName = card.name?.split(' ') ?? const <String>[];
      widget.cubit.surnameController.text =
          fullName.isNotEmpty ? fullName.first : '';
      widget.cubit.nameController.text =
          fullName.length > 1 ? fullName.sublist(1).join(' ') : '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cubit,
      child: Scaffold(
        backgroundColor: ChonColors.bgPage,
        appBar: AppBar(
          backgroundColor: ChonColors.bgPage,
          foregroundColor: ChonColors.textPrimary,
          elevation: 0,
          centerTitle: true,
          title: Text(S.current.chon_profile_edit_title, style: ChonTextStyles.cardTitle()),
        ),
        body: Form(
          key: widget.cubit.formKey,
          child: BlocBuilder<ProfileEditCubit, ProfileEditState>(
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _AvatarSection(card: widget.card),
                    const SizedBox(height: 32),
                    _LabeledField(
                      key: const Key('profileEdit.surname'),
                      label: S.current.chon_profile_edit_surname,
                      controller: widget.cubit.surnameController,
                      hint: '예: 김',
                    ),
                    const SizedBox(height: 16),
                    _LabeledField(
                      key: const Key('profileEdit.name'),
                      label: S.current.chon_profile_edit_given,
                      controller: widget.cubit.nameController,
                      hint: '예: 영희',
                    ),
                    if (state.messageError.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Text(
                        state.messageError,
                        style: ChonTextStyles.body(size: 13).copyWith(
                          color: const Color(0xFFE24B4A),
                        ),
                      ),
                    ],
                    const SizedBox(height: 32),
                    _SaveButton(
                      isLoading: state.isLoading,
                      onPressed: () => widget.cubit.update(widget.card),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _AvatarSection extends StatelessWidget {
  const _AvatarSection({required this.card});
  final CardInfoItem? card;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 112,
            height: 112,
            decoration: const BoxDecoration(
              color: Color(0xFFFFE7B8),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: card?.imgPath?.isNotEmpty == true
                ? ClipOval(
                    child: Image.network(
                      card!.imgPath!,
                      width: 112,
                      height: 112,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.person_outline,
                        size: 56,
                        color: ChonColors.textPrimary,
                      ),
                    ),
                  )
                : const Icon(
                    Icons.person_outline,
                    size: 56,
                    color: ChonColors.textPrimary,
                  ),
          ),
          Positioned(
            right: -4,
            bottom: -4,
            child: Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: ChonColors.brandPrimary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.camera_alt_outlined,
                size: 18,
                color: ChonColors.textInverse,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
  });

  final String label;
  final TextEditingController controller;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: ChonTextStyles.sectionLabel()),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
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
          validator: (value) => (value == null || value.trim().isEmpty)
              ? S.current.chon_profile_edit_required
              : null,
        ),
      ],
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    required this.isLoading,
    required this.onPressed,
  });
  final bool isLoading;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        key: const Key('profileEdit.save'),
        onPressed: isLoading ? null : onPressed,
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
            : Text(
                S.current.chon_action_save,
                style: ChonTextStyles.actionLabel(
                        color: ChonColors.textInverse)
                    .copyWith(fontSize: 16, height: 1.0),
              ),
      ),
    );
  }
}
