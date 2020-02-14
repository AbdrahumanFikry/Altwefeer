import 'package:flutter/material.dart';

class PhoneNumberInput extends StatefulWidget {
  final String code;
  final List<String> codes;
  final Function onChanged;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

  PhoneNumberInput({
    this.code,
    this.codes,
    this.onChanged,
    this.onSaved,
    this.validator,
  });

  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  String currentValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              margin: const EdgeInsets.only(
                left: 16.0,
              ),
              child: InputDecorator(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(
                    16.0,
                  ),
                  errorStyle: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 16.0,
                  ),
                  hintText: widget.codes[0],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      40.0,
                    ),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: currentValue,
                    isDense: true,
                    onChanged: widget.onChanged,
                    isExpanded: false,
                    hint: Text(
                      widget.code,
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    iconDisabledColor: Colors.grey,
                    iconEnabledColor: Colors.grey,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    items: widget.codes.map(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width * 0.68,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16.0,
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
                    hintText: 'Mobile Number',
                  ),
                  onSaved: widget.onSaved,
                  validator: widget.validator,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
