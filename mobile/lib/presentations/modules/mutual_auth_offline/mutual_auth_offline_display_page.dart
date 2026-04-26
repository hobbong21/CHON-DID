import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_offline/cubit/mutual_auth_offline_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// Display side of the offline mutual auth flow — Figma section 6
/// (`MutualAuthReq_02 (offline)` `853:22949`).
///
/// Shows the user's QR centered on a white card; the counterparty scans
/// it via [MutualAuthOfflineScanPage]. No remote calls happen here.
class MutualAuthOfflineDisplayPage extends StatefulWidget {
  const MutualAuthOfflineDisplayPage({
    super.key,
    required this.cubit,
    required this.card,
  });

  final MutualAuthOfflineCubit cubit;
  final CardInfoItem card;

  @override
  State<MutualAuthOfflineDisplayPage> createState() =>
      _MutualAuthOfflineDisplayPageState();
}

class _MutualAuthOfflineDisplayPageState
    extends State<MutualAuthOfflineDisplayPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.cubit.startDisplay(widget.card);
    });
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
          title: Text('내 QR', style: ChonTextStyles.cardTitle()),
        ),
        body: BlocBuilder<MutualAuthOfflineCubit, MutualAuthOfflineState>(
          builder: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    state.errorMessage,
                    style: ChonTextStyles.body(
                        size: 14, color: ChonColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
            final qr = state.displayQr;
            if (qr == null) {
              return const Center(
                child: CircularProgressIndicator(
                    color: ChonColors.brandPrimary),
              );
            }
            return _DisplayBody(qr: qr, card: widget.card);
          },
        ),
      ),
    );
  }
}

class _DisplayBody extends StatelessWidget {
  const _DisplayBody({required this.qr, required this.card});
  final String qr;
  final CardInfoItem card;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '상대방에게 이 QR을 보여주세요.',
              style: ChonTextStyles.body(
                  size: 14, color: ChonColors.textSecondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: ChonColors.bgSurface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: ChonColors.brandPrimary, width: 2),
              ),
              child: QrImageView(
                key: const Key('offline.qr'),
                data: qr,
                size: 240,
                backgroundColor: ChonColors.bgSurface,
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: ChonColors.textPrimary,
                ),
                dataModuleStyle: const QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.square,
                  color: ChonColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              card.name ?? '-',
              style: ChonTextStyles.cardTitle().copyWith(fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              card.idNumber ?? card.did ?? '',
              style: ChonTextStyles.body(
                  size: 13, color: ChonColors.textTertiary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
