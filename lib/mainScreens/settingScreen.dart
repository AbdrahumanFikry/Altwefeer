import 'package:flutter/material.dart';
import '../mainScreens/accountInfo.dart';
import '../widgets/pageRoute.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  //----------------------------variables---------------------------------------
  bool switchOn = true;
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
          'Do you want to delete this Account?',
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
            onPressed: () {
              Navigator.of(context).pop(true);
              //TODO ------------
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
    //TODO -----------------
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
                          color:
                              selected == 'Arabic' ? Colors.blue : Colors.grey,
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
                                      child: Center(child: Icon(Icons.done,size: 15.0,)),
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
                          color:
                              selected == 'English' ? Colors.blue : Colors.grey,
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
                                          color: Colors.blue,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
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
          ),
        ],
      ),
    );
  }
}
