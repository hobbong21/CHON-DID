import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/data/models/report/report_model.dart';
import 'package:base_flutter/presentations/modules/report_v2/cubit/report_v2_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Report (문제 신고) page — Figma section 11.
///
/// Stage-driven shell:
/// - `list` — past reports + S.current.chon_report_new button
/// - `compose` — form
/// - `submitting` — loading screen
/// - `submitted` — success
/// - `failed` — error with retry
class ReportV2Page extends StatelessWidget {
  const ReportV2Page({super.key, required this.cubit});

  final ReportV2Cubit cubit;

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
          title: Text(S.current.chon_report_title, style: ChonTextStyles.cardTitle()),
        ),
        body: BlocBuilder<ReportV2Cubit, ReportV2State>(
          builder: (context, state) {
            switch (state.stage) {
              case ReportV2Stage.list:
                return _ListBody(state: state, cubit: cubit);
              case ReportV2Stage.compose:
                return _ComposeBody(state: state, cubit: cubit);
              case ReportV2Stage.submitting:
                return _LoadingBody(label: S.current.chon_report_sending);
              case ReportV2Stage.submitted:
                return _SuccessBody(onClose: cubit.backToList);
              case ReportV2Stage.failed:
                return _FailedBody(state: state, cubit: cubit);
            }
          },
        ),
      ),
    );
  }
}

class _ListBody extends StatelessWidget {
  const _ListBody({required this.state, required this.cubit});
  final ReportV2State state;
  final ReportV2Cubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: state.isLoading && state.reports.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                      color: ChonColors.brandPrimary),
                )
              : state.reports.isEmpty
                  ? Center(
                      child: Text(S.current.chon_report_empty,
                          style: ChonTextStyles.body(
                              size: 14, color: ChonColors.textSecondary)),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      itemCount: state.reports.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 8),
                      itemBuilder: (_, i) =>
                          _ReportRow(report: state.reports[i]),
                    ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: SizedBox(
            height: 52,
            child: ElevatedButton(
              key: const Key('report.new'),
              onPressed: cubit.openCompose,
              style: ElevatedButton.styleFrom(
                backgroundColor: ChonColors.brandPrimary,
                foregroundColor: ChonColors.textInverse,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                elevation: 0,
              ),
              child: Text(S.current.chon_report_new),
            ),
          ),
        ),
      ],
    );
  }
}

class _ReportRow extends StatelessWidget {
  const _ReportRow({required this.report});
  final ReportModel report;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ChonColors.bgSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            report.title ?? '(제목 없음)',
            style: ChonTextStyles.cardTitle().copyWith(fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            report.createdTime ?? '-',
            style: ChonTextStyles.body(
                size: 12, color: ChonColors.textTertiary),
          ),
          if (report.content?.isNotEmpty == true) ...[
            const SizedBox(height: 8),
            Text(
              report.content!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: ChonTextStyles.body(
                  size: 14, color: ChonColors.textSecondary),
            ),
          ],
        ],
      ),
    );
  }
}

class _ComposeBody extends StatelessWidget {
  const _ComposeBody({required this.state, required this.cubit});
  final ReportV2State state;
  final ReportV2Cubit cubit;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Field(
            label: S.current.chon_report_field_title,
            hint: S.current.chon_report_field_title_hint,
            initial: state.title,
            onChanged: cubit.onTitleChanged,
            keyName: 'report.title',
          ),
          const SizedBox(height: 16),
          _Field(
            label: S.current.chon_report_field_content,
            hint: S.current.chon_report_field_content_hint,
            initial: state.content,
            onChanged: cubit.onContentChanged,
            keyName: 'report.content',
            maxLines: 6,
          ),
          const SizedBox(height: 16),
          _AttachmentRow(state: state, cubit: cubit),
          if (state.errorMessage.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(state.errorMessage,
                style: ChonTextStyles.body(size: 13)
                    .copyWith(color: const Color(0xFFE24B4A))),
          ],
          const SizedBox(height: 32),
          SizedBox(
            height: 52,
            child: ElevatedButton(
              key: const Key('report.submit'),
              onPressed: cubit.submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: ChonColors.brandPrimary,
                foregroundColor: ChonColors.textInverse,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                elevation: 0,
              ),
              child: Text(S.current.chon_action_send),
            ),
          ),
        ],
      ),
    );
  }
}

