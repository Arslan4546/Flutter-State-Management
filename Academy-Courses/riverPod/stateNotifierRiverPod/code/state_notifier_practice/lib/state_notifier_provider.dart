import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier_practice/counter.dart';

final stateProvider = StateNotifierProvider<Counter, int>((ref) => Counter());
