import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final IconData icon;
  final TextEditingController controller;
  final String label;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? Function(String? value)? validate;
  
  const TextInputWidget({
    super.key,
    required this.controller,
    required this.label,
    this.textInputType,
    this.maxLines,
    this.validate, required this.icon});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType ?? TextInputType.text,
      maxLines: widget.maxLines ?? 1,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: Icon(widget.icon),
        alignLabelWithHint: true,
        border: OutlineInputBorder(),
      ),

      onChanged: (String? value){
        print("${widget.label} : $value");
      },

      validator: widget.validate,
    );
  }
}
