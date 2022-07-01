// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/providers/themes.dart';

class ChangeThemeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return IconButton(
      onPressed: themeProvider.toggleTheme,
      icon: themeProvider.isDarkMode
          ? const Icon(Icons.sunny)
          : const Icon(Icons.nightlight),
    );
  }
}
