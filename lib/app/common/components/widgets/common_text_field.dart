import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    super.key,
    required this.hintText,
    this.onChange,
    this.onSubmit,
    this.validate,
    this.fieldController,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.fieldAction = TextInputAction.next,
  });

  final String hintText;
  final bool isPassword;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final TextInputType keyboardType;
  final TextEditingController? fieldController;
  final TextInputAction fieldAction;
  final String? Function(String?)? validate;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool showPassword = false;

  void _passwordVisbilityFunction() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.fieldController,
      onChanged: widget.onChange,
      onFieldSubmitted: widget.onSubmit,
      validator: widget.validate,
      keyboardType: widget.keyboardType,
      textInputAction: widget.fieldAction,
      obscureText: widget.isPassword ? showPassword : false,
      style: const TextStyle(fontSize: 12.0, color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 12.0,
          color: Colors.grey.shade700,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: _passwordVisbilityFunction,
                icon: showPassword
                    ? const Icon(
                        Icons.visibility,
                      )
                    : const Icon(
                        Icons.visibility_off,
                      ),
              )
            : null,
        contentPadding: const EdgeInsets.all(16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 1.0,
            strokeAlign: 10.0,
            color: Color(0xff2F4093),
          ),
        ),
      ),
    );
  }
}
