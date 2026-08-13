import 'package:flutter/material.dart';

class MyPostButton extends StatelessWidget {
  final void Function()? ontap;
  const MyPostButton({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Icon(Icons.done, color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
