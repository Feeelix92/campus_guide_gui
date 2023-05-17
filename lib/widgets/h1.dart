import 'package:flutter/material.dart';

class H1 extends StatefulWidget {
  const H1({
    super.key,
    required String text,
  }) : _text = text;

  final String _text;

  @override
  State<H1> createState() => _H1State();
}

class _H1State extends State<H1> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget._text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}