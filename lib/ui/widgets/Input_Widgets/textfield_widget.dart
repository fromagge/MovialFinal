import 'package:flutter/material.dart';

class DefaultTextWidget extends StatefulWidget {
  String label;
  final TextInputType textInputType;
  final bool showPassword;
  String? Function(String?)? validator;
  FocusNode? myFocusNode;
  final int maxLines;
  final String initialText;
  final double fontSize;

  DefaultTextWidget({
    super.key,
    this.label = "",
    this.showPassword = false,
    this.textInputType = TextInputType.text,
    this.validator,
    this.myFocusNode,
    this.maxLines = 1,
    this.initialText = "",
    this.fontSize = 18,
  });

  @override
  State<DefaultTextWidget> createState() => _DefaultTextWidgetState();
}

class _DefaultTextWidgetState extends State<DefaultTextWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 5, left: 11),
            child: Text(
              widget.label,
            )),
        TextFormField(
          controller: _controller,
          onTap: () {
            _controller.text == widget.initialText ? _controller.clear() : null;
          },
          obscureText: widget.showPassword,
          keyboardType: widget.textInputType,
          maxLines: widget.showPassword ? 1 : widget.maxLines,
          focusNode: widget.myFocusNode,
          style: TextStyle(
            fontSize: widget.fontSize,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              top: 15,
              bottom: 10,
              left: 10,
            ),
            filled: true,
            fillColor: widget.myFocusNode != null
                ? widget.myFocusNode!.hasFocus
                    ? Colors.white
                    : Colors.grey.shade200
                : Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            errorStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
