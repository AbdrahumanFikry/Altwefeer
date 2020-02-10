import 'package:flutter/material.dart';
import '../authScreens/SignUpScreen.dart';
import '../widgets/AuthTextFormField.dart';
import '../widgets/SignButton.dart';
import '../widgets/facebookSigning.dart';
import '../widgets/pageRoute.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  //-------------------------------variables------------------------------------
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _email, _password;

  //--------------------------------methods-------------------------------------
  String emailValidator(value) {
    if (value.isEmpty || !value.contains('@')) {
      return 'Invalid email!';
    }
    return null;
  }

  String passwordValidator(value) {
    if (value.isEmpty || value.length < 5) {
      return 'password is too short!';
    }
    return null;
  }

  void onSavedEmail(value) {
    _email = value;
  }

  void onSavedPassword(value) {
    _password = value;
  }

  void _facebookSignUp() {
    //TODO ---------
  }

  void _doNotHaveAccount() {
    Navigator.push(context, FadeRoute(page: SignUpScreen()));
  }

  void _forgotPassword() {
    //TODO ---------
  }

  Future<void> _login() async {
    final formData = _formKey.currentState;
    if (formData.validate()) {
      formData.save();
      print(':::::::::::::' + _email);
      print(':::::::::::::' + _password);
      //TODO ---------
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
            ),
            FaceBookSigning(
              onTab: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                _facebookSignUp();
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            //----------------------------Divider-------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 1.0,
                  color: Color(0xffCFCFCF),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                    left: 8.0,
                  ),
                  child: Text(
                    'Or',
                    style: TextStyle(
                      color: Color(0xffCFCFCF),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 1.0,
                  color: Color(0xffCFCFCF),
                ),
              ],
            ),
            //------------------------------------------------------------------
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Center(
              child: Text(
                'Login to your Account',
                style: TextStyle(
                  color: Color(0xff707070),
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            AuthTextFormField(
              hintText: 'Email Address',
              onSaved: onSavedEmail,
              validator: emailValidator,
              isPassword: false,
            ),
            AuthTextFormField(
              hintText: 'Password',
              onSaved: onSavedPassword,
              validator: passwordValidator,
              isPassword: true,
            ),
            SignButton(
              buttonTitle: 'Sign in',
              onTab: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                _login();
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: _forgotPassword,
              child: Center(
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Center(
              child: Text(
                "Don't have an account?",
                style: TextStyle(
                  color: Color(0xff707070),
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                _doNotHaveAccount();
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
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
