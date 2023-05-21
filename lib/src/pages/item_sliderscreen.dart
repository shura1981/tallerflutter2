import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ItemSliderScreem extends StatefulWidget {
  final String tag;
  final String image;
  const ItemSliderScreem(this.tag, this.image);

  @override
  State<ItemSliderScreem> createState() => _ItemSliderScreemState();
}

class _ItemSliderScreemState extends State<ItemSliderScreem> {
  final GlobalKey _scaffold = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      body: Column(children: [
        GestureDetector(
          onTap: () {
            _displayBottomDialog(context);
            // _displayDialog(context);
          },
          child: SizedBox(
            height: 400,
            width: double.infinity,
            child: Hero(
                tag: widget.tag,
                child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      widget.image,
                    ))),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text("This seems to work, I don't know if it is right to do"),
        SizedBox(
          height: 30,
        ),
        TextButton(
            onPressed: () {
// _displayBottomDialog(context);
// _displayDialog(context);
              Navigator.pop(context);
            },
            child: Text('modal'))
      ]),
    );
  }

  _displayBottomDialog(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 40, top: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: new Icon(Icons.photo),
                  title: new Text('Photo'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: new Icon(Icons.music_note),
                  title: new Text('Music'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: new Icon(Icons.videocam),
                  title: new Text('Video'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: new Icon(Icons.share),
                  title: new Text('Share'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  _displayDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 10),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return SafeArea(
          child: GestureDetector(
            onTap: () {
              print('click');
              Navigator.of(context).pop();
            },
            child: Scaffold(
              backgroundColor: Colors.black12,
              body: PhotoView(
                gaplessPlayback: false,
                customSize: MediaQuery.of(context).size,
                // enableRotation: true,
                minScale: PhotoViewComputedScale.contained * 1,
//  maxScale: PhotoViewComputedScale.covered * 1.8,
                initialScale: PhotoViewComputedScale.contained,
                backgroundDecoration: BoxDecoration(color: Colors.transparent),
                imageProvider: NetworkImage(
                  widget.image,
                ),
                heroAttributes: PhotoViewHeroAttributes(tag: widget.tag),
              ),
            ),
          ),
        );
      },
    );
  }
}
