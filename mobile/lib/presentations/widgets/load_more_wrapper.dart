import 'package:flutter/material.dart';

typedef RefreshCallback = Future<void> Function();
typedef LoadMoreCallback = Future<void> Function();

class LoadMoreWrapper extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool hasMore;
  final RefreshCallback onRefresh;
  final LoadMoreCallback onLoadMore;
  final double triggerOffset;

  const LoadMoreWrapper({
    super.key,
    required this.child,
    required this.isLoading,
    required this.hasMore,
    required this.onLoadMore,
    required this.onRefresh,
    this.triggerOffset = 200,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        final current = scrollInfo.metrics.pixels;
        final max = scrollInfo.metrics.maxScrollExtent;

        if (hasMore && !isLoading && current >= (max - triggerOffset)) {
          onLoadMore();
        }

        return false;
      },
      child: RefreshIndicator(onRefresh: onRefresh, child: child),
    );
  }
}
