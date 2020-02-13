import 'package:flutter/material.dart';
import 'package:infinity/authScreens/checkEmailScreen.dart';
import 'package:infinity/widgets/pageRoute.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  //----------------------------------variables-----------------------//
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _email;
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
      print(':::::::::::::' + _email);
      Navigator.push(
        context,
        FadeRoute(
          page: CheckEmailScreen(),
        ),
      );
    }
  }

  //------------------------------------build-----------------------------//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0,),
          Form(
            key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        hintText: 'Email Address'
                      ),
                      onSaved: onSavedEmail,
                      validator: emailValidator,
                    ),
                  ),
                ],
              )
          ),
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.only(right:16.0,left: 16.0),
            child: GestureDetector(
              onTap: (){
                _forgotPassword();
              },
              child:Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xff008BFF),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Center(
                    child: Text('Continue',style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),

            ),
          )
        ],
      ),
    );
  }
}
