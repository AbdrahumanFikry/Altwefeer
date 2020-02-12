import 'package:flutter/material.dart';

class AddAddressForm extends StatefulWidget {
  final String hintText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

  const AddAddressForm({
    this.hintText,
    this.onSaved,
    this.validator,
  });
  @override
  _AddAddressFormState createState() => _AddAddressFormState();
}

//--------------------------------variables-----------------------------------
//----------------------------------build-------------------------------------
class _AddAddressFormState extends State<AddAddressForm> {
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

//------------------------------------------------------------------------//
class DropDownFormFieldCountries extends StatefulWidget {
  final String hintText;
  DropDownFormFieldCountries({this.hintText});
  @override
  _DropDownFormFieldCountriesState createState() =>
      _DropDownFormFieldCountriesState();
}

var _currentSelectedValueCountries;
var countries = ['Egypt', 'London'];

class _DropDownFormFieldCountriesState
    extends State<DropDownFormFieldCountries> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16.0),
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(16.0),
                //labelStyle: textStyle,
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                hintText: widget.hintText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0))),
            isEmpty: _currentSelectedValueCountries == 'Country',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _currentSelectedValueCountries,
                isDense: true,
                onChanged: (String newValue) {
                  setState(() {
                    _currentSelectedValueCountries = newValue;
                    state.didChange(newValue);
                  });
                },
                items: countries.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}

//-------------------------------------------------------------------//
class DropDownFormFieldCities extends StatefulWidget {
  final String hintText;
  DropDownFormFieldCities({this.hintText});
  @override
  _DropDownFormFieldCitiesState createState() =>
      _DropDownFormFieldCitiesState();
}

var _currentSelectedValueCities;
var cities = ['Mansoura', 'Cairo'];

class _DropDownFormFieldCitiesState extends State<DropDownFormFieldCities> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16.0),
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(16.0),
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                hintText: widget.hintText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0))),
            isEmpty: _currentSelectedValueCities == 'City',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _currentSelectedValueCities,
                isDense: true,
                onChanged: (String newValue) {
                  setState(() {
                    _currentSelectedValueCities = newValue;
                    state.didChange(newValue);
                  });
                },
                items: cities.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
