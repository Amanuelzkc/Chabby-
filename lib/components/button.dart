import 'package:flutter/material.dart';

class Calculatebtn extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;

  const Calculatebtn({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding:
              const EdgeInsets.only(left: 100, right: 100, top: 15, bottom: 15),
          child: child,
        ));
  }
}
