import 'package:custom_popup_menu_btn_example/custom_pop_up_menu.dart';
import 'package:custom_popup_menu_btn_example/popupMenuProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom PopupMenuButton'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final currentBoardType = ref.watch(popupMenuProvider);
            return CustomPopupMenu(
              currentBoardType: currentBoardType,
              onNewBoardTypeSelected: (value) {
                debugPrint(value.name);
                ref.read(popupMenuProvider.notifier).update((state) => value);
              },
            );
          },
        ),
      ),
    );
  }
}
