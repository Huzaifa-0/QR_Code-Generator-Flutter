import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/main_view_provider.dart';
import 'providers/themes.dart';
import 'view/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainViewProvider(),
        ),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'QR Scanner',
          themeMode: themeProvider.themeMode,
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          home: const HomePage(),
        );
      },
    );
  }
}
