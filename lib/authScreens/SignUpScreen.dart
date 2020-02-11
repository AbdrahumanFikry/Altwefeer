import 'package:flutter/material.dart';
import '../authScreens/loginScreen.dart';
import '../widgets/AuthTextFormField.dart';
import '../widgets/SignButton.dart';
import '../widgets/facebookSigning.dart';
import '../widgets/pageRoute.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
    //TODO----------
  }

  void _alreadyHaveAnAccount() {
    Navigator.push(
      context,
      FadeRoute(
        page: LogInScreen(),
      ),
    );
  }

  Future<void> _signUp() async {
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
                'Create a new Account',
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
              buttonTitle: 'Sign Up',
              onTab: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                _signUp();
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Center(
              child: Text(
                'Already have an account?',
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
                _alreadyHaveAnAccount();
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Sign in',
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
