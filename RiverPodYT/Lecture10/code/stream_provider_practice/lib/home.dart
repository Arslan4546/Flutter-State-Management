import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stream_provider_practice/stream_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Consumer(
        builder: (context, ref, child) {
          final asyncValue = ref.watch(streamProvider);
          return asyncValue.when(
            skipLoadingOnRefresh: false,
            data: (price) => Center(
              child: Text('Current Price: \$${price.toStringAsFixed(2)}'),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(
              child: TextButton(
                onPressed: () => ref.invalidate(streamProvider),
                child: Text('Error: $error'),
              ),
            ),
          );
        },
      ),
    );
  }
}
