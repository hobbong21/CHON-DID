import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/presentations/modules/inproc_contact_v2/cubit/inproc_contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// "Contact in Process" page — Figma section 8.
///
/// Single page that switches view by [InProcContactState.stage]:
/// idle → preparing card, inProgress → live call card with timer,
/// completed → success card, failed → error with retry.
class InProcContactPage extends StatelessWidget {
  const InProcContactPage({super.key, required this.cubit});

  final InProcContactCubit cubit;

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
          title: Text('연락하기', style: ChonTextStyles.cardTitle()),
        ),
        body: BlocBuilder<InProcContactCubit, InProcContactState>(
          builder: (context, state) {
            switch (state.stage) {
              case InProcContactStage.idle:
                return const _IdleBody();
              case InProcContactStage.inProgress:
                return _InProgressBody(state: state);
              case InProcContactStage.completed:
                return _CompletedBody(state: state, onClose: cubit.reset);
              case InProcContactStage.failed:
                return _FailedBody(state: state, onRetry: cubit.reset);
            }
          },
        ),
      ),
    );
  }
}

class _IdleBody extends StatelessWidget {
  const _IdleBody();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          '연락할 가족을 선택해주세요.',
          style: ChonTextStyles.body(
              size: 14, color: ChonColors.textSecondary),
        ),
      ),
    );
  }
}

class _InProgressBody extends StatelessWidget {
  const _InProgressBody({required this.state});
  final InProcContactState state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 32),
          const Center(
            child: _PulsingPhoneIcon(),
          ),
          const SizedBox(height: 24),
          Text(
            '연결 중…',
            textAlign: TextAlign.center,
            style: ChonTextStyles.cardTitle().copyWith(fontSize: 22),
          ),
          const SizedBox(height: 24),
          _ContactCard(
            name: state.contactName,
            phone: state.contactPhone,
          ),
          const Spacer(),
          OutlinedButton(
            onPressed: () => Navigator.of(context).maybePop(),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: const Text('취소'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _CompletedBody extends StatelessWidget {
  const _CompletedBody({required this.state, required this.onClose});
  final InProcContactState state;
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
            '통화가 끝났어요.',
            textAlign: TextAlign.center,
            style: ChonTextStyles.cardTitle().copyWith(fontSize: 22),
          ),
          const SizedBox(height: 16),
          _ContactCard(
            name: state.contactName,
            phone: state.contactPhone,
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: onClose,
            style: ElevatedButton.styleFrom(
              backgroundColor: ChonColors.brandPrimary,
              foregroundColor: ChonColors.textInverse,
              minimumSize: const Size.fromHeight(52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: const Text('확인'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _FailedBody extends StatelessWidget {
  const _FailedBody({required this.state, required this.onRetry});
  final InProcContactState state;
  final VoidCallback onRetry;
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
          Text(
            '연결할 수 없어요.',
            textAlign: TextAlign.center,
            style: ChonTextStyles.cardTitle().copyWith(fontSize: 22),
          ),
          const SizedBox(height: 8),
          if (state.errorMessage.isNotEmpty)
            Text(
              state.errorMessage,
              textAlign: TextAlign.center,
              style: ChonTextStyles.body(
                  size: 13, color: ChonColors.textTertiary),
            ),
          const Spacer(),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: ChonColors.brandPrimary,
              foregroundColor: ChonColors.textInverse,
              minimumSize: const Size.fromHeight(52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: const Text('다시 시도'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({required this.name, required this.phone});
  final String name;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ChonColors.bgSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xFFFFE7B8),
            child: Icon(Icons.person_outline, color: ChonColors.textPrimary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name.isEmpty ? '-' : name,
                    style: ChonTextStyles.cardTitle()
                        .copyWith(fontSize: 16)),
                const SizedBox(height: 4),
                Text(phone.isEmpty ? '-' : phone,
                    style: ChonTextStyles.body(
                        size: 13, color: ChonColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PulsingPhoneIcon extends StatefulWidget {
  const _PulsingPhoneIcon();
  @override
  State<_PulsingPhoneIcon> createState() => _PulsingPhoneIconState();
}

class _PulsingPhoneIconState extends State<_PulsingPhoneIcon>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final t = _controller.value;
        return Container(
          width: 96 + 32 * t,
          height: 96 + 32 * t,
          decoration: BoxDecoration(
            color: ChonColors.brandPrimary
                .withValues(alpha: 0.15 + 0.15 * (1 - t)),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(Icons.phone_outlined,
                size: 56, color: ChonColors.brandPrimary),
          ),
        );
      },
    );
  }
}
