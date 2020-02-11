import 'package:flutter/material.dart';
import '../widgets/detailSlider.dart';
import '../widgets/detailSliverList.dart';
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Builder(
            builder: (context) => CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Color(0xffF0F4F9),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: IconButton(
                              icon: Icon(Icons.arrow_back,),
                              onPressed: () {
                                //TODO -------
                              }),
                        ),
                      ),
                      actions: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffF0F4F9),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: IconButton(
                                icon: Icon(Icons.favorite_border,),
                                onPressed: () {
                                  //TODO -------
                                }),
                          ),
                        ),
                      ],
                      backgroundColor: Colors.white,
                      expandedHeight: 260.0,
                      pinned: true,
                      floating: false,
                      flexibleSpace: new FlexibleSpaceBar(
                          collapseMode: CollapseMode.pin,
                          titlePadding: EdgeInsets.only(
                              left: 20.0, bottom: 5.0, right: 20.0, top: 5.0),
                          centerTitle: true,
                          title: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Padding(
                              padding: const EdgeInsets.only(right:10.0,left: 10.0),
                              child: new Text(
                                "Samsung Galaxy Note10 - 6.3-inch 256GB/8GB Dual SIM 4G Mobile Phone - Aura Black",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10.0),
                                //overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                            ),
                          ),
                          background: DetailSlider(),
                    ),
                    ),
                    DetailSliverList(),
                  ],
                )),
      ),
    );
  }
}
