import 'package:flutter/material.dart';
import 'package:infinity/widgets/alertDialog.dart';
import 'package:infinity/widgets/phoneNumberInput.dart';
import '../widgets/globalDialog.dart';
import '../widgets/loader.dart';
import 'package:provider/provider.dart';
import '../authScreens/loginScreen.dart';
import '../widgets/globalTextFormField.dart';
import '../widgets/globalButton.dart';
import '../widgets/facebookSigning.dart';
import '../widgets/pageRoute.dart';
import '../Providers/authenticationProvider.dart';
import '../models/httpExceptionModel.dart';
import '../mainScreens/bottomNavigationScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //-------------------------------variables------------------------------------
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _email, _password, _phoneNumber, _code = '+20';
  bool _isLoading = false;

  //--------------------------------methods-------------------------------------
  void _skip() {
    Navigator.pushReplacement(
      context,
      ScaleRoute(
        page: BottomNavigationScreen(),
      ),
    );
  }

  String emailValidator(value) {
    if (value.isEmpty || !value.contains('@')) {
      return 'Invalid email!';
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

  void onCodeChanged(value) {
    setState(() {
      _code = value;
    });
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  void onSavedPhone(value) {
    _phoneNumber = value;
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
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<Auth>(context, listen: false).register(
            email: _email,
            password: _password,
            phoneNumber: _code + _phoneNumber);
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
        } else if (error
            .toString()
            .contains('The phone has already been taken.')) {
          errorMessage = 'The phone has already been taken';
        }
        GlobalAlertDialog().showErrorDialog(errorMessage, context);
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        const errorMessage = 'check email and password and try again';
        GlobalAlertDialog().showErrorDialog(errorMessage, context);
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      onTap: _skip,
                    ),
                  ],
                ),
              ),
//              FaceBookSigning(
//                onTab: () {
//                  FocusScope.of(context).requestFocus(new FocusNode());
//                  _facebookSignUp();
//                },
//              ),
//              SizedBox(
//                height: 30.0,
//              ),
//              //----------------------------Divider-------------------------------
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Container(
//                    width: MediaQuery.of(context).size.width * 0.45,
//                    height: 1.0,
//                    color: Color(0xffCFCFCF),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.only(
//                      right: 8.0,
//                      left: 8.0,
//                    ),
//                    child: Text(
//                      'Or',
//                      style: TextStyle(
//                        color: Color(0xffCFCFCF),
//                      ),
//                    ),
//                  ),
//                  Container(
//                    width: MediaQuery.of(context).size.width * 0.45,
//                    height: 1.0,
//                    color: Color(0xffCFCFCF),
//                  ),
//                ],
//              ),
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
                        color: Color(0xffD89900),
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
