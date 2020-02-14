import 'package:flutter/material.dart';

class GlobalTextFormField extends StatefulWidget {
  final String hintText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final bool isPassword;

  const GlobalTextFormField({
    this.hintText,
    this.onSaved,
    this.validator,
    this.isPassword = false,
  });

  @override
  _GlobalTextFormFieldState createState() => _GlobalTextFormFieldState();
}

class _GlobalTextFormFieldState extends State<GlobalTextFormField> {
  //--------------------------------variables-----------------------------------
  bool _obscureText = true;

  //----------------------------------build-------------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            right: 16.0,
            left: 16.0,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(
                16.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  40.0,
                ),
              ),
              hintText: widget.hintText,
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    )
                  : null,
            ),
            obscureText: widget.isPassword ? _obscureText : false,
            onSaved: widget.onSaved,
            validator: widget.validator,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
