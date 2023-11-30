import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final void Function(String)? onChanged;
  final String label;
  final bool isPassword;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final Icon? icono;
  final String? initialValue;
  final TextStyle? style;
  final int? maxLength;
  final int? maxLines;

  const InputField({
    Key? key,
    this.onChanged,
    required this.label,
    required this.isPassword,
    this.inputType,
    this.validator,
    this.icono,
    this.initialValue,
    this.style = const TextStyle(color: Colors.white),
    this.maxLength,
    this.maxLines,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return FormField<String>(
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: widget.initialValue,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              style: widget.style,
              onChanged: (text) {
                if (widget.validator != null) {
                  // ignore: invalid_use_of_protected_member
                  state.setValue(text);
                  state.validate();
                }
                if (widget.onChanged != null) {
                  widget.onChanged!(text);
                }
              },
              obscureText: _obscureText,
              keyboardType: widget.inputType,
              decoration: InputDecoration(
                icon: widget.icono,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                ),
                labelText: widget.label,
                labelStyle: widget.style,
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                  borderSide: BorderSide(
                    width: 2,
                    color: colors.primary,
                  ),
                ),
                suffixIcon: widget.isPassword
                    ? CupertinoButton(
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _obscureText = !_obscureText;
                          setState(() {});
                        },
                      )
                    : Container(width: 0),
              ),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  state.errorText!,
                  style: const TextStyle(color: Colors.redAccent),
                ),
              )
          ],
        );
      },
    );
  }
}
