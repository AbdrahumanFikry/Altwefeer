import 'dart:math';

import 'package:flutter/material.dart';
import 'package:infinity/widgets/GlobalDialog.dart';
import 'package:infinity/widgets/loader.dart';
import 'package:provider/provider.dart';
import '../authScreens/loginScreen.dart';
import '../widgets/globalTextFormField.dart';
import '../widgets/globalButton.dart';
import '../widgets/facebookSigning.dart';
import '../widgets/pageRoute.dart';
import '../Providers/Auth.dart';
import '../models/httpExceptionModel.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //-------------------------------variables------------------------------------
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _email, _password;
  bool _isLoading = false;

  //--------------------------------methods-------------------------------------
  String emailValidator(value) {
    if (value.isEmpty || !value.contains('@')) {
      return 'Invalid email!';
    }
    return null;
  }

  String passwordValidator(value) {
    if (value.isEmpty || value.length < 6) {
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
//      print(':::::::::::::' + _email);
//      print(':::::::::::::' + _password);
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<Auth>(context, listen: false)
            .register(email: _email, password: _password);
        setState(() {
          _isLoading = false;
        });
      } on HttpException catch (error) {
        var errorMessage = 'check email and password and try again';
        if (error.toString().contains('The email has already been taken.')) {
          errorMessage = 'The email has already been taken';
        } else if (error
            .toString()
            .contains('The email must be a valid email address.')) {
          errorMessage = 'The email must be a valid email address';
        } else if (error.toString().contains('Done')) {
          errorMessage = 'a verification code was sent to your email';
        }
        _showErrorDialog(errorMessage);
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        const errorMessage = 'check email and password and try again';
        _showErrorDialog(errorMessage);
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (ctx) => GlobalDialog(
        header: 'Validation',
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              errorMessage,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontFamily: 'Roboto',
              ),
              softWrap: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Ok',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 18.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              GlobalTextFormField(
                hintText: 'Email Address',
                onSaved: onSavedEmail,
                validator: emailValidator,
                isPassword: false,
              ),
              GlobalTextFormField(
                hintText: 'Password',
                onSaved: onSavedPassword,
                validator: passwordValidator,
                isPassword: true,
              ),
              _isLoading
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 10.0,
                      ),
                      child: Center(
                        child: ColorLoader(),
                      ),
                    )
                  : GlobalButton(
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
                        color: Color(0xff008BFF),
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
      ),
    );
  }
}