class _Field extends StatefulWidget {
  const _Field({
    required this.label,
    required this.hint,
    required this.initial,
    required this.onChanged,
    required this.keyName,
    this.maxLines = 1,
  });
  final String label;
  final String hint;
  final String initial;
  final ValueChanged<String> onChanged;
  final String keyName;
  final int maxLines;

  @override
  State<_Field> createState() => _FieldState();
}

class _FieldState extends State<_Field> {
  late final _controller = TextEditingController(text: widget.initial);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: ChonTextStyles.sectionLabel()),
        const SizedBox(height: 8),
        TextField(
          key: Key(widget.keyName),
          controller: _controller,
          onChanged: widget.onChanged,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            hintText: widget.hint,
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

class _AttachmentRow extends StatelessWidget {
  const _AttachmentRow({required this.state, required this.cubit});
  final ReportV2State state;
  final ReportV2Cubit cubit;
  @override
  Widget build(BuildContext context) {
    final hasAttachment = state.attachmentBase64?.isNotEmpty == true;
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            // The actual file picker / image picker call belongs in the
            // wrapper page where ImagePicker has BuildContext access.
            // Here we expose a no-op so the structure is in place.
            onPressed: () {},
            icon: const Icon(Icons.attach_file_outlined),
            label: Text(hasAttachment ? S.current.chon_action_attached : S.current.chon_action_attach),
            style: OutlinedButton.styleFrom(
              foregroundColor: ChonColors.textPrimary,
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        if (hasAttachment) ...[
          const SizedBox(width: 8),
          IconButton(
            tooltip: '첨부 제거',
            onPressed: cubit.clearAttachment,
            icon: const Icon(Icons.close,
                color: ChonColors.textSecondary),
          ),
        ],
      ],
    );
  }
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody({required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(color: ChonColors.brandPrimary),
          const SizedBox(height: 16),
          Text(label,
              style: ChonTextStyles.body(
                  size: 14, color: ChonColors.textSecondary)),
        ],
      ),
    );
  }
}

class _SuccessBody extends StatelessWidget {
  const _SuccessBody({required this.onClose});
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 64),
          const Icon(Icons.check_circle_outline,
              size: 96, color: ChonColors.brandPrimary),
          const SizedBox(height: 24),
          Text(
            S.current.chon_report_submitted,
            textAlign: TextAlign.center,
            style: ChonTextStyles.cardTitle().copyWith(fontSize: 22),
          ),
          const SizedBox(height: 8),
          Text(
            S.current.chon_report_submitted_sub,
            textAlign: TextAlign.center,
            style: ChonTextStyles.body(
                size: 14, color: ChonColors.textSecondary),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: onClose,
            style: ElevatedButton.styleFrom(
              backgroundColor: ChonColors.brandPrimary,
              foregroundColor: ChonColors.textInverse,
              minimumSize: const Size.fromHeight(52),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
            ),
            child: Text(S.current.chon_action_confirm),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _FailedBody extends StatelessWidget {
  const _FailedBody({required this.state, required this.cubit});
  final ReportV2State state;
  final ReportV2Cubit cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 64),
          const Icon(Icons.error_outline,
              size: 96, color: Color(0xFFE24B4A)),
          const SizedBox(height: 24),
          Text(S.current.chon_report_failed,
              textAlign: TextAlign.center,
              style: ChonTextStyles.cardTitle().copyWith(fontSize: 22)),
          const SizedBox(height: 8),
          if (state.errorMessage.isNotEmpty)
            Text(state.errorMessage,
                textAlign: TextAlign.center,
                style: ChonTextStyles.body(
                    size: 13, color: ChonColors.textTertiary)),
          const Spacer(),
          ElevatedButton(
            onPressed: cubit.retryFromFailed,
            style: ElevatedButton.styleFrom(
              backgroundColor: ChonColors.brandPrimary,
              foregroundColor: ChonColors.textInverse,
              minimumSize: const Size.fromHeight(52),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
            ),
            child: Text(S.current.chon_action_retry),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
