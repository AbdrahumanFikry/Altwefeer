import 'package:flutter/material.dart';
import '../authScreens/loginScreen.dart';
import '../widgets/pageRoute.dart';

class CheckEmailScreen extends StatelessWidget {
  void _goToLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      SizeRoute(
        page: LogInScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Center(
                child: Text(
                  'Check your Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Center(
                child: Text(
                  'We sent you link to reset your password',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 12.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 16.0,
                  left: 16.0,
                ),
                child: GestureDetector(
                  onTap: () => _goToLoginScreen(context),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xffD89900),
                      borderRadius: BorderRadius.circular(
                        40.0,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
