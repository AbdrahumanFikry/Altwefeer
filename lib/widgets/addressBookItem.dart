import 'package:flutter/material.dart';

class AddressBookItem extends StatelessWidget {
  final Function whereToGo;

  AddressBookItem({
    this.whereToGo,
  });

  void _edit() {
    //TODO -------
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          GestureDetector(
            onTap: whereToGo,
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text(
                          'Mohammed Essam',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
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
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.outlined_flag,
                      ),
                      Text(
                        'Almaadi, Ahmed Saad 21',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(
                  5.0,
                ),
                child: GestureDetector(
                  onTap: _edit,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff505050),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.5,
                      vertical: 7.5,
                    ),
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.edit,
                            size: 16.0,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Text(
                            'edit address',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
