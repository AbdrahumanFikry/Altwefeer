import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/GlobalDialog.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../widgets/messageViewer.dart';

class SupportScreen extends StatefulWidget {
  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  //------------------------------ variables -----------------------------------
  TextEditingController messageController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File _image;
  List<Widget> _messages = [
//    MessageViewer(
//      type: 'me',
//      date: '12/5/2020',
//      content: 'http-assets/images/iphoneTest.png',
//    ),
//    MessageViewer(
//      type: 'else',
//      date: '12/5/2020',
//      content: 'Hello from the other side ',
//    ),
//    MessageViewer(
//      type: 'me',
//      date: '12/5/2020',
//      content: 'Hello',
//    ),
  ];

  //-------------------------------- methods -----------------------------------

  void _fetchMessages() {
//    Provider.of<Support>(context).messages;
//    _messages = [];
//    final messages = Provider.of<Support>(context, listen: false).messages;
//    print(messages.length.toString());
//    for (var message in messages) {
//      final newMessage = MessageViewer(
//        type: 'me',
//        content: message,
//        date: '20/2/2020',
//      );
//      _messages.add(newMessage);
//    }
  }

  void _action() {
    FocusScope.of(context).requestFocus(new FocusNode());
    showDialog(
      context: context,
      builder: (ctx) => GlobalDialog(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: _openCamera,
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.camera,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  Text(
                    'Camera',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: _openGallery,
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.photo_size_select_actual,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  Text(
                    'Gallery',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
        header: 'Choose method',
      ),
    );
  }

  Future _openCamera() async {
    Navigator.of(context).pop();
    var image = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512,
      maxWidth: 512,
    );
    setState(() {
      _image = image;
    });
    print(':::::::::::::' + _image.path);
  }

  Future _openGallery() async {
    Navigator.of(context).pop();
    var image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    setState(() {
      _image = image;
    });
    print(':::::::::::::' + _image.path);
  }

  Future<void> _send(String message) async {
    final formData = _formKey.currentState;
    if (formData.validate()) {
      formData.save();
      print('message :::: ' + message);
//      Provider.of<Support>(context, listen: false).sendMessage(message);
    }
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _fetchMessages();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          'Support',
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
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: _messages.isEmpty
              ? Container(
                  height: MediaQuery.of(context).size.height - 90,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Spacer(),
                      Text(
                        'Need help?',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Text(
                          "Feel free to talk to us and we we'll reply as fast as possible",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 5.0,
                                left: 16.0,
                                bottom: 10.0,
                              ),
                              child: TextFormField(
                                controller: messageController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(
                                    16.0,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      40.0,
                                    ),
                                  ),
                                  hintText: 'Type a meesage',
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      _send(messageController.text);
                                      messageController.clear();
                                    },
                                    child: Icon(
                                      Icons.send,
                                      color: Colors.black,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: _action,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 16.0,
                                left: 5.0,
                                bottom: 10.0,
                              ),
                              child: Icon(
                                Icons.photo_filter,
                                color: Colors.grey,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.vertical -
                          120,
                      width: double.infinity,
                      child: ListView(
                        reverse: true,
                        padding: EdgeInsets.only(
                          top: 8.0,
                          right: 8.0,
                          left: 8.0,
                        ),
                        children: _messages,
                      ),
                    ),
                    //-------------------------Send Field-----------------------
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 5.0,
                              left: 16.0,
                              bottom: 10.0,
                            ),
                            child: TextFormField(
                              controller: messageController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(
                                  16.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    40.0,
                                  ),
                                ),
                                hintText: 'Type a meesage',
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _send(messageController.text);
                                    messageController.clear();
                                  },
                                  child: Icon(
                                    Icons.send,
                                    color: Colors.black,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: _action,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 16.0,
                              left: 5.0,
                              bottom: 10.0,
                            ),
                            child: Icon(
                              Icons.photo_filter,
                              color: Colors.grey,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
