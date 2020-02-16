import 'package:flutter/material.dart';

class AccountInfoWidget extends StatefulWidget {
  final String title;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final bool edit;
  final bool isPassword;
  final String password;

  AccountInfoWidget({
    this.title,
    this.validator,
    this.onSaved,
    this.edit,
    this.isPassword = false,
    this.password,
  });

  @override
  _AccountInfoWidgetState createState() => _AccountInfoWidgetState();
}

class _AccountInfoWidgetState extends State<AccountInfoWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return widget.edit
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
                fontSize: 14.0,
              ),
              obscureText: widget.isPassword ? _obscureText : false,
              initialValue: widget.isPassword ? widget.password : widget.title,
              onSaved: widget.onSaved,
              validator: widget.validator,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.transparent,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 0.5,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                filled: true,
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      )
                    : null,
              ),
            ),
          )
        : Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
            ],
          );
  }
}
