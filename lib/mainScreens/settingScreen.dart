import 'package:flutter/material.dart';
import '../mainScreens/bottomNavigationScreen.dart';
import '../widgets/loader.dart';
import '../widgets/GlobalDialog.dart';
import '../mainScreens/accountInfo.dart';
import '../widgets/pageRoute.dart';
import '../models/httpExceptionModel.dart';
import 'package:provider/provider.dart';
import '../Providers/Auth.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  //----------------------------variables---------------------------------------
  bool switchOn = true, _isLoading = false;
  String selected = 'Arabic';

  //-----------------------------methods----------------------------------------
  void _onSwitchChanged(bool value) {
    setState(() {
      switchOn = !switchOn;
    });
    //TODO -------------
  }

  void _goToAccountInfo() {
    Navigator.of(context).push(
      FadeRoute(
        page: AccountInfoScreen(),
      ),
    );
  }

  void _selectArabic() {
    setState(() {
      selected = 'Arabic';
    });
  }

  void _selectEnglish() {
    setState(() {
      selected = 'English';
    });
  }

  Future<void> _deleteAccount() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Are you sure ?',
          style: TextStyle(color: Colors.blue),
        ),
        content: Text(
          "Once you delete your account you can't register with the same account again, anu confirmed oreders still on process",
          style: TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('No'),
          ),
          FlatButton(
            onPressed: () async {
              Navigator.of(context).pop(true);
              setState(() {
                _isLoading = true;
              });

              try {
                await Provider.of<Auth>(context, listen: false)
                    .deactivateAccount();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => BottomNavigationScreen(),
                  ),
                  (Route<dynamic> route) => false,
                );
                setState(() {
                  _isLoading = false;
                });
              } on HttpException catch (error) {
                var errorMessage = 'error deleting this account';
                if (error
                    .toString()
                    .contains('You are not authenticated for this request.')) {
                  errorMessage = 'You are not authenticated for this request.';
                }
                _showErrorDialog(errorMessage);
                setState(() {
                  _isLoading = false;
                });
              } catch (error) {
                const errorMessage = 'error deleting this account';
                _showErrorDialog(errorMessage);
                setState(() {
                  _isLoading = false;
                });
              }
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
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
    return Scaffold(
      backgroundColor: Colors.white,
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
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: _goToAccountInfo,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(
                    5.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Account Info',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(
                  5.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Notifications',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    Spacer(),
                    Switch(
                      value: switchOn,
                      onChanged: _onSwitchChanged,
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Language',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: _selectArabic,
                      child: Container(
                        decoration: BoxDecoration(
                          color: selected == 'Arabic'
                              ? Color(0xffD89900)
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 2.0,
                        ),
                        child: Row(
                          children: <Widget>[
                            selected == 'Arabic'
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7.0,
                                      vertical: 3.0,
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 10.0,
                                      child: Center(
                                          child: Icon(
                                        Icons.done,
                                        color: Color(0xffD89900),
                                        size: 15.0,
                                      )),
                                    ),
                                  )
                                : SizedBox(
                                    height: 26.0,
                                    width: 28.0,
                                  ),
                            Text(
                              'العربيه',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: _selectEnglish,
                      child: Container(
                        decoration: BoxDecoration(
                          color: selected == 'English'
                              ? Color(0xffD89900)
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 2.0,
                        ),
                        child: Row(
                          children: <Widget>[
                            selected == 'English'
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7.0,
                                      vertical: 3.0,
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 10.0,
                                      child: Center(
                                        child: Icon(
                                          Icons.done,
                                          color: Color(0xffD89900),
                                          size: 15.0,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    height: 26.0,
                                    width: 28.0,
                                  ),
                            Text(
                              'English',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Consumer<Auth>(
            builder: (context, auth, child) => auth.isAuth
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _isLoading
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20.0,
                                  ),
                                  child: ColorLoader(
                                    color1: Colors.black,
                                  ),
                                ),
                              ],
                            )
                          : InkWell(
                              onTap: _deleteAccount,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 10.0,
                                ),
                                child: Text(
                                  'Delete account',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                            ),
                    ],
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
