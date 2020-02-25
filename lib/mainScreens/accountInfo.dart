import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/accountInfoWidget.dart';
import '../Providers/Auth.dart';
import '../widgets/GlobalDialog.dart';
import '../models/httpExceptionModel.dart';
import '../widgets/EmptyScreen.dart';

class AccountInfoScreen extends StatefulWidget {
  @override
  _AccountInfoScreenState createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  //-------------------------------variables------------------------------------
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _name, _email, _password;
  bool _edit = false, _isLoading = false;

  //--------------------------------methods-------------------------------------
  String nameValidator(value) {
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

  void onSavedName(value) {
    _name = value;
  }

  void onSavedEmail(value) {
    _email = value;
  }

  void onSavedPassword(value) {
    _password = value;
  }

  Future<void> _update() async {
    final formData = _formKey.currentState;
    if (formData.validate()) {
      formData.save();
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<Auth>(context, listen: false)
            .updateUserData(email: _email, password: _password, name: _name);
        setState(() {
          _isLoading = false;
        });
      } on HttpException catch (error) {
        var errorMessage = 'check email and password and try again';
        if (error.toString().contains('The email has already been taken.')) {
          errorMessage = 'The email has already been taken';
        }
        _showErrorDialog(errorMessage);
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        const errorMessage = 'check internet connection and try again';
        _showErrorDialog(errorMessage);
        setState(() {
          _isLoading = false;
        });
      }
      setState(() {
        _edit = false;
      });
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
    final auth = Provider.of<Auth>(context, listen: false);
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
                  ? InkWell(
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
                      onTap: () {
                        setState(() {
                          _edit = true;
                        });
                      },
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
          ? ListView(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                AccountInfoWidget(
                  title: auth.userData.name,
                  onSaved: onSavedName,
                  validator: nameValidator,
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
            )
          : EmptyScreen(
              needSign: true,
              title: 'Sign in Now!',
              subTitle: 'you need to sign in to view this items',
            ),
    );
  }
}
