import 'package:api_practice/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiProvider = ref.watch(productAPIProvider);
    return Scaffold();
  }
}
