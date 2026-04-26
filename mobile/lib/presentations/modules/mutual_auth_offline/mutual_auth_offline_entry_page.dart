import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:flutter/material.dart';

/// Entry page for the offline mutual auth flow — Figma section 6
/// (Home offline variant `602:43544` / InProc_QR_01 `376:24285`).
///
/// Two big cards: "내 QR 보여주기" → display page, "상대 QR 스캔하기"
/// → scan page. Pure presentation; the actual cubit + repos are wired
/// up in the router.
class MutualAuthOfflineEntryPage extends StatelessWidget {
  const MutualAuthOfflineEntryPage({
    super.key,
    required this.onShowMyQr,
    required this.onScanQr,
  });

  final VoidCallback onShowMyQr;
  final VoidCallback onScanQr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChonColors.bgPage,
      appBar: AppBar(
        backgroundColor: ChonColors.bgPage,
        foregroundColor: ChonColors.textPrimary,
        elevation: 0,
        centerTitle: true,
        title: Text('오프라인 상호인증', style: ChonTextStyles.cardTitle()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                '오프라인에서 가족과 서로의\nCHON ID를 확인할 수 있어요.',
                textAlign: TextAlign.center,
                style: ChonTextStyles.body(
                  size: 16,
                  color: ChonColors.textSecondary,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              _ActionCard(
                key: const Key('offline.entry.show'),
                icon: Icons.qr_code_2,
                title: '내 QR 보여주기',
                subtitle: '상대방이 내 QR을 스캔합니다.',
                onTap: onShowMyQr,
              ),
              const SizedBox(height: 12),
              _ActionCard(
                key: const Key('offline.entry.scan'),
                icon: Icons.qr_code_scanner_outlined,
                title: '상대 QR 스캔하기',
                subtitle: '카메라로 상대방의 QR을 인식합니다.',
                onTap: onScanQr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ChonColors.bgSurface,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFE7B8),
                  shape: BoxShape.circle,
                ),
                child:
                    Icon(icon, color: ChonColors.brandPrimary, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: ChonTextStyles.cardTitle()
                          .copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: ChonTextStyles.body(
                          size: 13, color: ChonColors.textSecondary),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right,
                  color: ChonColors.textTertiary),
            ],
          ),
        ),
      ),
    );
  }
}
