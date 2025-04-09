import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final colorListProvider = Provider((ref) => colorThemes);

final isDarkModeProvider = StateProvider<bool>((ref) => false);

final selectedColorProvider = StateProvider<int>((ref) => 0);
//final selectedColorProvider = StateProvider<Color>((ref) => ref.watch(colorListProvider).first);

// Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
  );

// Controller or notifier
class ThemeNotifier extends StateNotifier<AppTheme> {

  // State = new AppTheme
  // Constructor
  ThemeNotifier() : super( AppTheme());

}


