import 'package:flutter/material.dart';
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  //------------------------------------------------------------------//
  //show or hide password//
  bool _obscureText = true;
  void hideAndShowPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  //function to make sign with facebook btn
  Widget buildFbBtn(){
    return Padding(
      padding: const EdgeInsets.only(right: 43,left: 43),
      child: GestureDetector(
        onTap: (){
          //--------------------------------------------------------//
        },
        child: Container(
          height: 42,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xff1877F2),
            borderRadius: BorderRadius.circular(100.0),
          ),
          child:
          Center(
            child: Text('Sign With Facebook',style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),),
          ),
        ),
      ),
    );
  }
  //function to make divider in ui//
  Widget buildDivider(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width*0.45,
          height: 1.0,
          color: Color(0xffCFCFCF),
        ),
        Padding(
          padding: const EdgeInsets.only(right:8.0,left: 8.0),
          child: Text('Or',style: TextStyle(color: Color(0xffCFCFCF)),),
        ),
        Container(
          width: MediaQuery.of(context).size.width*0.45,
          height: 1.0,
          color: Color(0xffCFCFCF),
        ),
      ],
    );
  }
  //function to make sign up form//
  Widget buildFormSignUp(){
    return Form(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right:16.0,left: 16.0),
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16.0),
                    border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(40.0)),
                    hintText: 'Email Address'
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.only(right:16.0,left: 16.0),
              child: TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye,size: 20.0,), onPressed: hideAndShowPassword),
                  contentPadding: EdgeInsets.all(16.0),
                  border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(40.0)),
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 28.0,),
            Padding(
              padding: const EdgeInsets.only(right:16.0,left: 16.0),
              child: GestureDetector(
                onTap: (){
                  //--------------------------------------------------------//
                },
                child: Container(
                  height: 48,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Colors.black,
                  ),
                  child: Center(child: Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 16.0),),),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(child: Text('Already have an account?',style: TextStyle(
              color: Color(0xff707070),
              fontSize: 16.0,
            ),),),
            SizedBox(height: 4.0,),
            GestureDetector(
              onTap: (){
                //--------------------------------------------------------//
              },
              child: Container(
                child: Center(child: Text('Sign in',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),),),
              ),
            ),
            SizedBox(height: 10.0,),
          ],
        )
    );
  }
  //-------------------------------------------------------------------//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 90.0,),
          buildFbBtn(),
          SizedBox(height: 52.5,),
          buildDivider(),
          SizedBox(height: 25.0,),
          Center(
            child: Text('Create New Account',style: TextStyle(
                color: Color(0xff707070),
                fontSize: 18.0
            ),),
          ),
          SizedBox(height: 20.0,),
          buildFormSignUp(),
        ],
      ),
    );
  }
}
