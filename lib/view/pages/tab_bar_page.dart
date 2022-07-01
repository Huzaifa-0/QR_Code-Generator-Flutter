import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/providers/main_view_provider.dart';

import '../widgets/change_theme_button_widget.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<MainViewProvider>(
        builder: (context, mainViewProvider, _) => Scaffold(
          appBar: AppBar(
            title: const Text('Quirky'),
            actions: [
              ChangeThemeButton(),
              // IconButton(onPressed: () {}, icon: Icon(Icons.abc)),
            ],
          ),
          body: mainViewProvider.tabs[mainViewProvider.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: mainViewProvider.currentIndex,
            onTap: (int index) => mainViewProvider.currentIndex = index,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.qr_code_rounded), label: 'Generate QR code'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.qr_code_scanner), label: 'Scan QR code'),
            ],
          ),
        ),
      ),
    );
  }
}
