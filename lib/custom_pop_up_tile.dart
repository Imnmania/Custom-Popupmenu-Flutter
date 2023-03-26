import 'package:flutter/material.dart';

class CustomPopupTile extends StatelessWidget {
  final String titleText;
  final VoidCallback onTap;
  final Widget? extra;
  final Color? titleColor;

  const CustomPopupTile({
    required this.titleText,
    required this.onTap,
    this.titleColor,
    super.key,
    this.extra,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 65,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Text(
              titleText,
              style: TextStyle(
                color: titleColor ?? Theme.of(context).primaryColorDark,
              ),
            ),
            if (extra != null) const Spacer(),
            if (extra != null) extra!,
          ],
        ),
      ),
    );
  }
}
