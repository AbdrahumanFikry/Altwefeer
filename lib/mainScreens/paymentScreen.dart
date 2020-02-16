import 'package:flutter/material.dart';
import '../widgets/globalButton.dart';
import '../widgets/globalTextFormField.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  //----------------------------- variables ------------------------------------

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name, _cardNumber, _expiryDate = 'Expiry date', _cvvNumber;

  //------------------------------ methods -------------------------------------

  String nameValidator(value) {
    if (value.isEmpty) {
      return 'This field is required!';
    }
    return null;
  }

  String cardNumberValidator(value) {
    if (value.isEmpty || value.length < 16) {
      return 'Invalid card number!';
    }
    return null;
  }

  void datePicker() {
    DatePicker.showDatePicker(
      context,
      theme: DatePickerTheme(
        containerHeight: 210.0,
      ),
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime(2060, 12, 31),
      onConfirm: (date) {
        setState(() {
          _expiryDate = '${date.month}/${date.year}';
        });
      },
      currentTime: DateTime.now(),
      locale: LocaleType.en,
    );
  }

  String cvvValidator(value) {
    if (value.isEmpty || value.length < 2) {
      return 'Invalid cvv number!';
    }
    return null;
  }

  void onSavedName(value) {
    _name = value;
  }

  void onSavedCardNumber(value) {
    _cardNumber = value;
  }

  void onSavedCvv(value) {
    _cvvNumber = value;
  }

  Future<void> _addPayment() async {
    final formData = _formKey.currentState;
    if (formData.validate()) {
      formData.save();
      print(':::::::::::::' + _name);
      print(':::::::::::::' + _cardNumber);
      print(':::::::::::::' + _expiryDate);
      print(':::::::::::::' + _cvvNumber);
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
          'Payment',
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
              hintText: 'Name on card',
              onSaved: onSavedName,
              validator: nameValidator,
            ),
            GlobalTextFormField(
              hintText: 'Card number',
              onSaved: onSavedCardNumber,
              validator: cardNumberValidator,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: datePicker,
                    child: Container(
                      height: 50.0,
                      margin: EdgeInsets.only(
                        bottom: 20.0,
                        left: 16.0,
                        right: 16.0,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            30.0,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            _expiryDate,
                            style: TextStyle(
                              color: _expiryDate == 'Expiry date'
                                  ? Colors.teal
                                  : Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GlobalTextFormField(
                    hintText: 'CVV',
                    onSaved: onSavedCvv,
                    validator: cvvValidator,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            GlobalButton(
              buttonTitle: 'Add payment',
              onTab: _addPayment,
            ),
          ],
        ),
      ),
    );
  }
}
