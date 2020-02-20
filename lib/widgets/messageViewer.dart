import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import '../mainScreens/ImageViewer.dart';

class MessageViewer extends StatelessWidget {
  final int id;
  final String type;
  final String content;
  final String date;

  MessageViewer({
    this.id,
    this.content,
    this.type,
    this.date,
  });

  void _showImage(BuildContext context, String image, int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return ImageViewer(
            image: image,
            id: id,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;

    BubbleStyle styleMe = BubbleStyle(
      nip: BubbleNip.rightTop,
      color: Color.fromARGB(255, 225, 255, 199),
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 8.0, left: 50.0),
      alignment: Alignment.topRight,
    );
    BubbleStyle styleSomebody = BubbleStyle(
      nip: BubbleNip.leftTop,
      color: Colors.white,
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 8.0, right: 50.0),
      alignment: Alignment.topLeft,
    );
    return type == 'me'
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Bubble(
                padding: content.substring(0, 4) == 'http'
                    ? BubbleEdges.all(
                        2.0,
                      )
                    : null,
                elevation: 0.5,
                style: styleMe,
                child: content.substring(0, 4) == 'http'
                    ? GestureDetector(
                        onTap: () =>
                            _showImage(context, content.split('-')[1], id),
                        child: Hero(
                          tag: id.toString(),
                          child: Image.asset(
                            content.split('-')[1],
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Text(
                        content,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontFamily: 'Roboto',
                        ),
                        textAlign: TextAlign.end,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  5.0,
                ),
                child: Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Bubble(
                padding: content.substring(0, 4) == 'http'
                    ? BubbleEdges.all(
                        2.0,
                      )
                    : null,
                elevation: 0.5,
                style: styleSomebody,
                child: content.substring(0, 4) == 'http'
                    ? GestureDetector(
                        onTap: () =>
                            _showImage(context, content.split('-')[1], id),
                        child: Hero(
                          tag: id.toString(),
                          child: Image.asset(
                            content.split('-')[1],
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Text(
                        content,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontFamily: 'Roboto',
                        ),
                        textAlign: TextAlign.end,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  5.0,
                ),
                child: Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ],
          );
  }
}
