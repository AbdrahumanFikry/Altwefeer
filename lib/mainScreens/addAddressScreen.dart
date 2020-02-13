import 'package:flutter/material.dart';
import '../widgets/addAddressForm.dart';

class AddAddressScreen extends StatefulWidget {
  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  //-------------------------------variables------------------------------------
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _fullNmae, _street, _building, _appartement, _additionalDetail;
  int _phoneNumber;

  //-------------------------------functions------------------------------------
  String nameValidator(value) {
    if (value.isEmpty) {
      return 'Invalid name!';
    }
    return null;
  }

  String streetValidator(value) {
    if (value.isEmpty) {
      return 'street is empty!';
    }
    return null;
  }

  String building(value) {
    if (value.isEmpty) {
      return 'building is empty!';
    }
    return null;
  }

  String phoneNumberValidator(value) {
    if (value.length == 0) {
      return 'phone number is empty!';
    } else if (value.length < 8) {
      return 'number must greter than 8 numbers';
    }
    return null;
  }

  void onSavedName(value) {
    _fullNmae = value;
  }

  void onSavedStreet(value) {
    _street = value;
  }

  void onSavedBuilding(value) {
    _building = value;
  }

  void onSavedApartment(value) {
    _street = value;
  }

  void onSavedAdditionalDetail(value) {
    _additionalDetail = value;
  }

  void onSavedPhone(value) {
    _phoneNumber = value;
  }

  //--------------------------------------------------------------------//
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
            AddAddressForm(
              hintText: 'Full Name',
              onSaved: onSavedName,
              validator: nameValidator,
            ),
            DropDownFormFieldCountries(
              hintText: 'Egypt',
            ),
            SizedBox(
              height: 20.0,
            ),
            DropDownFormFieldCities(
              hintText: 'City',
            ),
            SizedBox(
              height: 20.0,
            ),
            AddAddressForm(
              hintText: 'Street',
              onSaved: onSavedStreet,
              validator: streetValidator,
            ),
            AddAddressForm(
              hintText: 'Building',
              onSaved: onSavedBuilding,
              validator: building,
            ),
            AddAddressForm(
              hintText: 'Apartment(optional)',
              onSaved: onSavedApartment,
            ),
            AddAddressForm(
              hintText: 'Mobile Number',
              onSaved: onSavedPhone,
              validator: phoneNumberValidator,
            ),
            AddAddressForm(
              hintText: 'Additional Detail(optional)',
              onSaved: onSavedAdditionalDetail,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Container(
                  height: 42,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xff008BFF),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      'Save Address',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
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
