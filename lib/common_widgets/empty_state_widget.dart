import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyStateWidget extends ConsumerWidget {
  final VoidCallback onRefresh;
  const EmptyStateWidget({
    super.key,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Icon(size: 72, Icons.search_off_outlined, color: Colors.grey),
        SizedBox(height: 4.h),
        Text(AppLocalizations.of(context).noDataMessage,
            style: Theme.of(context).textTheme.headlineLarge),
        SizedBox(height: 12.h),
        ElevatedButton(
          onPressed: onRefresh,
          child: const Text('Refresh'),
        )
      ],
    );
  }
}
