import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final String image;
  final List<String> images;
  final int id;

  ImageViewer({
    @required this.image,
    @required this.id,
    this.images,
  });

  @override
  Widget build(BuildContext context) {
    PageController _pageController = new PageController();

    if (images != null) {
      _pageController = new PageController(
        initialPage: (id - 1),
        keepPage: false,
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: images == null
          ? Center(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            )
          : PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
              reverse: true,
              itemBuilder: (context, index) {
                return index != (id - 1)
                    ? Image.asset(
                        images[index],
                      )
                    : Hero(
                        tag: id.toString(),
                        child: Image.asset(
                          images[index],
                        ),
                      );
              },
            ),
    );
  }
}
