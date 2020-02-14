import 'package:flutter/material.dart';
import '../widgets/AuthTextFormField.dart';
import '../widgets/globalButton.dart';
import '../authScreens/checkEmailScreen.dart';
import '../widgets/pageRoute.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  //----------------------------------variables-----------------------//
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _email;

  //-----------------------------------functions-----------------------//
  String emailValidator(value) {
    if (value.isEmpty || !value.contains('@')) {
      return 'Invalid email!';
    }
    return null;
  }

  void onSavedEmail(value) {
    _email = value;
  }

  Future<void> _forgotPassword() async {
    final formData = _formKey.currentState;
    if (formData.validate()) {
      formData.save();
      print(':::::::::::::' + _email);
      //TODO ----------
      Navigator.push(
        context,
        FadeRoute(
          page: CheckEmailScreen(),
        ),
      );
    }
  }

  //------------------------------------build----------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        title: Text(
          'Forgot Password',
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
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            AuthTextFormField(
              hintText: 'Email Address',
              isPassword: false,
              validator: emailValidator,
              onSaved: onSavedEmail,
            ),
            GlobalButton(
              buttonTitle: 'Continue',
              onTab: _forgotPassword,
            )
          ],
        ),
      ),
    );
  }
}
