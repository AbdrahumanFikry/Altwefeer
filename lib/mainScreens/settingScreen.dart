import 'package:flutter/material.dart';
import 'package:infinity/mainScreens/accountInfo.dart';
import 'package:infinity/widgets/pageRoute.dart';

class SettingScreen extends StatelessWidget {
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
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0,),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                ScaleRoute(
                  page: AccountInfoScreen(),
                ),
              );
            },
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
                          fontFamily: 'Roboto'),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Language',style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: 'Roboto'
                ),),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        //todo---------
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text('عربي',style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        //todo---------
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color(0xff008BFF),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text('English',style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                          ),),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
