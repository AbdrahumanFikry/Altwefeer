import 'package:flutter/material.dart';
import 'package:infinity/authScreens/loginScreen.dart';
import 'package:infinity/widgets/alertDialog.dart';
import 'package:infinity/widgets/loader.dart';
import 'package:infinity/widgets/pageRoute.dart';
import 'package:provider/provider.dart';
import '../widgets/accountInfoWidget.dart';
import '../Providers/authenticationProvider.dart';
import '../models/httpExceptionModel.dart';
import '../widgets/EmptyScreen.dart';

class AccountInfoScreen extends StatefulWidget {
  @override
  _AccountInfoScreenState createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  //-------------------------------variables------------------------------------
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _oldPhone, _oldEmail, _phoneNumber, _email, _password;
  bool _edit = false, _isLoading = false;

  //--------------------------------methods-------------------------------------
  String phoneValidator(value) {
    if (value.isEmpty) {
      return 'This field is required!';
    }
    return null;
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

  void onSavedPhone(value) {
    if (value == _oldPhone) {
      _phoneNumber = null;
    } else {
      _phoneNumber = value;
    }
  }

  void onSavedEmail(value) {
    if (value == _oldEmail) {
      _email = null;
    } else {
      _email = value;
    }
  }

  void onSavedPassword(value) {
    _password = value;
  }

  void edit() {
    GlobalAlertDialog().showErrorDialog(
        'if you changed your email,\nyou will be signed out until you verify the new email',
        context);
    setState(() {
      _edit = true;
    });
  }

  Future<void> _update() async {
    final formData = _formKey.currentState;
    if (formData.validate()) {
      formData.save();
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<Auth>(context, listen: false).updateUserData(
            email: _email, password: _password, phone: _phoneNumber);
        setState(() {
          _isLoading = false;
        });
      } on HttpException catch (error) {
        var errorMessage = 'check email and password and try again';
        if (error.toString().contains('The email has already been taken.')) {
          errorMessage = 'The email has already been taken';
          GlobalAlertDialog().showErrorDialog(errorMessage, context);
        } else if (error.toString().contains('email updated')) {
          errorMessage = 'The email has already been taken';
          GlobalAlertDialog().showErrorDialog(errorMessage, context);
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => LogInScreen(),
            ),
            (Route<dynamic> route) => false,
          );
        }
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        const errorMessage = 'check internet connection and try again';
        GlobalAlertDialog().showErrorDialog(errorMessage, context);
        setState(() {
          _isLoading = false;
        });
      }
      setState(() {
        _edit = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    _oldEmail = auth.userData.email;
    _oldPhone = auth.userData.phone;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        title: Text(
          'Settings',
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
        actions: <Widget>[
          auth.isAuth
              ? _edit
                  ? _isLoading
                      ? LineLoader()
                      : InkWell(
                          onTap: _update,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 10.0,
                            ),
                            child: Text(
                              'Done',
                              style: TextStyle(
                                color: Color(0xffD89900),
                                fontSize: 18.0,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        )
                  : GestureDetector(
                      onTap: edit,
                      child: Container(
                        child: Image.asset(
                          'assets/icons/edit.png',
                        ),
                      ),
                    )
              : Container(),
        ],
      ),
      body: auth.isAuth
          ? Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  AccountInfoWidget(
                    title: auth.userData.phone,
                    onSaved: onSavedPhone,
                    validator: phoneValidator,
                    edit: _edit,
                  ),
                  AccountInfoWidget(
                    title: auth.userData.email,
                    onSaved: onSavedEmail,
                    validator: emailValidator,
                    edit: _edit,
                  ),
                  AccountInfoWidget(
                    title: 'Password (encrypted)',
                    onSaved: onSavedPassword,
                    validator: passwordValidator,
                    edit: _edit,
                    isPassword: true,
                    password: '',
                  ),
                ],
              ),
            )
          : EmptyScreen(
              needSign: true,
              title: 'Sign in Now!',
              subTitle: 'you need to sign in to view this items',
            ),
    );
  }
}
