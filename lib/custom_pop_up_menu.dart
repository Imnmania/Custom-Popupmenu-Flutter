// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:custom_popup_menu_btn_example/custom_check_box.dart';
import 'package:custom_popup_menu_btn_example/custom_pop_up_tile.dart';
import 'package:flutter/material.dart';

enum BoardType { list, board }

typedef OnNewBoardTypeSelected = Function(BoardType);

class CustomPopupMenu extends StatelessWidget {
  final BoardType currentBoardType;
  final OnNewBoardTypeSelected onNewBoardTypeSelected;

  const CustomPopupMenu({
    Key? key,
    required this.currentBoardType,
    required this.onNewBoardTypeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          splashColor: Colors.transparent, highlightColor: Colors.transparent),
      child: PopupMenuButton<BoardType>(
        splashRadius: 30,
        tooltip: "Hi",
        enableFeedback: false,
        onSelected: onNewBoardTypeSelected,
        itemBuilder: (context) {
          return [
            /* const PopupMenuItem<BoardType>(
              value: BoardType.board,
              child: Text('Board'),
            ),
            const PopupMenuItem<BoardType>(
              value: BoardType.list,
              child: Text('List'),
            ), */

            _CustomPopupMenuItem(
              value: BoardType.list,
              isActive: currentBoardType == BoardType.list,
            ),
            PopupMenuItem(
              padding: EdgeInsets.zero,
              height: 1,
              child: Container(
                height: 1,
                color: Colors.white,
              ),
            ),
            _CustomPopupMenuItem(
              value: BoardType.board,
              isActive: currentBoardType == BoardType.board,
            ),
          ];
        },
        color: Colors.grey[600],
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width),
        position: PopupMenuPosition.under,
        offset: const Offset(0, 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Task ${currentBoardType == BoardType.list ? 'List' : 'Board'}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(width: 5),
            const Icon(Icons.arrow_drop_down_rounded),
          ],
        ),
      ),
    );
  }
}

class _CustomPopupMenuItem extends PopupMenuEntry<BoardType> {
  final BoardType value;
  final bool isActive;

  const _CustomPopupMenuItem({
    required this.value,
    required this.isActive,
  });

  @override
  State<StatefulWidget> createState() {
    return _CustomPopupMenuItemState();
  }

  @override
  double get height => 60;

  @override
  bool represents(BoardType? value) {
    return value == this.value;
  }
}

class _CustomPopupMenuItemState extends State<_CustomPopupMenuItem> {
  @override
  Widget build(BuildContext context) {
    return CustomPopupTile(
      titleText: widget.value == BoardType.list ? 'List' : 'Board',
      onTap: () => Navigator.pop(context, widget.value),
      titleColor: Colors.white,
      extra: CustomCheckBox(checked: widget.isActive),
    );
  }
}
