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
            data: (price) => Center(
              child: Text('Current Price: \$${price.toStringAsFixed(2)}'),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
          );
        },
      ),
    );
  }
}
