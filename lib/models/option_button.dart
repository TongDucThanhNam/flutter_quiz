import "package:flutter/material.dart";

class OptionButton extends StatelessWidget {
  const OptionButton(
      {super.key, required this.optionText, required this.onTap});

  final String optionText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: onTap,
      child: Text(
        optionText,
        style: const TextStyle(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
