import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final bool disabled;

  const OptionButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: backgroundColor,
        textStyle: const TextStyle(fontSize: 18, color: Colors.white),
      ),
      child: Text(text),
    );
  }
}
