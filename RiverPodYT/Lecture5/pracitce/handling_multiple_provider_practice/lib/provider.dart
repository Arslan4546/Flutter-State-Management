import 'package:flutter_riverpod/flutter_riverpod.dart';

final appProvider = StateProvider<AppState>((ref) {
  return AppState(showPassword: false, isDark: false);
});

class AppState {
  final bool showPassword;
  final bool isDark;

  AppState({required this.showPassword, required this.isDark});

  AppState copyWith({bool? showPassword, bool? isDark}) {
    return AppState(
      showPassword: showPassword ?? this.showPassword,
      isDark: isDark ?? this.isDark,
    );
  }
}
