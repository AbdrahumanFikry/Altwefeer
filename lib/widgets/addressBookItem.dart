import 'package:flutter/material.dart';


class AddressBookItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
        itemBuilder: (context,index){
          return Column(
            children: <Widget>[
              SizedBox(height: 5.0,),
             GestureDetector(
               onTap: (){
                 //ToDo
               },
               child: Container(
                 child: Column(
                   children: <Widget>[
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(left:6.0),
                           child: Text('Mohammed Essam',style: TextStyle(
                             color: Colors.black,
                             fontWeight: FontWeight.bold,
                             fontSize: 14.0,
                             fontFamily: 'Roboto',
                           ),),
                         ),
                         Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                       ],
                     ),
                     Row(
                       children: <Widget>[
                         Icon(Icons.outlined_flag,),
                         Text('Almaadi, Ahmed Saad 21'),
                       ],
                     ),
                   ],
                 ),
               ),
             ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: (){
                        //TOdO
                      },
                      child: Container(
                        height: 35.0,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Color(0xff505050),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.edit,
                                  size: 20.0,
                                  color: Colors.white,
                                ),
                                Text('edit address',style: TextStyle(
                                  color: Colors.white
                                ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Divider(height: 20.0,),
            ],
          );
        }
    );
  }
}
