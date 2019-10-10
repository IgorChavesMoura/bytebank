import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;

  final IconData icon;

  Editor({this.controller, this.label, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      style: TextStyle(fontSize: 24.0),
      decoration: InputDecoration(
          icon: this.icon != null ? Icon(this.icon) : null,
          labelText: this.label,
          hintText: this.hint),
      keyboardType: TextInputType.number,
    );
  }
}