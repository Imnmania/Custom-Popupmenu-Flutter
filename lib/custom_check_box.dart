import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final bool checked;

  const CustomCheckBox({
    super.key,
    required this.checked,
  });

  @override
  Widget build(BuildContext context) {
    if (!checked) {
      return Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white10,
            width: 1,
          ),
        ),
      );
    }
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      child: Center(
          child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
            ),
          ],
        ),
      )),
    );
  }
}
