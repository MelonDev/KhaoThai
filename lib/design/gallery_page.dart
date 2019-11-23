import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_khao_thai/design/CustomDialog.dart';
import 'package:new_khao_thai/design/image_preview.dart';
import 'package:new_khao_thai/frailty_route.dart';
import 'package:new_khao_thai/model/ItemData.dart';

class GalleryPage extends StatefulWidget {
  final ItemData itemData;

  GalleryPage({Key key, this.itemData}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      //child: _getMainLayout(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _getMainLayout(),
      ),
    );
  }

  Widget _getMainLayout() {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'images/paddy.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Colors.black38,
          child: BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (BuildContext context) => CustomDialog(
                            englishWord: "All pictures",
                            thaiWord: "รูปภาพทั้งหมด",
                          ),
                        );
                      },
                      padding:
                      EdgeInsets.only(right: 0, top: 2, bottom: 10),
                      child: Icon(
                        CupertinoIcons.volume_up,
                        color: Colors.white,
                      ))
                ],
                title: Text("รูปภาพทั้งหมด",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SukhumvitSet',
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                backgroundColor: Colors.black54,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: GridView.count(
                crossAxisCount: 2,
                children:
                    new List<Widget>.generate(_getImageList().length, (index) {
                  return GridTile(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          FrailtyRoute(
                              builder: (BuildContext context) =>
                                  ImagePreview(_getImageList()[index])));
                    },
                    child: Padding(
                      child: Image.asset(
                        _getImageList()[index],
                        fit: BoxFit.cover,
                      ),padding: EdgeInsets.only(left: 1,right: 1,top: 1,bottom: 1),
                    ),
                  ));
                }),
              ),
            ),
          ),
        )
      ],
    );
  }

  List<String> _getImageList() {
    List<String> list = [];
    list.add(widget.itemData.image);
    if(widget.itemData.gallery != null){
      list.addAll(widget.itemData.gallery);
    }
    return list;
  }

  int _getImageCount() {
    if (widget.itemData.gallery != null) {
      return 1 + widget.itemData.gallery.length;
    } else {
      return 1;
    }
  }
}
