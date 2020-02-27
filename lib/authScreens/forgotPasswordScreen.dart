import 'package:flutter/material.dart';
import 'package:infinity/widgets/alertDialog.dart';
import 'package:infinity/widgets/loader.dart';
import '../widgets/globalTextFormField.dart';
import '../widgets/globalButton.dart';
import '../authScreens/checkEmailScreen.dart';
import '../widgets/pageRoute.dart';
import '../widgets/globalDialog.dart';
import '../models/httpExceptionModel.dart';
import '../Providers/authenticationProvider.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  //----------------------------------variables-----------------------//
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _email;
  bool _isLoading = false;

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
//      print(':::::::::::::' + _email);
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<Auth>(context, listen: false)
            .forgotPassword(email: _email);
        Navigator.pushReplacement(
          context,
          FadeRoute(
            page: CheckEmailScreen(),
          ),
        );
        setState(() {
          _isLoading = false;
        });
      } on HttpException catch (error) {
        var errorMessage = 'error sending code to this email!';
        if (error.toString().contains('error')) {
          errorMessage = 'error sending code to this email!';
        }
        GlobalAlertDialog().showErrorDialog(errorMessage, context);
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        const errorMessage = 'error sending code to this email!';
        GlobalAlertDialog().showErrorDialog(errorMessage, context);
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  //------------------------------------build----------------------------------
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: _isLoading
            ? Center(
                child: ColorLoader(),
              )
            : Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    GlobalTextFormField(
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
      ),
    );
  }
}
