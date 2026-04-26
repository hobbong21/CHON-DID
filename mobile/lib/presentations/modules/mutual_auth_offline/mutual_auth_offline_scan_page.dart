import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_offline/cubit/mutual_auth_offline_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/// Scan side of the offline mutual auth flow — Figma section 6
/// (`InProc_QR_02` `376:24436`).
///
/// Hosts a [MobileScanner] full-screen with a translucent target frame.
/// On detection it pushes the token into the cubit which calls
/// `verifyDid` and surfaces the decoded card via the `result` stage.
class MutualAuthOfflineScanPage extends StatefulWidget {
  const MutualAuthOfflineScanPage({super.key, required this.cubit});

  final MutualAuthOfflineCubit cubit;

  @override
  State<MutualAuthOfflineScanPage> createState() =>
      _MutualAuthOfflineScanPageState();
}

class _MutualAuthOfflineScanPageState
    extends State<MutualAuthOfflineScanPage> {
  late final MobileScannerController _scanner = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    facing: CameraFacing.back,
  );

  /// Guard so we only fire one verifyDid call per scan session.
  bool _consumed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.cubit.startScan();
    });
  }

  @override
  void dispose() {
    _scanner.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_consumed) return;
    final code = capture.barcodes.firstOrNull?.rawValue;
    if (code == null || code.isEmpty) return;
    _consumed = true;
    widget.cubit.onScanned(code);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cubit,
      child: BlocConsumer<MutualAuthOfflineCubit, MutualAuthOfflineState>(
        listenWhen: (a, b) => a.errorMessage != b.errorMessage,
        listener: (context, state) {
          // Re-arm scanning after an error so the user can try again.
          if (state.errorMessage.isNotEmpty &&
              state.stage == MutualAuthOfflineStage.scanning) {
            _consumed = false;
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ChonColors.bgPage,
            appBar: AppBar(
              backgroundColor: ChonColors.bgPage,
              foregroundColor: ChonColors.textPrimary,
              elevation: 0,
              centerTitle: true,
              title: Text(S.current.chon_mauth_off_scan_title, style: ChonTextStyles.cardTitle()),
            ),
            body: state.stage == MutualAuthOfflineStage.result
                ? _ResultBody(state: state, cubit: widget.cubit)
                : Stack(
                    fit: StackFit.expand,
                    children: [
                      MobileScanner(
                        key: const Key('offline.scanner'),
                        controller: _scanner,
                        onDetect: _onDetect,
                      ),
                      _ScannerOverlay(
                        isLoading:
                            state.stage == MutualAuthOfflineStage.verifying,
                        errorMessage: state.errorMessage,
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

class _ScannerOverlay extends StatelessWidget {
  const _ScannerOverlay({
    required this.isLoading,
    required this.errorMessage,
  });

  final bool isLoading;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ColoredBox(
            color: const Color(0x66000000),
          ),
        ),
        Center(
          child: Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                  color: ChonColors.brandPrimary, width: 3),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 32,
          child: Center(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0x99000000),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                isLoading
                    ? S.current.chon_mauth_off_verifying
                    : (errorMessage.isNotEmpty
                        ? errorMessage
                        : S.current.chon_mauth_off_scan_prompt),
                style: const TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: ChonColors.textInverse,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ResultBody extends StatelessWidget {
  const _ResultBody({required this.state, required this.cubit});
  final MutualAuthOfflineState state;
  final MutualAuthOfflineCubit cubit;

  @override
  Widget build(BuildContext context) {
    final card = state.scannedCard;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          const Icon(Icons.check_circle_outline,
              size: 80, color: ChonColors.brandPrimary),
          const SizedBox(height: 16),
          Text(
            S.current.chon_mauth_off_verified,
            textAlign: TextAlign.center,
            style: ChonTextStyles.cardTitle().copyWith(fontSize: 22),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ChonColors.bgSurface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.current.chon_profile_edit_given,
                    style: ChonTextStyles.body(
                        size: 12, color: ChonColors.textTertiary)),
                Text(card?.name ?? '-',
                    style: ChonTextStyles.body(size: 16)),
                const SizedBox(height: 12),
                Text('ID',
                    style: ChonTextStyles.body(
                        size: 12, color: ChonColors.textTertiary)),
                Text(card?.idNumber ?? card?.did ?? '-',
                    style: ChonTextStyles.body(size: 14)),
              ],
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: cubit.reset,
            style: ElevatedButton.styleFrom(
              backgroundColor: ChonColors.brandPrimary,
              foregroundColor: ChonColors.textInverse,
              minimumSize: const Size.fromHeight(52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Text(S.current.chon_action_confirm),
          ),
        ],
      ),
    );
  }
}
