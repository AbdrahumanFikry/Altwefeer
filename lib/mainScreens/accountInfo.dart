import 'package:flutter/material.dart';
import '../widgets/accountInfoWidget.dart';

class AccountInfoScreen extends StatefulWidget {
  @override
  _AccountInfoScreenState createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  //-------------------------------variables------------------------------------
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _name, _email, _password;
  bool _edit = false;

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
      print(':::::::::::::' + _name);
      print(':::::::::::::' + _email);
      print(':::::::::::::' + _password);
      //TODO ---------
      setState(() {
        _edit = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          _edit
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
                        color: Colors.blue,
                        fontSize: 18.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                )
              : GestureDetector(
            onTap: (){
                setState(() {
                  _edit = true;
                });
            },
              child: Container(child: Image.asset('assets/icons/edit.png'))),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            AccountInfoWidget(
              title: 'Mohammed Esaam',
              onSaved: onSavedName,
              validator: nameValidator,
              edit: _edit,
            ),
            AccountInfoWidget(
              title: 'me6636366@gmail.com',
              onSaved: onSavedEmail,
              validator: emailValidator,
              edit: _edit,
            ),
            AccountInfoWidget(
              title: 'Change password',
              onSaved: onSavedPassword,
              validator: passwordValidator,
              edit: _edit,
              isPassword: true,
              password: '123456789',
            ),
          ],
        ),
      ),
    );
  }
}
