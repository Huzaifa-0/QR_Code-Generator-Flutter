import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/providers/main_view_provider.dart';

import 'tab_bar_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewProvider>(
      builder: (context, mainViewProvider, _) => const TabBarPage(),
    );
  }
}
