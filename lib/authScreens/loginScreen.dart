import 'package:flutter/material.dart';
import 'package:infinity/widgets/alertDialog.dart';
import '../mainScreens/bottomNavigationScreen.dart';
import 'package:provider/provider.dart';
import '../authScreens/forgotPasswordScreen.dart';
import '../authScreens/SignUpScreen.dart';
import '../widgets/globalTextFormField.dart';
import '../widgets/globalButton.dart';
import '../widgets/facebookSigning.dart';
import '../widgets/pageRoute.dart';
import '../widgets/globalDialog.dart';
import '../Providers/authenticationProvider.dart';
import '../models/httpExceptionModel.dart';
import '../widgets/loader.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  //-------------------------------variables------------------------------------
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _email, _password;
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
    Navigator.push(
      context,
      FadeRoute(
        page: SignUpScreen(),
      ),
    );
  }

  void _forgotPassword() {
    Navigator.push(
      context,
      FadeRoute(
        page: ForgotPasswordScreen(),
      ),
    );
  }

  Future<void> _login() async {
    final formData = _formKey.currentState;
    if (formData.validate()) {
      formData.save();
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<Auth>(context, listen: false)
            .logIn(email: _email, password: _password);
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushReplacement(
          FadeRoute(
            page: BottomNavigationScreen(),
          ),
        );
      } on HttpException catch (error) {
        var errorMessage = 'check email and password and try again';
        if (error.toString().contains('The email has already been taken.')) {
          errorMessage = 'The email has already been taken';
        } else if (error
            .toString()
            .contains('The email must be a valid email address.')) {
          errorMessage = 'The email must be a valid email address';
        } else if (error.toString().contains('you must verify your email')) {
          errorMessage = 'you must verify your email';
        } else if (error.toString().contains('Done')) {
          errorMessage = 'a verification code was sent to your email';
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
                  'Login to your Account',
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(
                height: 105.0,
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
