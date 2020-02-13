import 'package:flutter/material.dart';


class PaymentForm extends StatefulWidget {
  final String hintText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

  PaymentForm({this.hintText,this.onSaved,this.validator});

  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0),
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: widget.hintText,
            ),
            obscureText: false,
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
