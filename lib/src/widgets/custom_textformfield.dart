import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hintText;

  final String? labelText;

  final String? helperText;

  final String? counterText;

  final String? initialValue;

  final IconData? suffixIcon;

  final IconData? prefixIcon;

  final IconData? icon;

  final TextInputType? textInputType;

  final bool obscureText;

  final bool autofocus;

  final void Function(String)? onChanged;
  final String Function(String?)? validator;

  const CustomTextFormField(
      {Key? key,
      this.hintText,
      this.labelText,
      this.helperText,
      this.counterText,
      this.initialValue,
      this.suffixIcon,
      this.prefixIcon,
      this.icon,
      this.onChanged,
      this.validator,
      this.textInputType,
      this.obscureText = false,
      this.autofocus = false})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode myFocusNode;
  _CustomTextFormFieldState();
  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: myFocusNode,
      onTap: _requestFocus,
      autofocus: widget.autofocus,
      keyboardType: widget.textInputType,
      obscureText: widget.obscureText,
      initialValue: widget.initialValue,
      textCapitalization: TextCapitalization.words,
      onChanged: widget.onChanged,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.labelText,
        labelText: widget.labelText,
        labelStyle: TextStyle(
            color: myFocusNode.hasFocus
                ? Theme.of(context).primaryColor
                : Colors.grey),
        helperText: widget.helperText,
        counterText: widget.counterText,
        suffixIcon: widget.suffixIcon == null
            ? null
            : Icon(widget.suffixIcon,
                color: myFocusNode.hasFocus
                    ? Theme.of(context).primaryColor
                    : Colors.grey),
        prefixIcon: widget.prefixIcon == null
            ? null
            : Icon(widget.prefixIcon,
                color: myFocusNode.hasFocus
                    ? Theme.of(context).primaryColor
                    : Colors.grey),
        icon: widget.icon == null
            ? null
            : Icon(widget.icon,
                color: myFocusNode.hasFocus
                    ? Theme.of(context).primaryColor
                    : Colors.grey),
      ),
    );
  }
}
