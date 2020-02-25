import 'package:flutter/material.dart';
import 'package:infinity/widgets/loader.dart';
import '../widgets/globalTextFormField.dart';
import '../widgets/globalButton.dart';
import '../authScreens/checkEmailScreen.dart';
import '../widgets/pageRoute.dart';
import '../widgets/GlobalDialog.dart';
import '../models/httpExceptionModel.dart';
import '../Providers/Auth.dart';
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
        _showErrorDialog(errorMessage);
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        const errorMessage = 'error sending code to this email!';
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
