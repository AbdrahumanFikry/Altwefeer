import 'package:flutter/material.dart';
import '../mainScreens/addAddressScreen.dart';
import '../widgets/pageRoute.dart';

class AddressBookItem extends StatelessWidget {
  final int index;
  final int groupValue;
  final Function onChanged;
  final bool showOnly;

  AddressBookItem({
    this.index,
    this.groupValue,
    this.onChanged,
    this.showOnly,
  });

  void _edit(BuildContext context) {
    Navigator.of(context).push(
      FadeRoute(
        page: AddAddressScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: <Widget>[
              showOnly
                  ? SizedBox(
                      width: 45.0,
                    )
                  : Radio(
                      value: index,
                      groupValue: groupValue,
                      onChanged: onChanged,
                    ),
              Text(
                'Mohammed Essam',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () => _edit(context),
                child: Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 18.0,
                    child: Image.asset('assets/icons/edit.png'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 45.0,
              ),
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
          SizedBox(
            height: 10.0,
          ),
          Divider(
            height: 1.0,
            color: Colors.grey,
            indent: 0.0,
          ),
        ],
      ),
    );
  }
}
