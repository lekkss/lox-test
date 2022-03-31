import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String initialValue;
  final TextInputType inputType;
  final TextEditingController textController;
  final String label;
  final String hintText;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int maxLines;
  final int minLines;
  final TextInputAction keyboardAction;
  final FocusNode focusNode;
  final String Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final void Function(String?)? onChanged;
  final void Function(String?)? onFieldSubmitted;
  final void Function()? onEditComplete;
  const CustomTextField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.initialValue,
    required this.textController,
    this.inputType = TextInputType.text,
    required this.prefixIcon,
    required this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    required this.maxLines,
    this.minLines = 1,
    this.keyboardAction = TextInputAction.next,
    required this.focusNode,
    this.validator,
    this.onSaved,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black54,
            width: 0.0,
          ),
        ),
        filled: true,
        hintStyle: const TextStyle(
            // color: Colors.white,
            ),
        hintText: hintText,
        fillColor: Colors.white30,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        errorStyle: TextStyle(
          color: Theme.of(context).errorColor,
          fontSize: 14,
        ),
      ),
      style: const TextStyle(color: Colors.black),
      enabled: enabled,
      obscureText: obscureText,
      readOnly: readOnly,
      keyboardType: inputType,
      textInputAction: keyboardAction,
      validator: validator,
      onSaved: onSaved,
      focusNode: focusNode,
      onTap: onTap,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      controller: textController,
      onEditingComplete: onEditComplete,
      maxLines: obscureText ? 1 : maxLines,
      minLines: minLines,
    );
  }
}
