import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  const NavButton({
    Key? key,
    required this.title,
    required this.page,
  }) : super(key: key);

  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () => Navigator.push<void>(
        context,
        MaterialPageRoute<void>(builder: (_) => page),
      ),
      title: title,
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 64,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
