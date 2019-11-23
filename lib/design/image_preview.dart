import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImagePreview extends StatelessWidget {
  final String path;

  ImagePreview(this.path);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            PhotoView(
              minScale: PhotoViewComputedScale.contained * 1,
              maxScale: PhotoViewComputedScale.covered * 5,
              imageProvider: AssetImage(path),
            ),
            SafeArea(
              child: FlatButton(
                splashColor: Colors.black,
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 0, top: 16),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Icon(Icons.clear,color: Colors.black,size: 30,),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
