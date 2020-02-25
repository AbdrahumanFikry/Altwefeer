import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/globalButton.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  //-------------------------------variables------------------------------------

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _verifyNumber;
  Timer timer;
  int startTime = 59;

  //--------------------------------methods-------------------------------------

  String codeValidator(value) {
    if (value.isEmpty || value.length < 4) {
      return 'Invalid code!';
    }
    return null;
  }

  void onSavedCode(value) {
    _verifyNumber = value;
  }

  Future<void> _verify() async {
    final formData = _formKey.currentState;
    if (formData.validate()) {
      formData.save();
      print(':::::::::::::' + _verifyNumber);
      //TODO ---------
    }
  }

  Future<void> _resendCode() async {
    setState(() {
      startTime = 59;
    });
    startTimer();
    //TODO ---------
  }

  void _changeNumber() {
    //TODO ---------
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (!mounted) return;
        setState(() {
          if (startTime < 1) {
            timer.cancel();
          } else {
            startTime = startTime - 1;
          }
        });
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        title: Text(
          'Verify',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '+201015629592',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                InkWell(
                  onTap: _changeNumber,
                  child: Text(
                    'change',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 70.0,
              ),
              child: PinCodeTextField(
                pinBoxWidth: 60.0,
                pinBoxHeight: 60.0,
                pinBoxRadius: 10.0,
                highlight: true,
                highlightColor: Colors.blue,
                defaultBorderColor: Colors.black,
                hasTextBorderColor: Colors.blue,
                maxLength: 4,
                onDone: onSavedCode,
                pinBoxDecoration:
                    ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                pinTextStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20.0,
                  color: Colors.black,
                ),
                pinTextAnimatedSwitcherTransition:
                    ProvidedPinBoxTextAnimation.scalingTransition,
                pinTextAnimatedSwitcherDuration: Duration(milliseconds: 200),
                highlightAnimationBeginColor: Colors.black,
                highlightAnimationEndColor: Colors.white12,
                keyboardType: TextInputType.text,
              ),
            ),
            GlobalButton(
              buttonTitle: 'verify',
              onTab: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                _verify();
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            startTime == 0
                ? InkWell(
                    onTap: _resendCode,
                    child: Text(
                      'Resend',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16.0,
                        color: Colors.blue,
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Resent after',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        startTime.toString() + 's',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
