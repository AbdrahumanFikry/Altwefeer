import 'package:flutter/material.dart';
import 'package:infinity/widgets/globalTextFormField.dart';
import 'package:infinity/widgets/globalButton.dart';
import 'package:infinity/widgets/phoneNumberInput.dart';
import '../widgets/dropDownFormFieldWidget.dart';

class AddAddressScreen extends StatefulWidget {
  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  //-------------------------------variables------------------------------------
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _fullName,
      _street,
      _building,
      _apartment = 'No apartment mentioned',
      _country = 'Country',
      _city = 'City',
      _code = '+20',
      _phoneNumber,
      _additionalDetail = 'No additional details';

  //------------------------------- methods ------------------------------------
  String nameValidator(value) {
    if (value.isEmpty) {
      return 'This field is required!';
    }
    return null;
  }

  String streetValidator(value) {
    if (value.isEmpty) {
      return 'This field is required!';
    }
    return null;
  }

  String building(value) {
    if (value.isEmpty) {
      return 'This field is required!';
    }
    return null;
  }

  String phoneNumberValidator(value) {
    if (value.length == 0) {
      return 'This field is required!';
    } else if (value.length < 9) {
      return 'number must greter than 9 numbers';
    }
    return null;
  }

  void onSavedName(value) {
    _fullName = value;
  }

  void onSavedStreet(value) {
    _street = value;
  }

  void onSavedBuilding(value) {
    _building = value;
  }

  void onSavedApartment(value) {
    if (!value.isEmpty) {
      _apartment = value;
    }
  }

  void onSavedCountry(value) {
    setState(() {
      _country = value;
    });
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  void onSavedCity(value) {
    setState(() {
      _city = value;
    });
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  void onCodeChanged(value) {
    setState(() {
      _code = value;
    });
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  void onSavedAdditionalDetail(value) {
    if (!value.isEmpty) {
      _additionalDetail = value;
    }
  }

  void onSavedPhone(value) {
    _phoneNumber = value;
  }

  Future<void> _saveAddress() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    final formData = _formKey.currentState;
    if (formData.validate()) {
      formData.save();
      print(':::::::::::::' + _fullName);
      print(':::::::::::::' + _country);
      print(':::::::::::::' + _city);
      print(':::::::::::::' + _street);
      print(':::::::::::::' + _building);
      print(':::::::::::::' + _apartment);
      print(':::::::::::::' + _code + _phoneNumber);
      print(':::::::::::::' + _additionalDetail);
      //TODO ---------
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        title: Text(
          'Add Address',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            GlobalTextFormField(
              hintText: 'Full Name',
              onSaved: onSavedName,
              validator: nameValidator,
            ),
            DropDownFormFieldWidget(
              hintText: _country,
              onChanged: onSavedCountry,
              listElements: [
                'Egypt',
                'England',
                'USA',
              ],
            ),
            DropDownFormFieldWidget(
              hintText: _city,
              onChanged: onSavedCity,
              listElements: [
                'Cairo',
                'Luxor',
                'Mansoura',
                'Aswan',
              ],
            ),
            GlobalTextFormField(
              hintText: 'Street',
              onSaved: onSavedStreet,
              validator: streetValidator,
            ),
            GlobalTextFormField(
              hintText: 'Building',
              onSaved: onSavedBuilding,
              validator: building,
            ),
            GlobalTextFormField(
              hintText: 'Apartment (optional)',
              onSaved: onSavedApartment,
              validator: null,
            ),
            PhoneNumberInput(
              onChanged: onCodeChanged,
              validator: phoneNumberValidator,
              onSaved: onSavedPhone,
              code: _code,
              codes: [
                '+20',
                '+966',
                '+951',
              ],
            ),
            GlobalTextFormField(
              hintText: 'Additional Detail(optional)',
              onSaved: onSavedAdditionalDetail,
              validator: null,
            ),
            GlobalButton(
              buttonTitle: 'Save Address',
              onTab: _saveAddress,
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
